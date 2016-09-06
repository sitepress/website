---
title: Home
---

## Say hello to Mascot

Mascot is a set of tools that helps you build awesome websites. Its *not* soley a static site generator, it can be embedded in other web frameworks like Rails, it can run stand-alone in a rack server, or you could use it to build your own static site generator.

## Why Mascot?

Static site generators, like [Middleman](https://middlemanapp.com) and [Jekyll](https://jekyllrb.com), are great frameworks for compiling static websites and publishing them to the web, but what if you need to run a content site from within Rails or Sinatra that needs to have access to a database? Mascots design principials are optimized for embedding:

### Mascot goals

* **[Minimal dependencies](https://github.com/bradgessler/mascot/blob/master/mascot/mascot.gemspec#L24)** - Mascot ships with as few dependencies as possible so that it may be embedded in other web frameworks without creating rubygem conflicts.

* **Composability** - Mascot is broken apart into several gems that are optimized for their environments. For example, the `mascot-rails` gem uses as much of the rendering infrastructure from Rails as possible.

* **Speed** - Mascot is benchmarked using a 10,000 page site as part of a regular test suite. Performance and speed is a goal of this project.
