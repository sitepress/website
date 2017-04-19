---
title: Site
order: 1
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

What does a page helper look like? Something like this:

```ruby
module PageCollectionHelpers
  # Accepts a `Dir.glob` pattern (e.g. `pages/*.html.*`) and sorts them in
  # order as defined by the `order` Frontmatter key.
  def ordered_pages(glob)
    site.resources.glob(glob).sort_by { |r| r.data.fetch("order", Float::INFINITY) }
  end
end
```

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
