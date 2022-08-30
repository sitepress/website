---
title: Traversal
subtitle: Navigate the tree structure of a Sitepress website & page
order: 3
---

Sitepress pages are organized in a hierarchical tree. For example, given a site directory organized like this:

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

...it is possible to navigate pages via:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
book = site.resources.get("books/html-for-newbs.html")
book.parents      # All parents nodes (books, root)
book.siblings     # All siblings
book.parent       # This would return nil since the `book` node doesn't have a page.
book.children     # Returns all of the chapters in `html-for-newbs` (chatper-1 .. chapter-3)
```

The ability to traverse the site hierarchy is particularly useful when building site navigation components.

## Resource manipulation

What if you want to programmatically manipulate your resources? For example, you might want to set the layout for all pages shown under the url `youtube/` to `video`. With Site's `manipulate` function, this is easy:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
site.manipulate do |resource|
  resource.data["layout"] = "video" if resource.data["video_url"] =~ /youtube/
end
```

When the `site.resources` method is called, the rules from `manipulate` are applied.

If you want to add or remove resources from the manipulate method, you can simply add a second `resources` argument to the `manipulate` block:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
site.manipulate do |resource, root|
  root.flatten.remove resource if resource.data["private"]
end
```

Next, read about working with [Frontmatter page metadata](/basics/frontmatter).
