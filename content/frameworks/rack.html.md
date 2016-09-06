---
title: Rack
---

Mascot ships with a Rack app that's great for embedding Mascot sites into any Rack app or deploy to Heroku.

When you setup Mascot, the first thing you do is point it a `Site` at a directory full of files that will be rendered as webpages. Let's take a look at a sitemap in more detail:

```ruby
site = Mascot::Site.new(root_path: "content")

run Mascot::Server.new(site: site)
```

The server boots with all the resources
