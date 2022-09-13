---
title: Why do content management systems suck?
subtitle: A look at why CMS's create silos between marketing, support, & development teams and how to fix it
---

At a business level, content management systems divide marketing from product & development teams. How many times have you heard stories about the marketing team requestion a developer to build a landing page?

## The big breakup

What inevitably happens is everybody breaks up with each other within the organization. The product engineering team says to everybody, "we're going to move everything over to app.example.com". The technical support team takes all their content to support.example.com, and marketing is left managing www.example.com.

Now everybody lives on their own little content islands and the look and feel of your product, support content, and copy will start drifting apart.

At first this feels good, but then as time passes the product team might want to integrate the support team's help content into the application or the marketing team will want their feature copy to appear within the application to support lead generation or drive upgrades. Complexity starts to creep into the stack in the form of oxymorons like "Headless content management systems" or weird integrations get hacked together that require maintaince or break in weird ways because some of your customers use ad-blockers on their workstations.

## Why does the product look different from our marketing and support website?

Content is fundamentally something that should be versioned. It's why when people write copy they start with Draft 1, Draft 2, ..., Draft 3, followed by a Final Draft. After all that it's finally published!

The problem with content management systems that are backed by databases is their versioning sucks. Each CMS has to implement it's own versioning scheme, some are very robust, other's not so much.

Non-techincal folks don't think much about versioning, they just know it kind of works in some content management systems and occasionally they run into problems when they're trying to edit a document at the same time as another person. When that happens they usually copy the content into a Google Doc, work on it a bit in real-time with another person, then eventually move it back into the CMS to publish it.

Huh, that's weird, right?

Meanwhile Developers *love* versioning. They can take very complicated content, like the source code for Linux, and work on it globally in a highly concurrent manner. Then they can merge millions of lines of source code back together, resolve conflicts, and ship something to the rest of the world.

The underlying technology behind this feat? `git - the stupid content tracker`. It's one of the most powerful content management systems in the world. Developers love it, but it has a steep learning curve for people who are not technical.