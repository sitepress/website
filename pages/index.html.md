---
title: Sitepress
---

Build amazing content websites that you can deploy as a static site or inside of a Rails application.

Sitepress comes with all your favorite templating languages, like ERB and HAML, and other sane defaults, like a zero-configuration asset pipeline, so you can be productive and focused while you build insanely fast websites.

## Getting started

To get started with the Sitepress pre-release, run:

```
gem install sitepress --pre
sitepress new my-website
cd my-website
sitepress server
```

Now open [http://localhost:8080](http://localhost:8080) to see your new Sitepress site!

For more advanced needs, or if you believe in the majestic monoloth, you can run your Sitepress site inside of a [Rails application](/getting-started/rails).

## Why Sitepress?

Static site generators are great frameworks for compiling static websites and publishing them to the web, but they force you to choose between running them completely static or inside of a Rails application. Sitepress lets you do both!

Database-backed content management systems like [Refinery CMS](http://www.refinerycms.com) and [Radiant CMS](http://radiantcms.org) are difficult to sync between development, test, staging, and production environments, making them difficult to use in multi-stage development or test-driven development workflows.

Projects like [High Voltage](https://github.com/thoughtbot/high_voltage) make it possible to embed a small, basic site into Rails, but they lack powerful features like Frontmatter and Sitemap APIs required to make building non-trivial content sites possible. It also doesn't ship with a static site compiler.

Sitepress is the missing piece. It has all the powerful features you'd expect from a fully featured static site generator, like Frontmatter support and hierarchal page traversal, but it's capable of being embedded inside any Rails, Sinatra, or Rack app. Since all of the content is just a bunch of files, its easy to incorporate Sitepress into a multi-stage or test-driven work environment.
