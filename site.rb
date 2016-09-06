Mascot.site.manipulate do |resource|
  resource.data["layout"] = "layouts/layout.html.haml" if resource.html?
end
