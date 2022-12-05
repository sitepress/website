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

## View Components

To get View Components working with Sitepress you'll have to add the gem and setup an autoload path.

First install the `view_component` gem

```sh
bundle add view_component
```

Then, from the root of the website you'll create a configuration file.

```sh
mkdir config/initializers
touch config/initializers/view_component.rb
```

Now open the `config/initializers/view_component.rb` file and add the folowing:

```ruby
# config/initializers/view_component.rb file
ActiveSupport::Dependencies.autoload_paths << "components"
```

Then from the root of your Sitepress project, create the `./components` directory.

```sh
mkdir components
```

Restart your server, then add a view component Ruby and template file.

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
<% render MessageComponent.new(name: "hi") %>
```