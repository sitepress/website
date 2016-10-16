---
title: Static
---

Sitepress will eventually ship with a static site compiler. For now the functionality exists in the [compiler branch](https://github.com/sitepress/sitepress/tree/compiler) of the Sitepress repo.

The compiler API will eventually look something like this:

```ruby
require "sitepress-server"
require_relative "site"

compiler = Sitepress::Compiler.new(site: Sitepress.site)
compiler.compile(target_path:
  Sitepress.site.root_path.join("build"))
```

In due time this complexity will be hidden behind a `sitepress` CLI utility.
