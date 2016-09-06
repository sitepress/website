class Blog < Mascot::Collection
  # This will eventualloy map the files from the ./collections/blog folder into the sitemap resources array
  def map_asset(asset, resources)
    path = "/#{asset.data["title"].downcase.gsub(/^\w/, "-")}"
    resources.add asset, request_path: path
  end
end
