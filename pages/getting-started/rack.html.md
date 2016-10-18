---
title: Rack
---

Sitepress ships with a Rack app that's great for embedding Sitepress sites into any Rack app or deploy to Heroku.

First, install the `sitepress-server` gem.

```
gem install sitepress-server
```

or bundle it into your rack application:

```ruby
gem "sitepress-server"
```

In the root of your application directory, create a `config.ru` file wih the following:

```ruby
require "sitepress"

site = Sitepress::Site.new(root_path: "content")
run Sitepress::Server.new(site: site)
```

Then create a content folder that will hold all of your pages:

```bash
$ mkdir -f content/pages
```

And finally add a page to the pages directory:

```bash
$ echo "<h1>Hello</h1><p>It is <%= Time.now %> o'clock</p>" > content/pages/index.html.erb
```

Then boot the server:

```bash
bundle exec rackup config.ru
```

Now open `https://127.0.0.1:9292/index.html` to view the page!

Next, read about working with [Frontmatter page metadata](/basics/frontmatter.html).
