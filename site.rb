# site.manipulate do |resource|
#   if !resource.data.key? "layout" and resource.mime_type == "text/html"
#     resource.data["layout"] = "layouts/layout.html.haml"
#   end
# end
