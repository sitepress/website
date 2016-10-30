---
title: Static
---

Sitepress ships with a static site compiler. To get started, install the sitepress gem:

```bash
$ gem install sitepress
```

Then create a new sitepress site via:

```bash
$ sitepress new ./my-site
```

This command creates a skeleton site and bundles dependencies into the project. Next you'll want to change the directory to the project:

```bash
$ cd ./my-site
```

Then fire up the preview server:

```bash
$ sitepress server
```

And open the site at [http://127.0.0.1:8080/index.html](http://127.0.0.1:8080/index.html)
