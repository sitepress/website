---
title: Rails
---

Sitepress was designed to be embedded in Rails. To get started add this line to your application's Gemfile:

```ruby
gem 'sitepress-rails'
```

And then execute:

```bash
$ bundle
```

Then create the directory `app/content/pages` and add the page below to `hello.html.erb`:

```bash
$ echo "<h1>Hello</h1><p>It is <%= Time.now %> o'clock</p>" > app/content/pages/hello.html.erb
```

Point your browser to `http://127.0.0.1:3000/hello` and if all went well you should see the page you just created.
