---
title: Data
subtitle: Avoid repetition with structured data files
order: 6
---

Use data files to avoid repetition in your code. For example, to store links to your social media accounts.

```yaml
# data/social_links.yml

example:
  twitter: https://twitter.com/example
  github: https://github.com/example
```

Create a helper to parse the data.

```ruby
# helpers/data_helper.rb

module DataHelper
  def data(dataset)
    path = Sitepress.site.root_path.join("data", "#{dataset}.yml")
    JSON.parse(YAML.load_file(path).to_json, object_class: OpenStruct)
  end
end
```

> Note that this parses the YAML then parses it again as JSON. This enables dot access on nested hashes via OpenStruct.

Finally, use the data across your Sitepress site.

```erb
<% social_links = data(:social_links) %>
<%= link_to "Follow on Twitter", social_links.example.twitter %>
```
