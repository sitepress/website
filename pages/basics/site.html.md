---
title: Site
---

The `Site` class is the primary way you'll interact with Sitepress pages, templates, or helpers. It sits on top of a directory structure that looks something like this:

```
├── helpers
│   ├── page_collection_helpers.rb
│   └── page_helpers.rb
├── layouts
│   └── layout.html.haml
└── pages
    ├── index.html.md
    └── stylesheets
```

## Helpers

The `helpers` directory is where you stash all of the Ruby helpers for your project. If Sitepress is embedded in rails, these helpers are actually Rails view helpers. If you're running Sitepress in a rack app or as a static site its simply a Ruby module.

## Layouts

Layouts are the files that are wrapped around your pages. They'll look a little something like this:

```erb
<html>
  <head>
    <title><%= current_page.data["title"] %></title>
  </head>
  <body><% yield %></body>
</html>
```

The contents of the files in your `pages` directory will be displayed inside the `yield` block when the page is rendered.

## Pages

The `pages` directory is where all the pages on your website live. The path of a file, relative to the pages directory, is the request path. For example, a file in `pages/hello/world.html` would be accessible via `https://www.example/com/hello/world.html`.

Templating languages, such as [ERB](https://ruby-doc.org/stdlib-2.3.1/libdoc/erb/rdoc/ERB.html) or [HAML](http://haml.info), may be used by pages by adding the extension at the end of the file. For example, the file `pages/hello/world.html.haml` would be accessible via `https://www.example/com/hello/world.html`.

To enable templating languages in Sitepress, you'll need to make sure the respective gem is installed and the Sitepress environment supports it.

### Get a list of all your site pages

To get a list of all the pages, known as resources, within your site, run:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
site.resources # Lists all the pages/resources in the directory
```

### Resource glob

A very common use of Sitepress is to get all of the pages within a specific directory:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
video_pages = site.resources.glob("videos/*html*")
```

Refer to the Ruby [Dir#glob](https://ruby-doc.org/core-2.2.0/Dir.html#method-c-glob) documentation for the patterns you may use to glob resources.

Pages are just plain old Ruby objects. If you need to query or filter a collection you just:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
youtube_pages = site.resources.glob("videos/*html*").select do |r|
  r.data["video_url"] =~ /youtube/
end
```

The [`Sitepress::Resource` documentation](http://www.rubydoc.info/gems/sitepress/Sitepress/Resource) provides a good overview of the methods and attributes you can use to filter site resources.

### Traversing pages

Sitepress pages are organized as a hierarchical tree. For example, its possible to navigate pages like this:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
summary_chapter = site.resources.glob("books/html-for-newbs/summary.html.*")
bread_crumb_pages = summary_chapter.parents # All parents
other_chapters = summary_chapter.siblings   # All siblings, excluding self
title_page = summary_chapter.parent         # Most immediate parent
all_chapters = title_page.children          # All immediate children
```

## Resource manipulation

What if you want to programmatically manipulate your resources? For example, maybe you want to set the layout for the `youtube_pages` to `video`. The Site's `manipulate` function makes that possible:

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
