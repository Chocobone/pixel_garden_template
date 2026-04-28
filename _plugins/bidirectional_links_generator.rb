# frozen_string_literal: true
require 'json'
require 'uri'

class BidirectionalLinksGenerator < Jekyll::Generator
  safe true
  priority :high

  def generate(site)
    all_notes = site.collections['notes'] ? site.collections['notes'].docs : []
    all_pages = site.pages
    all_docs = all_notes + all_pages

    # Build a title → doc lookup table for performance
    link_map = {}
    all_docs.each do |doc|
      title = doc.data['title']
      filename = File.basename(doc.basename, File.extname(doc.basename))

      link_map[title.downcase] = doc if title
      link_map[filename.downcase] = doc
    end

    all_docs.each do |current_note|
      next unless current_note.content

      # Convert Obsidian image embeds: ![[image.png|width]]
      current_note.content.gsub!(/!\[\[(.*?)\]\]/) do |_match|
        parts = $1.split('|')
        raw_path = parts[0].strip
        filename = File.basename(raw_path)
        encoded_path = URI.encode_www_form_component(filename).gsub('+', '%20')

        extra = parts[1] ? parts[1].strip : nil
        width_attr = ""
        alt_text = filename

        if extra
          if extra =~ /^\d+$/
            width_attr = " width=\"#{extra}\""
          elsif extra =~ /^(\d+)x(\d+)$/
            width_attr = " width=\"#{$1}\" height=\"#{$2}\""
          else
            alt_text = extra
          end
        end

        "<img src=\"#{site.baseurl}/assets/images/#{encoded_path}\"#{width_attr} alt=\"#{alt_text}\" class=\"obsidian-img\">"
      end

      # Convert Obsidian internal links: [[Link|Alias]]
      current_note.content.gsub!(/\[\[(.*?)\]\]/) do |_match|
        content = $1.split('|')
        target_query = content[0].strip.downcase
        display_text = content[1] ? content[1].strip : content[0].strip

        if link_map[target_query]
          target_doc = link_map[target_query]
          "<a class='internal-link' href='#{site.baseurl}#{target_doc.url}'>#{display_text}</a>"
        else
          "<span title='Note not found' class='invalid-link'><span class='invalid-link-brackets'>[[</span>#{display_text}<span class='invalid-link-brackets'>]]</span></span>"
        end
      end
    end

    generate_backlinks(site, all_docs, link_map)
  end

  def generate_backlinks(site, all_docs, link_map)
    all_docs.each do |doc|
      doc.data['backlinks'] ||= []
    end

    all_docs.each do |source_doc|
      next unless source_doc.content

      source_doc.content.scan(/internal-link[^>]*href='[^']*([^']+)'/) do |match|
        target_url = match[0]
        target_doc = all_docs.find { |d| d.url == target_url }
        if target_doc && target_doc != source_doc
          target_doc.data['backlinks'] << { 'url' => source_doc.url, 'title' => source_doc.data['title'] }
        end
      end
    end
  end
end
