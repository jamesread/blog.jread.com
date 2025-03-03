---
title: "Migrated docs.olivetin.app to Antora"
date: 2025-03-03T23:10:27Z
draft: false
tags:
  - code
  - documentation
  - antora
  - asciidoc
  - olivetin
---

This evening finally marks the completion of the migration of https://docs.olivetin.app to a new build system, called Antora.

OliveTin's documentation consists currently of 126 AsciiDoc files, 50 images, and many example config files, code examples, and similar. I would not say it is a very large documentation site, like OpenShift or any of the Red Hat documentation that I spend a lot of time reading (also written in AsciiDoc), but it's a decent size that has been built up over the last 3 years. 

AsciiDoctor has had support for spitting out [https://docs.asciidoctor.org/asciidoctor/latest/html-backend/](single page HTML) for a long time now, but it seemed to only spit out a single large page. Obviously as the documentation grew, this isn't nice to use and browse. I had been using a plugin called `asciidoctor-multipage` for a while, but it was a bit of a hack and I had to maintain the theme myself. More recently, people had been asking about documentation search built into the docs site. While I could have hacked this in myself, I didn't want to keep maintaining it. Recently, [https://github.com/OliveTin/OliveTin/issues/525](a frustrated user requesting search again) encouraged me to invest the time to migrate to a new system - Antora.

**The reasons prompting a migration were;**

- Many users were asking for search
- asciidoctor-multipage looks more like a hobby project, and the developer was unable to afford to [invest time in new features](https://github.com/owenh000/asciidoctor-multipage/issues/45) (but I'm thankful for the time he was able to invest in getting the project going) - I wanted a toolchain with a wider active community. 
- Wanted basic GitHub integration (eg: "edit this page") - little things like this encourage contributions
- Wanted a better experience on mobile

It was an extremely tedious migration, even though I started off with Asciidoc, all my links were using `[#foo]` and `<<foo>>`, which I had to migrate to the more correct `xref:foo.adoc[foo]` format. I also had to migrate all images, partials and examples to a "family" directory - which wasn't particularly fun! This is not a complaint or a problem with Antora - this is 3 years of technical debt of me throwing any old files anywhere I guess :-) However, successful build now with GitHub actions, no errors or warnings. I also wrote a couple of python scripts along the way to lint the docs for bugs and check for broken links, etc - you can find them in the ROOT module of my repo if you're interested. They're crude, but were very helpful for the migration.

The **advantages after the migration** are;

- Lunr search (which I know will be very popular with my users)
- Integration to GitHub for "edit this page"
- An actively maintained toolchain in Antora (asciidoctor-multipage was a weekend hobby project it seems)
- Much nicer themeing
- Better behaviour on mobile devices
- Future support for integrating multi-language documentation and docs in different repos.

For what it's worth, I did try to use downdoc and switch to mkdocs - as I have a /lot/ of other projects where I've standardised on mkdocs+material theme. However, all those projects contain a trivial amount of docs (10 small pages or so) compared to OliveTin which has 126 documentation files - and when you're writing docs for bigger projects, there's just no comparison to Asciidoc - so I kept with it :-)

Anyway, Antora is great, and maybe you'll find OliveTin interesting;

- https://docs.olivetin.app
- https://olivetin.app
- https://github.com/OliveTin/docs.olivetin.app < Antora repo, using a single "ROOT" module for now.
