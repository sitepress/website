---
title: Goals
---

Sitepress aims to be a fast, embeddable website manager that can be used both in dynamic applications, like a Rails app, or as a stand-alone static site generator.

* **Embeddable** - Sitepress ships with as [few dependencies as possible](https://github.com/sitepress/sitepress/blob/master/sitepress/sitepress.gemspec#L24) so that it may be embedded in other web frameworks, like rails, without creating rubygem conflicts. It can also be used as a static site generator, as a rack app, etc.

* **Composable** - Sitepress is broken apart into several gems that are optimized for their environments. For example, the `sitepress-rails` gem uses as much of the rendering infrastructure from Rails as possible.

* **Speed** - Sitepress is benchmarked using a 10,000 page site as part of a regular test suite. Performance and speed is a goal of this project. The philosophy of performance is "less is more"; or the less code needed for Sitepress, the less chances for it to be slow.

More immediate features and milestones may be found on [Github](https://github.com/sitepress/sitepress/projects).
