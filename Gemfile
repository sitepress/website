source "https://rubygems.org"

if sitepress_gem_path = ENV["SITEPRESS_GEM_PATH"]
  gem "sitepress", path: sitepress_gem_path
  gem "sitepress-cli", path: sitepress_gem_path
  gem "sitepress-rails", path: sitepress_gem_path
  gem "sitepress-core", path: sitepress_gem_path
  gem "sitepress-server", path: sitepress_gem_path
else
  gem "sitepress", git: "https://github.com/sitepress/sitepress", branch: "version-2"
end

gem "haml-rails"
gem "sass-rails"
gem "markdown-rails"
