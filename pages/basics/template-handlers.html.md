---
title: Template handlers
subtitle: Add markdown, HAML, and other templating engines to your Sitepress project
order: 6
---

Since Sitepress runs on Rails, it gets to take advantage of its template infrastructure. That means you can add HAML, Markdown, Slim, and whatever template libraries you want to your project.

## Markdown

To add markdown to your Sitepress project, add the `markdown-rails` gem.

```sh
$ bundle add markdown-rails
```

Then restart your Sitepress or Rails server to pickup the new gem and add a `app/content/pages/my-markdown-page.html.md` to your project to see it pickup the new Markdown file.

## Slim

To add Slim to your Sitepress project, add the `slim-rails` gem.

```sh
$ bundle add slim-rails
```

Then restart your Sitepress or Rails server to pickup the new gem and add a `app/content/pages/my-slim-page.html.slim` to your project to see it pickup the new Slim file.

## Haml

To add Haml to your Sitepress project, add the `haml-rails` gem.

```sh
$ bundle add haml-rails
```

Then restart your Sitepress or Rails server to pickup the new gem and add a `app/content/pages/my-slim-haml.html.haml` to your project to see it pickup the new Haml file.

## Other templating engines

Sitepress works with any templating engine that Rails supports. If you want to add a new templating engine, just add the gem to your Gemfile and restart your server.