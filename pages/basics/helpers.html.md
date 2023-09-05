---
title: Helpers
subtitle: Methods and template handlers that make your views sing.
order: 5
---

Since Sitepress is built on top of Rails, it has full access to [Action View helpers](https://guides.rubyonrails.org/action_view_helpers.html), so you get access to handy methods like this.

```ruby
time_ago_in_words(3.minutes.from_now) # => 3 minutes
```

And of course all the asset helpers like

```ruby
image_path("edit.png") # => /assets/edit.png
```

## Sitepress Helpers

Sitepress comes with its own view helpers too.

### `link_to_page`

The `link_to_page` method will automatically create a link to a `Sitepress::Resource` or `Sitepress::Model` and use the text from the `title:` frontmatter key on the page. It's handy for navigation code.

```erb
<nav>
  <ul>
    <% site.glob("help/*.html.*").each do |page| %>
      <li><%= link_to_page page %></li>
    <% end %>
  </ul>
</nav>
```

### `render_layout`

Sitepress has a composable layout system that makes templating more reusable than what you're accusomted to in Rails.

For example, the following is the base template at `./layouts/body.html.erb` that deals with basic HTML concerns like the `head` and `body` tag:

```erb
<!DOCTYPE html>
<html class="dark:text-slate-200 dark:bg-brown-900">
  <head>
    <meta charset=utf-8>
    <meta name = "viewport" content = "width = device-width">
    <title><%= current_page.data.fetch("title") %></title>
    <%= stylesheet_link_tag "tailwind" %>
  </head>
  <body>
    <%= yield %>
  </body>
</html>
```

Then a child template can wrap itself in the parent template with the `render_layout` helper. In this case, the layout implements `header` navigation for the site, `footer` navigation, and accepts a block for the main `article`.

```erb
<%= render_layout "body" do %>
  <main class="grid grid-cols-1 gap-y-16 md:gap-y-24 py-16 md:py-24 px-4 md:px-16 md:gap-x-16 md:grid-cols-[max-content_minmax(0,_1fr)]">
    <header class="md:col-start-2 order-1 md:order-1">
      <h1 class="text-5xl font-extrabold text-brown-900 dark:text-white"><%= current_page.data["title"] %></h1>
      <% if subtitle = current_page.data["subtitle"] %>
        <h2 class="text-2xl opacity-50"><%= subtitle %></h2>
      <% end %>
    </header>
    <article class="prose dark:prose-invert max-w-fit order-2 md:order-3">
      <%= yield %>
    </article>
    <nav class="order-3 md:order-2">
      <div class="md:top-16 md:sticky flex flex-col space-y-8">
        <%= partial "partials/menu", title: "Getting Started", glob: "getting-started/*.html*" %>
        <%= partial "partials/menu", title: "Documentation", glob: "basics/*.html*" %>
        <%= partial "partials/menu", title: "Project", glob: "project/*.html*" %>
      </div>
    </nav>
    <aside class="order-5 md:order-4 z-50">
      <%= link_to "/" do %>
        <%= image_tag "logo-brown.svg", class: "max-w-[8rem] block dark:hidden" %>
        <%= image_tag "logo-white.svg", class: "max-w-[8rem] hidden dark:block" %>
      <% end %>
    </footer>
  </main>
<% end %>
```

## Template handlers

Since Sitepress runs on Rails, it gets to take advantage of its template infrastructure. That means you can add HAML, Markdown, Slim, and whatever template libraries you want to your project.

### Markdown

To add markdown to your Sitepress project, add the `markdown-rails` gem.

```sh
$ bundle add markdown-rails
```

Then restart your Sitepress or Rails server to pickup the new gem and add a `app/content/pages/my-page.html.md` to your project to see it pickup the new Markdown file.