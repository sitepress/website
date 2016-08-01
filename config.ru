require "mascot-server"

sitemap = Mascot::Sitemap.new(root: "pages")
run Mascot::Server.new(sitemap: sitemap)
