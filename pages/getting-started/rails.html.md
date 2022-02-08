---
title: Rails
order: 1
---

Sitepress was originally designed to be embedded inside Rails. To get started, add this line to your application's Gemfile:

Add `sitepress-rails` to a Rails application by running:

```ruby
bundle add sitepress-rails
```

Create the `app/content/pages` in a rails project:

```bash
$ mkdir -p app/content/pages
```

Then add the pages to the `config/routes.rb` file:

```ruby
sitepress_pages
# Uncomment `sitepress_root` if you want `./app/content/pages/index.html.erb` to as the site's root page.
# sitepress_root
```

Then add pages to the `app/content/pages` directory:

```bash
$ echo "<h1>Hello</h1><p>It is <%= Time.now %> o'clock</p>" > app/content/pages/hello.html.erb
```

Restart the Rails application server and point your browser to `http://127.0.0.1:3000/hello` and if all went well you should see the page you just created.

## Root page

If you'd like http://127.0.0.1:3000/ to point to a page in Sitepress, first create the root content page:

```bash
$ echo "<h1>Greetings</h1><p>This is the root page!/p>" > app/content/pages/index.html.erb
```

Then in the `routes.rb` file, add:

```
sitepress_root
```

Be sure you remove any `root` directives from the routes file.

Next, read about [working with a Sitepress site](/basics/site).
