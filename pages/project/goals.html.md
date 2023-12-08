---
title: Goals
subtitle: The context, intent, and philosophy of Sitepress
---

Sitepress is a fast, embeddable website manager that can be used in both dynamic applications, like a Rails app or server-side rendered website, or as a stand-alone static site generator.

* **Embeddable** - Sitepress ships with as [few dependencies as possible](https://github.com/sitepress/sitepress/blob/master/sitepress/sitepress.gemspec#L24) so that it can be embedded in other web frameworks, like Rails, without creating conflicts. It can also be used as a standalone static site generator, as a Rack app, or in other contexts.

* **Composable** - Sitepress is broken into several gems that are optimized for specific environments. For example, the `sitepress-rails` gem uses as much of the rendering infrastructure from Rails as possible.

* **Speed** - High performance is a primary goal of Sitepress. It is benchmarked using a 10,000 page site as part of its regular test suite. The general philosophy of the project is "less is more" -- that is, the less code needed for Sitepress, the the better.

More immediate features and milestones can be found on [Github](https://github.com/sitepress/sitepress/projects).

## Non-goals

More important than goals are non-goals, or what Sitepress is not setting out to accomplish. Most of these non-goals are temporary because achieving them all could spread the project too thin:

* **Become a kitchen sink** - One of the main goals of Sitepress was to have minimal dependencies so that it could be easily embedded into other frameworks, like Rails, Sinatra, and Rack. It should be unaffected when upgrading those respective frameworks. Middleman ships with an ActiveSupport dependency that makes upgrading Rails difficult; Jekyll ships with fewer dependencies, but still includes many that are unnecessary for Sitepress to achieve its goals.

* **Stable API before 1.0** - Sitepress is being actively developed on a public Rails web application that receives approximately 2 million visitors per month. The internal API has settled down enough for it to be usable by a content and development team without drastic changes, but there is still a pretty good chance that things will change and break as more requirements unfold. The [Ruby Gems Sitepress page](https://rubygems.org/gems/sitepress) has the official version of Sitepress.

* **Easy to use for beginners** - In its current form, Sitepress is likely to be used by people who need to embed an integrated marketing website inside their Rails or Sinatra application. It is assumed that beginners won't run into this constraint and that they would be better suited by tools like [Middleman](https://www.middlemanapp.com/), which can deploy separately. Longer term, Sitepress will ship with a Rails CLI integration and a stand-alone CLI that will make creating new Sitepress projects easier for beginners.
