---
title: Prerelease
---

Help test out Sitepress by using pre-releases.

## Getting started

To get started with the Sitepress pre-release, run:

```
gem install sitepress --pre
sitepress new foo-bar
cd foo-bar
sitepress server
```

Now open [http://localhost:8080](http://localhost:8080) to see the Sitepress page.

If all goes well, the gem should install, a new site will be created, the gems from that site will be bundled, and the Sitepress development server will run. Feel free to explore.

If that all works and you're ready to test a bit more, run:

```
sitepress compile
cd build
ls -alR build
```

This should compile all of the Sitepress pages and assets you created into the ./build directory.

## Known issues

Sitepress is still very new, despite being built on top of Rails. You'll likely run into issues with `sitepress server` and `sitepress compile` where the error messages are either not helpful for blank white screens. If you run into that, open an issue at [Github](https://github.com/sitepress/sitepress/issues) for what you'd expect to see for the error.