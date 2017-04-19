---
title: Traversal
order: 3
---

Sitepress pages are organized as a hierarchical tree. For example, given the site directory:

```
├── helpers
├── layouts
└── pages
    └── books
      ├── js-for-newbs.html.haml
      ├── html-for-newbs.html.haml
      └── html-for-newbs
          ├── chapter-1.html.md
          ├── chapter-2.html.md
          └── chapter-3.html.haml
```

Its possible to navigate pages via:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
book = site.resources.get("books/html-for-newbs.html")
book.parents      # All parents nodes (books, root)
book.siblings     # All siblings, excluding self (js-for-nebs)
book.parent       # This would return nil since the `book` node doesn't have a page.
book.chidlren     # Returns all of the chapters in `html-for-newbs` (chatper-1 .. chapter-3)
```

Traversing the site hierachy is very useful for building site navigation components.

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

Next, read about working with [Frontmatter page metadata](/basics/frontmatter.html).
