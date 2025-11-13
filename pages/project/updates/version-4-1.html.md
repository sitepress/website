---
title: Sitepress 4.1
subtitle: Changes from 4.x and an upgrade guide
publish_at: November 13, 2025
---

Sitepress 4.1.0 has been released! Here's what's new:

## Page model collection improvements

Page models are a handy way to encapsulate page data & behavior. For example, if we have a markdown page like this:

```ruby
---
name: Linus Torvalds
title: Creator of Linux
email: linus@example.com
---

I created Linux!
```

We can put a Ruby object in front of it to encapsulate the page data & behavior.

```ruby
require "digest/md5"

class PersonPage < Sitepress::Model
  # The old way
  collection glob: "people/*.html*"
  data :name, :title, :email

  def gravatar_image_url
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end
end
```

The `collection` method has been deprecated in favor of a more boring, more "Ruby" way of defining collections.

```ruby
class PersonPage < Sitepress::Model
  # The new way
  def self.all = glob("people/*.html*")
end
```

This makes it possible to extend collections, sort them by default, or order by other attributes.

```ruby
class PersonPage < Sitepress::Model
  data :name, :title, :email
  # Returns all resources with a `person` layout.
  def self.all = resources.select { it.data.layout == "person" }
  # Returns people by their file path glob.
  def self.students = glob("students/*.html*").sort_by(&:name)
  def self.faculty = glob("faculty/*.html*").sort_by(&:name)
end
```

## Sitepress 5.x

I don't have a date yet, but Sitepress 5.x will deprecate the "old way" of defining collections.

```ruby
class PersonPage < Sitepress::Model
  # This will be deprecated in 5.x
  collection glob: "people/*.html*"
end
```
## Rails version support changes

### Rails 8.1 compatibility

Sitepress 4.1.0 is now compatible with Rails 8.1.x. I had to fix a few issues with load paths and the behavior of Zeitwerk to get `sitepress-rails` and standalone `sitepress` working with newer versions of Rails.

### Rails 7.1 deprecated

I've only promised to support the three most recent versions of Rails with Sitepress. It might work with older versions, but I updated the Appraisals to use Rails 7.2.x.

```ruby
appraise "rails-7-2" do
  gem "rails", "~> 7.2.0"
end

appraise "rails-8-0" do
  gem "rails", "~> 8.0.0"
end

appraise "rails-8-1" do
  gem "rails", "~> 8.1.0"
end
```

## Sitepress video course

If you'd like to learn more about Sitepress, check out the [Sitepress video course by Beautiful Ruby](https://beautifulruby.com/sitepress).

[![Screenshot of Sitepress video course](https://immutable.terminalwire.com/oOi1fb1MgAVDGSp4kf33gJfHigjahYjvxU3Kr0qiYsPsE0icBoARdTd9t60gBoYkSoec6yxwwCPs5Nreoemu4sin90n5MX9NdCpG.png)](https://beautifulruby.com/sitepress)
