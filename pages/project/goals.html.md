---
title: Goals
---

Sitepress aims to be a fast, embeddable website manager that can be used both in dynamic applications, like a Rails app, or as a stand-alone static site generator.

* **Embeddable** - Sitepress ships with as [few dependencies as possible](https://github.com/sitepress/sitepress/blob/master/sitepress/sitepress.gemspec#L24) so that it may be embedded in other web frameworks, like rails, without creating rubygem conflicts. It can also be used as a static site generator, as a rack app, etc.

* **Composable** - Sitepress is broken apart into several gems that are optimized for their environments. For example, the `sitepress-rails` gem uses as much of the rendering infrastructure from Rails as possible.

* **Speed** - Sitepress is benchmarked using a 10,000 page site as part of a regular test suite. Performance and speed is a goal of this project. The philosophy of performance is "less is more"; or the less code needed for Sitepress, the less chances for it to be slow.

More immediate features and milestones may be found on [Github](https://github.com/sitepress/sitepress/projects).

## Non-goals

More important than goals are non-goals, or what Sitepress is not setting out to accomplish. Most of these non-goals are temporary because doing them all could spread the project too thin:

* **Become a kitchen sink** - The premise of building Sitepress was to have minimal dependencies so that it could be embedded in other frameworks, like Rails, Sinatra, or Rack, so that upgrading those respective frameworks wouldn't become a headache. Middleman ships with an ActiveSupport dependency that makes upgrading Rails really difficult. Jekyll ships with less dependencies, but includes many that would be unnecessary for the goals Sitepress aims to solve. When Sitepress ships with a static site compiler, its possible that will have a heavy set of dependencies, but the core Sitepress gem will always aim to be lightweight and embeddable.

* **Stable API before 1.0** - Sitepress is being actively developed on a public Rails web application that receives approximately 2 million visitors per month. The internal API has settled down enough where its usable by a content and development team without drastic changes, but there's still a pretty good chance things will change and break as more requirements unfold. The [Ruby Gems sitepress page](https://rubygems.org/gems/sitepress) has the official version of Sitepress.

* **Easy to use by beginners** - In its current form, Sitepress is likely to be used by people who need to embed a marketing website in their Rails or Sinatra application that can't deploy a separate static marketing website. Its assumed that beginners won't run into this constraint and that they would be better suited by tools like [Middleman](https://www.middlemanapp.com/). Longer term, Sitepress will ship with a Rails CLI integration and a stand-alone CLI that will make creating new Sitepress projects easier for beginners.
