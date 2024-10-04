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

The ability to traverse the site hierarchy is particularly useful when building site navigation components. For example, to show a navigation structure for the current page's sibling's children:

```erb
<% current_page.siblings.each do |section| %>
  <h2><%= link_to_page section %></h2>
  <ul>
    <% section.children.each do |child| %>
      <li><%= link_to_page child %></li>
    <% end %>
  </ul>
<% end %>
```

## A Node has many Resources

A "Node" can map to a file or folder in your Sitepress directory. Consider the following directory of files and folders in the pages directory.

```
└── pages
    └── books
      ├── html-for-newbs.html.haml
      └── html-for-newbs
          ├── chapter-1.html.md
          ├── chapter-2.html.md
          └── chapter-3.html.haml
```

The following Node and Resource structure will automatically be created by Sitepress.

```ruby
Node.new(name: "books", formats: []) do |books|
  books.children >> Node.new(name: "html-for-newbs") do |html_newbs|
    html_news.resources << Resource.new(format: :html, asset: Asset.new(path: "books/html-for-newbs.html.haml"))
    html_news.children << Node.new(name: "chapter-1") do |chapter_1|
      chapter_1.resources.add Resource.new(format: :html, asset: Asset.new(path: "books/html-for-newbs/chapter-1.html.md"))
      end
    end
    html_news.children << Node.new(name: "chapter-2") do |chapter_2|
      chapter_1.resources.add Resource.new(format: :html, asset: Asset.new(path: "books/html-for-newbs/chapter-2.html.md"))
      end
    end
    html_news.children << Node.new(name: "chapter-3") do |chapter_3|
      chapter_1.resources.add Resource.new(format: :html, asset: Asset.new(path: "books/html-for-newbs/chapter-3.html.md"))
      end
    end
  end
end
```

Here's an example that gets all of the child nodes of the `books` node, then grabs the HTML resource to display in a list.

```erb
<h2>Chapters</h2>
<ol>
  <% Sitepress.site.dig("books").children.each do |chapter_nodes| %>
    <% if page = chapter_nodes.resources.format(:html) %>
      <li>
        <a href="<%= page.request_path %>"><%= page.data.title %></a>
      </li>
    <% end %>
  <% end %>
</ol>
```

## Resource manipulation

The first thing to know about resource manipulation is that you shouldn't do it. The beauty of Sitepress is you know the path `/blog/my-post` can be found in `./pages/blog/my-post.html.md`. When you change the direct mapping between the request path and asset path, you create a level of indirection that makes it more difficult for people to find and edit content.

One more time, do everything you can to avoid manipulating resources! Just because you can do something doesn't mean you should.

Ok, fine so you want to manipulate resources. Maybe you're coming over from Middleman and you have a bunch of blog posts with URLs like `/blog/my-post` stuck in folders like `./source/blog/2010-12-22/brad-was-here.html.md`. Middleman accomplished this with a process known as resource manipulation.

Here's how you should not do it in Sitepress, not because you can't, but because you shouldn't:

```ruby
# Please do everything you can to avoid needing to do this.
site = Sitepress::Site.new(root_path: "/my/site")
site.manipulate do |root|
  blog = root.dig("blog")
  blog.children.each do |date_folder|
    post = date_folder.children.find { |resource| resource.formats.include? :html }
    post.parent = blog
    # PLEASE don't do this, just rename the underlying file instead to the slug and
    # remove the `slug` key from the post's Frontmatter.
    post.name = post.data.fetch("slug")
    post.data["layout"] = "blog-layout"
  end
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
