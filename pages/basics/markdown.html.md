---
title: Markdown
subtitle: Focus on writing great content, free from the distractions of HTML
order: 4.5
---

Markdown is a lightweight markup language for creating formatted text using a plain-text editor. It's a great way for non-technical, and technical people, to create content.

## Markdown Rails gem

Since Sitepress is built on top of Rails, it uses the [Markdown Rails gem](https://github.com/sitepress/markdown-rails) to render markdown. Markdown Rails makes it easy to register multiple types of Markdown renderers within the same application. For example, you might have a vanilla Markdown renderer for the `.md` extension, an Erb Markdown renderer for `.markerb` extensions, and a `.crazymarkdown` extension for whatever insane renderer you dream up.

The [default Markdown renderer](https://github.com/sitepress/markdown-rails/blob/main/lib/markdown-rails/renderer/rails.rb) supports Rails image tags, with asset helpers, out of the box. No additional configuration is needed to get this to work.

## Installation

From the root of your project, run

```sh
$ bundle add markdown-rails
```

Then restart your server.

If you're running Sitepress embedded in a Rails application, run the following command:

```sh
# This won't work with stand-alone Sitepress
$ bin/rails g markdown_rails:install
```

This installs Markdown in your Rails application and gives you a few renderers you can extend.

>[!note]
> To use the default markdown renderer, create files using the `html.md` extension, not just `md`. 

If you're running Sitepress stand-alone, you can still extend the Markdown renderers, but you'll create the files manually in `./config/initializers/markdown.rb`.

The instructions below walk through how to extend the Markdown Renderer for stand-alone Sitepress.

## Extending the Markdown Renderer

It's common to extend the Markdown renderer to support features like code-highlighting, tables of contents, anchor tags, and more. Fortunately Markdown Rails makes this easy to customize in Sitepress.

```ruby
# ./config/initializers/markdown.rb

# Restart the server to see changes made to this file.
# You should read the docs at https://github.com/vmg/redcarpet and probably
# delete a bunch of stuff below if you don't need it.

class ApplicationMarkdown < MarkdownRails::Renderer::Rails
  # Reformats your boring punctuation like " and " into “ and ” so you can look
  # and feel smarter. Read the docs at https://github.com/vmg/redcarpet#also-now-our-pants-are-much-smarter
  include Redcarpet::Render::SmartyPants

  # Run `bundle add rouge` and uncomment the include below for syntax highlighting
  include MarkdownRails::Helper::Rouge

  # If you need access to ActionController::Base.helpers, you can delegate by uncommenting
  # and adding to the list below. Several are already included for you in the `MarkdownRails::Renderer::Rails`,
  # but you can add more here.
  #
  # To see a list of methods available run `bin/rails runner "puts ActionController::Base.helpers.public_methods.sort"`
  #
  # delegate \
  #   :request,
  #   :cache,
  #   :turbo_frame_tag,
  # to: :helpers

  # These flags control features in the Redcarpet renderer, which you can read
  # about at https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use
  # Make sure you know what you're doing if you're using this to render user inputs.
  def enable
    [:fenced_code_blocks]
  end
end

# Setup markdown stacks to work with different template handler in Rails.
MarkdownRails.handle :md, :markdown do
  ApplicationMarkdown.new
end
```

### Erb in Markdown

You can use Erb in Markdown, but be aware the configuration below will try processing Erb in code fences.

```ruby
# ./config/initializers/markdown.rb
#
# DANGER! This parses Erb, which means arbitrary Ruby can be run. Make sure
# you trust the source of your markdown and that its not user input.
class ErbMarkdown < ApplicationMarkdown
  # Enables Erb to render for the entire doc before the markdown is rendered.
  # This works great, except when you have an `erb` code fence.
  def preprocess(html)
    # Read more about this render call at https://guides.rubyonrails.org/layouts_and_rendering.html
    render inline: html, handler: :erb
  end
end

# Don't use Erb for untrusted markdown content created by users; otherwise they
# can execute arbitrary code on your server. This should only be used for input you
# trust, like content files from your code repo.
MarkdownRails.handle :markerb do
  ErbMarkdown.new
end
```

Markdown Rails and Sitepress are a powerful way to render various flavors of Markdown in the same project.
