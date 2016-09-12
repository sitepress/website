---
title: Rack
---

Sitepress ships with a Rack app that's great for embedding Sitepress sites into any Rack app or deploy to Heroku.

When you setup Sitepress, the first thing you do is point it a `Site` at a directory full of files that will be rendered as webpages. Let's take a look at a sitemap in more detail:

```ruby
site = Sitepress::Site.new(root_path: "content")

run Sitepress::Server.new(site: site)
```

The server boots with all the resources
