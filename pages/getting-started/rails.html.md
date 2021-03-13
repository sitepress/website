---
title: Rails
order: 1
---

Sitepress was originally designed to be embedded inside Rails. To get started, add this line to your application's Gemfile:

```ruby
gem 'sitepress-rails'
```

And then bundle it into your application:

```bash
$ bundle
```

Create the directory `app/content/pages` and add the page below to `hello.html.erb`:

```bash
$ echo "<h1>Hello</h1><p>It is <%= Time.now %> o'clock</p>" > app/content/pages/hello.html.erb
```

Run your Rails application and point your browser to `http://127.0.0.1:3000/hello`. You should see the page you just created.

Next, read about [working with a Sitepress site](/basics/site).
