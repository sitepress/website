site.manipulate do |resource|
  resource.data["layout"] = "layouts/layout.html.haml" if resource.mime_type == "text/html"
end
