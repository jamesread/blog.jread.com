---
title: "Markdown vs AsciiDoc - which is better?"
date: 2025-05-20T13:27:55+01:00
draft: false
tags: 
  - "asciidoc"
featured_image: ""
description: ""
---

Over the years I've used both markdown and asciidoc for writing technical documentation. Many more people are familiar with Markdown because it's used on GitHub. However, I think I probably found AsciiDoc first because it is the standard used by Red Hat technical documentation. Both have their pros and cons, but I've come to realize that one is not necessarily better than the other. It really depends on the use case.

So, which one is better? This is often a silly way to look at technologies - one is not often better than the other for all use cases. Windows is not better than Linux, and Linux or not better than Windows. They are just different. For running games, I use Windows, for everthine else - Linux works better for me. So what are the advantages and disadvantages of each - and when should you use one over the other?

## Markdown

Markdown's allure probably comes from it's simplicity - it is very easy to understand, and it's wildly implemented. It's useful that it's quite human readable as plain text. However, when I come to writing bigger documentation, most renderers of markdown have a lot of limitations. For example the GitHub flavored markdown dones't support imports, and it doesn't support propper cross references (just links to other files). 

* **Advantage**: 
  * Simple to learn
  * Easy to read as plain text
  * Widely implemented
* **Disadvantage**:
  * Many different "standards"
  * No propper cross references (just links to other ofiles)
  * Importing files is not supported in many renderers (essential for big documentation)

## AsciiDoc

* **Advantage**:
  * Lots of features useful for big documentation - admonitions, cross references, imports
  * Some very sophisticated tooling available, eg: Antora.
  * Much more standardized than markdown
  * Very helpful community (eg: Antora)
  * Arguably easier to read than markdown (I prefer the `link::...[]` syntax to the markdown `[link](...)` syntax)
  * Great for writing books
* **Disadvantage**:
  * The tooling takes more time to setup

## Common benefits

* Both are plain text formats, so they can be easily version controlled with Git
* Both are easy to convert to HTML, PDF, etc
* Both are easy to write in any text editor
* Both have a wide community of open source tools available
* Both are wildly adopted and documented (although Markdown in particular has many different "standards" and implementations)

## Summary

This is how I decide;

* *For single page document, or when reading the plain text is important*: **Markdown**.
* *For multi-page documentation, and when having a dedicated reader/location is acceptable*: **AsciiDoc**.

