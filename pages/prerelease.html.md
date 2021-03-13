---
title: Prerelease
---

Help test Sitepress by using pre-release versions.

## Getting started

To get started with the Sitepress pre-release, run:

```
gem install sitepress --pre
sitepress new foo-bar
cd foo-bar
sitepress server
```

Now open [http://localhost:8080](http://localhost:8080) to see your new Sitepress site.

If all goes well, the gem should install, a new site will be created, the gems from that site will be bundled, and the Sitepress development server will run. Feel free to explore.

If that all works and you're ready to test a bit more, build a static version of your site. Run:

```
sitepress compile
cd build
ls -alR build
```

This should compile all of the Sitepress pages and assets you created into the `./build` directory.

## Known issues

Sitepress is still somewhat new. You'll likely run into issues with `sitepress server` and `sitepress compile`, and sometimes get error messages that aren't helpful. You may even get blank white screens. If you run into any problems, open an issue at [Github](https://github.com/sitepress/sitepress/issues).