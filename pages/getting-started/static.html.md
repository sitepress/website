---
title: Static
subtitle: Compile templates, partials, and pages into static HTML, CSS, & JavaScript files
order: 2
---

Sitepress ships with a static site compiler. To get started, install the sitepress gem:

```bash
$ gem install sitepress
```

Then create a new sitepress site with:

```bash
$ sitepress new ./my-site
```

This command generates a skeleton site and bundles dependencies into the project. Next, you'll want to change the directory to the project:

```bash
$ cd ./my-site
```

Then fire up the preview server:

```bash
$ sitepress server
```

Your site will now be available at `http://127.0.0.1:8080/`

## Components

Sitepress supports [Phlex](https://phlex.fun/) and [View Components](https://viewcomponent.org) out of the box.

### View Components

To use View Components in your project, add the files to the `./components` folder in the root of your project:

```ruby
# ./components/message_component.rb
class MessageComponent < ViewComponent::Base
  def initialize(name:)
    @name = name
  end
end
```

And the corresponding view file.

```erb
<!-- ./components/message_component.rb -->
<h1>Hello <%= @name %></h1>
```

Then from any page in your site, render the component just like you would in Rails:

```erb
<h1>Welcome to my site!</h1>
<%= render MessageComponent.new(name: "hi") %>
```

### Phlex

To use Phlex in your project, add the files to the `./components` folder in the root of your project:

```ruby
# ./components/hello_world.rb
class HelloWorld < Phlex::HTML
  def initialize(greeting: "Hello World") = @greeting = greeting
  def template = h1 { @greeting }
end
```

Then from any page in your site, render the component just like you would in Rails:

```erb
<h1>Welcome to my site!</h1>
<%= render HelloWorld.new(greeting: "It's me!") %>
```
