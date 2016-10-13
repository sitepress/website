require "sitepress-server"
require_relative "site"

run Sitepress::Server.new(site: Sitepress.site)
