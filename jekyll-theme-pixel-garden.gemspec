# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-pixel-garden"
  spec.version       = "1.0.0"
  spec.authors       = ["Chocobone"]
  spec.email         = ["76o30739@gmail.com"]

  spec.summary       = "A retro 8-bit digital garden Jekyll theme"
  spec.description   = "Pixel Garden is a retro-styled Jekyll theme featuring NES.CSS, " \
                       "Obsidian-style bidirectional [[links]], dark/light mode, tag filtering, " \
                       "8-bit code blocks with traffic lights, and pixel-art fonts. " \
                       "Designed for personal blogs and digital gardens."
  spec.homepage      = "https://github.com/Chocobone/pixel_garden_template"
  spec.license       = "MIT"

  spec.metadata = {
    "bug_tracker_uri"   => "https://github.com/Chocobone/pixel_garden_template/issues",
    "documentation_uri" => "https://github.com/Chocobone/pixel_garden_template#readme",
    "homepage_uri"      => "https://github.com/Chocobone/pixel_garden_template",
    "source_code_uri"   => "https://github.com/Chocobone/pixel_garden_template",
  }

  # Theme files: layouts, includes, sass, assets, plugins
  # NOTE: _plugins/ are not auto-loaded from a gem theme — copy them to your site's _plugins/
  spec.files = Dir[
    "_layouts/**/*",
    "_includes/**/*",
    "_sass/**/*",
    "assets/**/*",
    "_plugins/**/*",
    "LICENSE",
    "README.md",
  ].reject { |f| File.directory?(f) }

  spec.required_ruby_version = ">= 3.0"

  spec.add_runtime_dependency "jekyll",                "~> 4.4"
  spec.add_runtime_dependency "jekyll-last-modified-at", "~> 1.3"
  spec.add_runtime_dependency "nokogiri",              "~> 1.16"
end
