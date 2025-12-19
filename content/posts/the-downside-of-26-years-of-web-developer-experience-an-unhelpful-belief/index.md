---
title: "The downside of '26 years of web developer experience' — an unhelpful belief about how to write frontend code"
date: 2025-08-08
tags: 
  - code
  - vue
  - today-i-switched
featured_image_credit: "truk"
featured_image_url: "https://pixabay.com/photos/sylvester-fireworks-new-years-day-1125786/"
---

I'm 37 today (2025), but I started coding for the web 26 years ago at around 11 (~1999). That’s “26 years of web developer experience,” but I’ve realised it also bred an unhelpful belief about how to write frontend code.

I started with Windows Notepad at school, producing HTML pages for Internet Explorer 4. Early tools included Dreamweaver (pre-Macromedia) and Microsoft FrontPage. Without a FrontPage license at home, I used Microsoft Publisher (yes, the desktop publishing app). Horrible tools, but that’s all an 11-year-old had in the late 90s. Only one other person I knew was doing the same — Chris, if you’re reading this, thanks for the inspiration!

Websites then were absurdly simple: before CSS, and basically before JavaScript. Some sites used VBScript or Java Applets — thankfully I never touched them. I do remember discovering [Dynamic Drive](https://www.dynamicdrive.com/) in the early 2000s, a treasure trove of JavaScript snippets you could paste blindly into your site.

These felt like magic — elements could jump, fade, and change colours. They also broke often, and I had no idea how to fix them. Soon after I discovered PHP, and much preferred server-side development.

By 2004 I was using Firefox 1.0, but differences with Internet Explorer often broke scripts. Client-side work felt fragile, so I kept pages “very dumb” and focused on PHP/MySQL, ignoring the frontend.

In the mid-2000s:

* **Developer tooling was non-existent** — just Notepad. No syntax highlighting, code completion, or any of today’s luxuries. Installing Notepad++ felt revolutionary.  
* **Bandwidth was tiny** — 4MB MP3s took ~20 minutes with “Download Accelerator Plus.”  
* **Browser incompatibilities were a nightmare** — often writing separate code for IE and Firefox. Positioning with 1px GIFs, anyone?

These constraints cemented the belief that the frontend was slow, should stay dumb, and the backend was where my time was best spent. I held onto that belief for decades.

## From big balls of mud to separation of concerns

The early web didn’t separate markup, style, and logic. Websites were often a “big ball of mud” — style, markup, and code crammed together, like:

```php
<font color = "<?php echo '$color;'?>">hello world</font>
```

It was quick to write but tedious to maintain and debug. I remember using tables for layout, mixing in random PHP, inline styles, and invisible 1px GIFs.

Things started to change when I discovered phpBB forum software. One version introduced templates, and I began separating HTML from PHP logic. I still did things like:

```php
<?php echo "<h1>Welcome to my site</h1>"; ?>
```

—but it was a start. Luckily CSS arrived, meaning all the inline styles could be moved to a separate file. I started using CSS for styling and there was the start of the separation of concerns.

## JavaScript reluctance

Around the late 2000s, I saw something mind-blowing: the Half-Life modding community [Snarkpit](https://snarkpit.net/) had a forum feature that let you upload an image, live preview it, and resize it before submitting. Today it sounds trivial, but at the time I thought something had downloaded locally. I couldn’t believe a browser could do it.

That led me to experiment with early JavaScript libraries: Prototype.js, MooTools, and eventually jQuery and jQuery UI. I stayed on MooTools for a long time because I’d built tools around it. But most of that JavaScript was for silly animations, not genuinely useful features.

In my first job, I built a Time and Expenses System (TEFSys) — my first “real” business web app. It used jQuery for date pickers, but was still a “dumb” client app.

## Ajax: The client and server can communicate?!

I don’t recall my first Ajax project, but the concept felt magical: the frontend and backend talking without reloading the page. I started with `new XMLHttpRequest()`, then moved to jQuery’s `$.ajax()`. My LAN-party site, westlan.co.uk, used Ajax for a live seat picker — click a seat, send an Ajax request, update the page without reload. Huge step forward.

Ajax enabled single-page apps… which I avoided for years.

## Rejecting single-page apps

Around 2012, over drinks, a colleague described an app he’d built entirely as a single-page application, calling APIs with Ajax. I thought it was ridiculous, error-prone, and slow. Why render lots of JavaScript, fetch data, then render again, instead of letting the server do it all? Silly now, but the web was different then.

I kept building with PHP, Smarty, MySQL, Apache, and Linux, outputting HTML, CSS, and a tiny bit of JavaScript. I was still reluctant to use JS.

Eventually I wanted more interactive apps, and there was no way to avoid JavaScript. jQuery was ageing, but by then we had `document.querySelector()` (2009–2010) and the `fetch()` API. I converted an old project from jQuery to pure JavaScript — the code became smaller, simpler, and more maintainable.

## Rejecting frameworks: just use plain JavaScript

With `document.querySelector()` and `fetch()`, I wrote more JavaScript but still avoided frameworks. Browsers were better, more compatible, and everything I needed could be done in plain JS. That’s how I wrote JavaScript for the last decade.

One project, OliveTin, had a custom “routing” system for `<sections />` integrated with the browser history API. It worked but was fragile. When I saw frameworks like Angular, React, and Vue, I thought, “Why go back to something like jQuery?” I didn’t want to rely on libraries that might go stale. I also still worried about page load times, so I was obsessed with asset minification. Webpack’s config annoyed me, so I used Parcel — zero config and great at the time.

## Being introduced to React, NextJS, and Tailwind all at once

Then, after ~24 years of web dev, I contributed to an open-source project using React, NextJS, and Tailwind. I was lost. Years of experience, yet I felt like a beginner. The `.node_modules` folder was 4GB. Tailwind’s `bg-blue-500` and `fg1` classes were alien to me. I didn’t understand why a framework would dictate how I wrote code.

One patch required me to fix CSS using Tailwind. Frustrated, I learned it — and once I understood its predefined classes, it made sense. I still didn’t touch React, and decided NextJS wasn’t for me. But I liked Tailwind.

Around then, someone contributed to one of my projects, suggesting Laravel, Vue, Vite, and other tools I’d never used. Curious from my Tailwind experience, I spun up a Laravel/Vue/Vite test. Laravel’s starter was bloat-heavy, so I dropped it, but Vue caught my eye.

## Vue + Vite: Cleaner code, better tooling

On OliveTin, I saw the frontend turning into a “big ball of mud” again — one huge JS file where markup changes broke unrelated code. Vue’s single-file components, bundling markup, script, and style, were appealing.

I tested Vue on another project, Spaghetti Cannon (maybe fate?). My first component was a click counter. Sure, in vanilla JS I could do it in 10 seconds:

```
window.clickCount = 0;
const btn = document.querySelector('button');
btn.addEventListener('click', () => {
  window.clickCount++;
  btn.innerText = `Clicked ${window.clickCount} times`;
});
```

—but the Vue version was cleaner and more structured. I puzzled over `ref()` at first, but quickly saw the value. Soon I was building real UIs, then discovered `vue-router`, which made routing trivial compared to my fragile custom system.

Parcel was starting to show its age. Friends mentioned Vite — faster and easier than Parcel, and it just works (especially with TS, Vue, etc.).

## Summary

This long post is about how 26 years of experience fostered an unhelpful belief about frontend code. I carried it from the late 2000s to 2025 — doing things the hard way. Vanilla JS can do everything, but projects inevitably grow into a “big ball of mud” that’s hard to maintain.

It’s like the [story of two woodcutters](https://screeble.com/story-of-two-woodcutters/). I was chopping wood the hard way for years. Now I’ve picked up a sharper axe — Vue, vue-router, and Vite. I’ve ported 4–5 projects with zero downsides: cleaner code, easier maintenance, better developer experience.

I won’t be going back to vanilla JS anytime soon — just like I wouldn’t write my backend in x86_64 assembly.

