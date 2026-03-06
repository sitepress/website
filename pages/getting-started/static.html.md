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

## JavaScript

Using external JavaScript in your project isn't much different than doing the same in Rails.

You should be able to replace the Stimulus example below with any package to get started.

### Stimulus

To use Stimulus in your project, add it and esbuild to your package dependencies.

```sh
$ yarn add @hotwired/stimulus
$ yarn add esbuild -D
```

Next, create a new directory at `assets/javascripts/controllers`. Add a new Stimulus controller to this directory,

```
// assets/javascripts/controllers/hello_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.debug("Hello, world!")
  }
}
```

and import it from your application entry point.

```
// assets/javascripts/application.js

import { Application } from "@hotwired/stimulus"

import HelloController from "./controllers/hello_controller"

window.Stimulus = Application.start()
Stimulus.register("hello", HelloController)
```

Add a script to `package.json` to build the JavaScript. This uses esbuild to take everything in `assets/stylesheet/javascript/` and build it to `assets/javascripts/build`.

```
// package.json
{
  "dependencies": {
    "@hotwired/stimulus": "^3.2.1"
  },
  "scripts": {
    "build:js": "esbuild assets/javascripts/*.* --bundle --sourcemap --outdir=assets/javascripts/build"
  }
}
```

Sitepress needs to know what files to link to. Update `assets/config/manifest.js` to link to the new JavaScript build directory.

```
// assets/config/manifest.js

//= link_directory ../javascripts/build .js
```

Include the new JavaScript in your template file.

```erb
# layouts/layout.html.erb
<head>
  <%= javascript_include_tag "build/application" %>
</head>
```

Finally, wire up the Stimulus controller.

```erb
# layouts/layout.html.erb
<body data-controller="hello">
</body>
```

To run your app you need to now also execute the following to build the JavaScript.

```sh
$ yarn run build:js
```

#### Procfile.dev

To run both the server and the JavaScript in one command you can create `Procfile.dev`. Add the following to this file.

```
web: bundle exec sitepress server
css: yarn build:css --watch
js: yarn build:js --watch
```

You can then run the Procfile with [foreman](https://github.com/ddollar/foreman) or [overmind](https://github.com/DarthSim/overmind).
