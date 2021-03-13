---
title: Globs
order: 2
---

A common use of Sitepress is to get all of the pages within a specific directory. For example, if a site has the following pages in the `/videos` directory:

```
├── helpers
├── layouts
└── pages
    └── videos
        ├── dogs.html.md
        ├── birds.html.md
        ├── lizards.html.md
        └── cats.html.haml
    └── videos.html.haml
```

A list of video pages could be queried via:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
video_pages = site.resources.glob("videos/*html*")
```

Pages are just plain old Ruby objects. If you need to query or filter a collection, you can just use:

```ruby
site = Sitepress::Site.new(root_path: "/my/site")
youtube_pages = site.resources.glob("videos/*html*").select do |r|
  r.data["video_url"] =~ /youtube/
end
```

The `videos.html.haml` template would render `HTML` that links to the videos in the list:

```haml
%html
  %head
    %title Vidoes
  %body
    %ul.videos
      -site.resources.glob("videos/*.html.*").each do |page|
        %li.video
          %a{href: page.request_path}=page.data.fetch("title")
```

Refer to the Ruby [Dir#glob](https://ruby-doc.org/core-2.2.0/Dir.html#method-c-glob) documentation for patterns you may use to glob resources.
