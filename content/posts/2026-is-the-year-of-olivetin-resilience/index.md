---
title: "2026 Is the Year of OliveTin Resilience"
date: 2026-01-11T09:36:33Z
draft: false
tags: []
featured_image: ""
description: ""
---

This is a post about making OliveTin more resilient in 2026, by adding betas, adding a Codeberg mirror, increasing Matrix usage, improving documentation, testing and tools. None of OliveTin's principles are changing, it's license isn't changing, and it's maintainer aren't changing. Just making OliveTin stronger.

<!--more-->

# OliveTin has grown up

I've taken a lot of pride in seeing OliveTin grow from it's very first user to many hundreds of users it has today. The Discord server has several hundred users, and there is lots of activity in the GitHub issues. The project has been a friendly place for people to come together, and what's been fun is seeing all the use cases people have found for OliveTin.

Last year I made the decision to split OliveTin into two separate release streams - OliveTin 2k and OliveTin 3k. In short, OliveTin 2k was the version people had come to love, and it will still be supported for a long time. However OliveTin 3k represents a much cleaner, more stable version of OliveTin. Splitting the codebase to have two parallel release streams is quite a bit of work, and I certainly underestimated just how little test coverage I had in the original version of OliveTin. This meant that after the split, I had lots of reports of things that broke in OliveTin 3k that had worked fine in OliveTin 2k. Luckily I think that as of version 3000.8.0 those issues have mostly been patched up, and OliveTin 3k is now a very stable release.

Stable is good. How do we make OliveTin **more** stable, and not just from the perspective of code, but the community, as well? We're living in a world with lots of political and economic uncertainty, and it's becoming more clear that cloud services can make pretty major technical or privacy changes with little or no warning. Put simply, I want OliveTin to be as resilient as possible in the face of all these uncertainties.

# The plan for 2026

None of OliveTin's of OliveTin's principles are planned to change, but I thought it would be helpful to plot a roadmap for 2026, and this roadmap's themes are resilience;

## Adding beta releases for 3k

There has been a call from the community to help with testing, which is great! To that end, I plan to start releasing beta versions of OliveTin 3k when it makes sense (most likely on feature releases). These beta versions will include new features and bug fixes that are still being tested, and they will be available for users who want to help with testing and provide feedback before the changes are included in a stable release. This will help catch bugs and issues earlier in the development process, making OliveTin 3k more stable overall.

At the time of writing, version [3000.9.0-beta.1](https://github.com/OliveTin/OliveTin/releases/tag/3000.9.0-beta.1) is the first beta release of OliveTin 3k, and I plan to continue releasing beta versions when it makes sense.

## Code hosting: Add a Codeberg mirror, alongside GitHub

Codeberg is a non-profit, privacy-respecting Git hosting service based in Germany. It is run by a community of open source enthusiasts, and I think it aligns well with OliveTin's values. By adding Codeberg as a mirror, we can ensure that OliveTin's source code remains accessible even if GitHub were to change its policies or go down for an extended period of time.

The Codeberg mirror will be hosted at https://codeberg.org/jamesread/olivetin - I plan to have it set up and running by the end of January 2026. Notice that I am deliberately not using an Organisation here - I think using the Organisation feature on GitHub was a mistake. 

## Community chat: Increase Matrix usage, alongside Discord

OliveTin already has a Matrix room, but I want to make it more active and visible. Matrix is a decentralised chat protocol that is less reliant on centralised servers, making it more resilient to outages and censorship. By increasing OliveTin's presence on Matrix, we can provide an alternative way for users to communicate and collaborate even if Discord were to change its policies or go down for an extended period of time ([Discord is planning for an IPO](https://techcrunch.com/2026/01/07/discords-ipo-could-happen-in-march/)).

* The OliveTin "rooms" have been created on the "technowax" Matrix server: https://matrix.to/#/#technowax:matrix.org

These are likely to be extremely quiet rooms and I fully expect many people to continue to use Discord. However, having multiple options is a good thing :-) 

## Documentation

OliveTin's documentation is already pretty good, but a lot of pages have not been updated in a while. We're not talking about major rewrites, just a "lick of paint" - updated screenshots, more helpful instructions, etc. 

## Tools

Some of you may have noticed, but I've been working on some tools to support OliveTin, like "otch" - OliveTin configuration helper.

* https://otch.olivetin.app

There is also the theme gallery, and hopefully this will be extended in the future to the "use case gallery".

# Summary

OliveTin is almost at it's 5 year anniversary. It's been a great ride getting here, nothing major is now changing, other than some work to make sure it stays robust into the future.
