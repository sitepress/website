---
title: Metadata
order: 5
---

Frontmatter is a way to add meta data to your pages and access it form templates and the sitemap. Consider the following page:

```md
----
title: Apollo 40th anniversery
layout: video
video_url: https://www.youtube.com/watch?v=ez0bFWKR9-0
---

Check out this apollo launch video! Crazy how we went from nothing to the moon in under a decade.
```

With a respective `video.html.haml` layout:

```haml
!!!
%html
  %head
    %title=resource.data["title"]
  %body
    %h1=resource.data["title"]
    %iframe{src: resource.data["video_url"]}
    %p=yield
```

The power of Frontmatter is its abililty to query the data programatically from other templates. For example, if we have several video pages in our site, we could query them via the Site:

```haml
---
title: Youtube videos
---

%h1=resource.data["title"]
%ul
  -resources.select{ |r| r.data["video_url"] =~ /youtube/ }.each do |page|
    %a{href: page.request_path}=page.data["title"]
```
