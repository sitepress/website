---
title: Models
subtitle: Wrap pages in custom Ruby classes and treat them as objects
order: 5
---

Page Models are a powerful way to manage sets of pages and access their content programmatically from all other parts of the website. For example, if a website wants to feature pages for each member of their team, they might create the following pages in `./pages/people`.

The first page we'd create lives at `./pages/people/brad.html.md`:

```md
---
name: Brad Gessler
title: Open Source Developer
email: brad@example.com
---

I created Sitepress!
```

Then we add another person at `./pages/people/linus.html.md`:

```md
---
name: Linus Torvalds
title: Creator of Linux
email: linus@example.com
---

I created Linux!
```

Then we'd create a `PersonPage` model at `./models/person_page.rb`:

```ruby
require "digest/md5"

class PersonPage < Sitepress::Model
  collection glob: "people/*.html*"
  data :name, :title, :email

  def gravatar_image_url
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end
end
```

Finally, from any template on the website, the collection of people can be iterated by calling:

```html
<h1>People</h1>

<% PersonPage.all.each do |person| %>
  <div class="person">
    <h2><%= person.name %></h2>
    <img src="<%= person.gravatar_image_url%>"/>
    <a href="mailto:<%= person.email%>"><%= person.email %></a>
    <a href="<%= person.request_url %>">Read bio</a>
  </div>
<% end %>
```

Page Models are a powerful and convenient way to access collections of content on websites.