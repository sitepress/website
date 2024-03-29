source "https://rubygems.org"

# Stand-alone Sitepress server and compiler.
# gem "sitepress", "~> 3.1"

if sitepress_gem_path = ENV["SITEPRESS_GEM_PATH"]
  gem "sitepress", path: sitepress_gem_path
  gem "sitepress-cli", path: sitepress_gem_path
  gem "sitepress-rails", path: sitepress_gem_path
  gem "sitepress-core", path: sitepress_gem_path
  gem "sitepress-server", path: sitepress_gem_path
else
  gem "sitepress", "~> 4.0", git: "https://github.com/sitepress/sitepress", branch: "main"
end

# Server used for the Sitepress preview server.
gem "puma"

# Templating engines. Under the hood Sitepress uses a slimmed
# down Rails, so rails templating engines should mostly work.
if markdown_rails_gem_path = ENV["MARKDOWN_RAILS_GEM_PATH"]
  gem "markdown-rails", path: markdown_rails_gem_path
else
  gem "markdown-rails", github: "sitepress/markdown-rails", branch: "main"
end

# HTML templating engine
gem "slim-rails"

# Parse `publish_at` dates from blog posts
gem "chronic", "~> 0.10.2"

# Get content live-ish from websites, like Github repo projects.
gem "http.rb", "~> 0.12.0"

gem "redcarpet", "~> 3.5"

gem "nokogiri", "~> 1.13"

gem "rouge", "~> 4.0"

gem "dockerfile-rails", ">= 1.5", :group => :development