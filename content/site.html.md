---
title: Site
---

The site sits on top of a directory full of html, erb, haml, etc. files that will eventually be rendered for a website.

## Resources

An asset is given to a resource to handle all web aspects of the asset including the request path, rendering, etc.

### Get a list of all your site pages

To get a list of all the resources within your site, run:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
site.resources # Lists all the pages/resources in the directory.
```

### Querying assets from the site

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
video_pages = site.resources.glob("videos/*html*")
```

### Other examples of queries

Resources are just plain old Ruby objects, which means you could query them via:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
youtube_pages = site.resources.glob("videos/*html*").select do |r|
  r.data["video_url"] =~ /youtube/
end
```

## Nodes

If you dig one level deeper below resources, you'll find the resources are actually organized as a tree via resource nodes.

```ruby
# Assume `/my/site` has the folders `/team/:name/:person_name`
site = Sitepress::Site.new(root_path: "/my/site")
# The path `/my/site` is the root node.
developers_page = site.root.dig("team", "developers")
# Assume each developer has a page, e.g. `/team/developers/brad`.
puts "There are #{developers_page.children.size} on the Development team"
# Assume there's pages as `/team/executives`, `/team/sales`, etc.
developers_page.siblings.each do |resource|
  # Prints the name of the team and the number of people on it, as
  # defined in each child page
  puts "#{resource.data["title"]} has #{resource.children.size} people on the team"
end
```

## Resource manipulation

What if you want to programatically manipulate your assets? For example, maybe you want to set the layout for the `youtube_pages` to `video`. The Site's `manipulate` function makes that possible?

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
site.manipulate do |resource|
  resource.data["layout"] = "video" if resource.data["video_url"] =~ /youtube/
end
```

When the `site.resources` method is called the rules from `manipulate` are applied.

If you want to add or remove resources from the manipulate method, just add the second `resources` argument to the `manipulate` block:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
site.manipulate do |resource, root|
  root.flatten.remove resource if resource.data["private"]
end
```

## Assets

An asset represents all of your websites' files on disk. They could include HTML pages, templated pages like haml or erb, images, javascripts, CSS files, CSS pre-processor languages, etc. Assets understands where those files are located and how to parse frontmatter data from them.
