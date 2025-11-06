---
title: Models
subtitle: Wrap pages in custom Ruby classes and treat them as objects
order: 7
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
  # PersonPage.all will return a collection of PersonPage instances
  def self.all = glob("people/*.html*")

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

## Collections

Sitepress page models wrap a page in a Ruby class, and pages usually come in sets, so how do we access them through a model?

The `Sitepress::Model.collection` method wraps a collection of resources in the model class.

```ruby
class PersonPage < Sitepress::Model
  data :name, :title, :email

  # PersonPage.all will return a collection of PersonPage instances
  def self.all = glob("people/*.html*")

  # Alumni pages are hanging out in the ./alumni folder.
  def self.alumni = glob("alumni/*.html.*").order_by(:name)

  # Returns all resources within the site that has the layout "person".
  def self.layouts = collection { site.resources.select { it.data.layout == "person" } }
end
```

Collections can also be used to express relationships between models.

```ruby
class CompanyPage < Sitepress::Model
  data :name
  def self.all = glob("companies/*.html*")
  def people_pages = PersonPage.collection { page.children }
end
```

In a view that shows companies and their people, we might do something like this:

```erb
<% CompanyPage.all.each do |company| %>
  <div class="company">
    <h2><%= company.name %></h2>
    <div class="people">
      <% company.people_pages.each do |person| %>
        <div class="person">
          <h3><%= person.name %></h3>
          <img src="<%= person.gravatar_image_url%>"/>
          <a href="mailto:<%= person.email%>"><%= person.email %></a>
          <a href="<%= person.request_url %>">Read bio</a>
        </div>
      <% end %>
    </div>
  </div>
<% end %>
```
