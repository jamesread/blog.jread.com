---
title: "OliveTin 2k is end of life — I'm breaking a promise, and I'm sorry"
date: 2026-11-25T12:00:00Z
draft: false
tags:
  - code
  - open-source
  - self-hosting
featured_image: cover.jpg
featured_image_url: "https://unsplash.com/photos/person-in-blue-denim-jeans-standing-on-white-blue-and-red-area-rug-gB9hryu1q40"
featured_image_credit: "Sina Saadatmand"
description: "OliveTin 2k was promised support until 2028. As of today it is end of life, with no more security fixes or bug fixes. Here's why."
ai_assisted: "mostly-generative-writing"
ai_assisted_model: "Claude Opus 5.5"
---

This is a short post to own a decision I'm not proud of, but I think is the right one. As of today, **OliveTin 2k is end of life**. That means no more security fixes, and no more bug fixes. If you're still on 2k, please plan your move to 3k.

<!--more-->

## The promise I made

When I [split OliveTin into 2k and 3k](https://blog.jread.com/posts/2026-is-the-year-of-olivetin-resilience/), I said 2k would keep getting bug fixes and security updates until **at least 31st December 2028**. I meant it at the time. I also know some of you planned your upgrades around it — or decided not to upgrade at all, because there was "no rush".

So I'm not going to dress this up: this is a policy change, it's two years early, and I'm sorry.

## Why

Honestly, there are four reasons, and the first one is the most uncomfortable to admit.

* **I don't have the time to maintain 2k.** If you look at the `release/2k` branch, it has had almost no patches since 3k was released. All of my OliveTin time has gone into 3k. The 2028 promise was still on the docs page, but in practice it wasn't being kept — and saying so is better than pretending.
* **Very few people are asking for 2k.** Interest in staying on 2k has been really low, compared to the number of people who just upgraded to 3k. That's good news for 3k, but it makes it hard to justify the time.
* **A lot of fixes can't be made safely in 2k.** Many of the recent fixes in 3k rely on things 2k simply doesn't have — typed entities, the Connect RPC API, a config system that reloads cleanly. Backporting them would mean rebuilding 3k inside 2k.
* **Security reports are arriving faster than ever.** I wrote earlier this year that [OliveTin is getting more security scrutiny](https://blog.jread.com/posts/olivetin-getting-increased-security-scruitiny/), and that hasn't slowed down — AI-assisted research is finding issues faster than I could ever patch two branches. I still think that's a good thing for OliveTin users, but a branch that claims security support without actually getting it is worse than an honest end-of-life notice.

## What this means if you're on 2k

* Nothing stops working. Existing 2k releases and the `latest-2k` container tag aren't going anywhere.
* But you're running software that won't get fixed, and OliveTin is, by design, a tool that runs commands on your machines. Please don't stay on 2k for long.
* The [2k to 3k upgrade guide](https://docs.olivetin.app/upgrade/2k3k.html) is the place to start. If something blocks your upgrade, **please open an issue** — fixing upgrade blockers is now the best way I can help 2k users.

I've also updated [OliveTin's security policy](https://github.com/OliveTin/OliveTin/blob/main/SECURITY.md) to match. CVEs are now only raised for issues that reproduce on the latest 3k release or the `next` branch.

## Summary

I don't like breaking promises, and I'd rather have never made one I couldn't keep. But the honest version of the 2k support policy is "it ended a while ago, quietly", and I'd rather say that out loud. 3k is where all the work is happening, it's much better tested than 2k ever was, and I'd love to help you get there :-)
