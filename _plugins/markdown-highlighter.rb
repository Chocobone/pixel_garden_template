# frozen_string_literal: true

# Converts ==text== in Markdown to <mark>text</mark> in HTML output

Jekyll::Hooks.register [:notes], :pre_render do |doc|
  replace(doc)
end

Jekyll::Hooks.register [:pages], :pre_render do |doc|
  next unless doc.path.start_with?('_pages/')
  replace(doc)
end

def replace(doc)
  doc.content.gsub!(/==+([^ ](.*?)?[^ .=])==+/, "<mark>\\1</mark>")
end
