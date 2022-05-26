---
title: Page Models
---

Page Models are a powerful way to manage sets of pages and access their content programatically from all other parts of the website. For example, if a small dental practice wants to list their locations on a website, they might create the following pages in `./pages/people`.

The first page we'd create lives at `./pages/people/brad.html.md`:

```md
---
name: Brad Gessler
title: Open Source Developer
email: brad@example.com
---

I like Open Source software.
```

Then we add another person at `./pages/people/linux.html.md`:
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

```erb
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
