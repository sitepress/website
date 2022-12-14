---
title: Sitepress 4.0
subtitle: Changes from 3.x and an upgrade guide
publish_at: December 14, 2022
---

Sitepress is undergoing quite a few changes from 3.x to 4.0. This covers the changes, in addition to serving as an ugprade guide.

## Getting started

Sitepress 4.0 is currently under active development. To add it to your project, change your Gemfile as follows:

```ruby
gem "sitepress", "~> 3.2", github: "sitepress/sitepress", branch: "version-4"
```

Then run `bundle update` and you should have the latest version of Sitepress.

## Breaking changes

These changes will break your code if you're using the features.

### Site manipulation

While I don't recommend the approach, it's common for people to want to put content in `blog/:slug` at the top-level URL like `/:slug`. Here's what the new API looks like:

```ruby
# The new API
site = Sitepress::Site.new
site.manipulate do |root|
  root.get("blog").children.each do |post|
    post.move_to root
  end
end
```

The old API passed a list of `resources` into the block, like this

```ruby
# The old way
site.manipulate do |resource, root|
  # This would loop through all the resources,
  # passing 1 resource per iteration into this block
end
```

To continue using the `resources` iteration method of site manipuation, you'll need to manually iterate through all of the resources from the `root` node.

```ruby
# Getting the old way to work the new way
site.manipulate do |root|
  root.flatten.resources.each do |resource|
    # Do something with a resource.
  end
end
```

## Enhancements

Your old code should still work. If it doesn't, it's a Sitepress bug!

### Frontmatter Data

Frontmatter can now be accessed with "dot" notation! That means this is possible:

```ruby
# This still works since data is a hash
current_page.data["title"]
# Now this is possible
current_page.data.title
```

And just like the `Hash#fetch` API, there's a `!` syntax that will throw an error if the data doesn't exist and a default isn't provided.

```ruby
# Fetching without a default value raises an exception
current_page.data.fetch("gone") # Raises exception
current_page.data.gone! # Raises exception

# Providing a default value returns the default
current_page.data.fetch("gone", "default") # => "default"
current_page.data.gone! "default" # => "default"

# A block may also be provided
current_page.data.fetch("gone") { "default" } # => "default"
current_page.data.gone! { "default" } # => "default"
```

No changes need to be made to upgrade since `Resource#data` is still accessible via the Hash syntaxes.


### Data Files

The same API that makes dot notation Frontmatter available may also be used for managing data files. While the API is still being worked out and finalized, the following helper should work in your project if you want a data API.

```ruby
module DataHelper
  def dataset(key)
    path = Sitepress.site.root_path.join("data", "#{key}.yml")
    Sitepress::Data.manage(YAML.load_file(path))
  end

  def data
    keys = Dir.glob("data/*.yml").map do |path|
      File.basename(path, ".yml").to_sym
    end

    Struct.new(*keys).new(*keys.map{|key| dataset(key) })
  end
end
```

Then call this from your pages as follows:

```erb
# Assumes you have ./data/people.yml in your project
<% data.people.each do |person| %>
  <%= person.first_name %>
<% end %>
```
