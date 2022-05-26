source "https://rubygems.org"

gem "rails", "~> 7.0"

if sitepress_gem_path = ENV["SITEPRESS_GEM_PATH"]
  gem "sitepress", path: sitepress_gem_path
  gem "sitepress-cli", path: sitepress_gem_path
  gem "sitepress-rails", path: sitepress_gem_path
  gem "sitepress-core", path: sitepress_gem_path
  gem "sitepress-server", path: sitepress_gem_path
else
  gem "sitepress", "~> 3.0", git: "https://github.com/sitepress/sitepress", branch: "main"
end

gem "haml-rails"
gem "sass-rails"
gem "markdown-rails"
gem "redcarpet", "~> 3.5"
