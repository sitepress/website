require "sitepress-server"
require_relative "site"

compiler = Sitepress::Compiler.new(site: Sitepress.site)
compiler.compile(target_path:
  Sitepress.site.root_path.join("build"))
