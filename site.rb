require "sitepress"

module Sitepress
  def self.site
    @site ||= Sitepress::Site.new(root_path: ".")
  end
end

Sitepress.site.manipulate do |resource|
  resource.data["layout"] = "layouts/layout.html.haml" if resource.mime_type == "text/html"
end
