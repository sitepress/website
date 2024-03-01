---
title: Frontmatter
subtitle: Add metadata to the top of your pages
order: 4
---

Frontmatter is a way to add metadata to your pages and access it from templates and the sitemap. Consider the following page:

```md
---
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

The data can also be accessed by calling dot methods for the keys.

```haml
!!!
%html
  %head
    %title=resource.data.title!
  %body
    %h1=resource.data.title
    %iframe{src: resource.data.vido_url}
    %p=yield
```

Calling `resource.data.title!` will raise an exception of the data isn't found. Calling `Calling `resource.data.title!` will raise an exception of the data isn't found. Calling `resource.data.title` would return a `nil` value if the data is not present. The existence of a key can be checked by calling `resource.data.title?`

The power of Frontmatter is its abililty to query data programatically from other templates. For example, if we have several video pages on our site, we can query them via the Site:

```haml
---
title: Youtube videos
---

%h1=resource.data.title
%ul
  -resources.select{ |r| r.data.video_url =~ /youtube/ }.each do |page|
    %a{href: page.request_path}=page.data.title
```
