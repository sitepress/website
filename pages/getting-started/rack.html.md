---
title: Rack
order: 3
---

Out of the box, Sitepress can be easily embedded into any Rack app. It can even be deployed direclty to Heroku.

First, install the `sitepress-server` gem.

```bash
$ gem install sitepress-server
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

Then create a `content/` folder to hold all of your pages:

```bash
$ mkdir -f content/pages
```

Finally, add a page to the pages directory:

```bash
$ echo "<h1>Hello</h1><p>It is <%= Time.now %> o'clock</p>" > content/pages/index.html.erb
```

Then boot the server:

```bash
$ bundle exec rackup config.ru
```

Now open `https://127.0.0.1:9292/` to view the page.

Next, read about working with [Frontmatter page metadata](/basics/frontmatter).
