require "mascot-server"

sitemap = Mascot::Sitemap.new(root: "content")
run Mascot::Server.new(sitemap: sitemap)
