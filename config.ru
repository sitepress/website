require "sitepress-server"
require_relative "site"

site = Sitepress::Site.new(root_path: "content")
site.manipulate do |resource|
  resource.data["layout"] = "layouts/layout.html.haml" if resource.mime_type == "text/html"
end

run Sitepress::Server.new(site: site)
