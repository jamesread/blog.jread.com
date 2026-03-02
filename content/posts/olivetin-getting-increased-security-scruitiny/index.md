---
title: "OliveTin is getting more security scruitiny; and it's a good thing"
date: 2026-03-02T09:13:55Z
draft: false
tags:
  - code
featured_image_credit: The image is obviously AI generated, because many of these security issues are being reported with AI tools!
---

OliveTin has been getting a lot of security scruitiny this week - as there's been a relatively huge surge of security advisories come for the first time. I imagine that the project has been listed in a security forum or similar, and AI tools (and human eyeballs) are being used to looking for security vulnerabilities. This is a good thing, and I welcome more security reports, that will be patched, and will make OliveTin better.

<!-- more -->

> **TLDR**:
> **If you are an OliveTin user, no need to panic, just keep your installation up to date to patch against these security vulnerabilities.** This is a normal thing for all software.

I don't know why now, maybe it's just a lucky week...!

## Having less security reports did not mean the project was secure

A bit of context; I started OliveTin four years ago, and seeing it grow has been something I'm very proud of. I'm pleased to have built it in the open source way, and that will never change - I think it's best way to build better software. One benefit that comes up in both this project and day-to-day work is that more eyes on the code mean more bugs found and fixed. As seen this week, that includes security bugs.

For its first four years, OliveTin had a single security report. In the last week alone, five more came in—and there are now eight in the backlog. Two so far have been critical; the rest range from high to low. So, this is a relatively huge surge in security reports, and it can be a bit overwhelming to see so many come in at once. However, it's important to remember that all software has bugs, and security vulnerabilities are no exception.

Having less security reports did not mean the project was suecure. It just means the issues hadn't been found yet. The fact that these issues are being reported is a good thing: it means people are looking at the code and finding problems that need fixing. However the metric should not be "**does this project have any security reports?**" (yes, OliveTin now has several), but the metric should be "**is the maintainer responsive to security reports and patching them in a timely manner?**" (yes, I am).

## Thank you, Security Researchers!

I would like to extend my true appreciation and thanks to everyone who has taken time, and is continuing to take time to report these issues responsibly. They are taken seriously, and the aim is to fix them as quickly as possible while keeping OliveTin as secure as it can be. Your patience while I work through the backlog is appreciated.

## It's a bit of an emotional rollercoaster

At first it felt really crushing. It feels like a personal attack on the quality of the code and the work I and others have put into it. After that impulsive emotional reaction, though, Irealise it isn't a personal attack - it's just the project getting increased scruitiny as it grows. Also, all software has bugs. This includes open source and closed projects, for small projects and projects with far more resources: the Linux kernel, Kubernetes, databases, and the like. So I am re-framing how I think about this;**The fact that these issues are being reported is a good thing: it means people are looking at the code and finding problems that need fixing**. It’s also a testament to open source—more people can contribute and help make OliveTin better.

## OliveTin had some defences, but it needs more

I welcome feedback from anyone in the community to help improve OliveTin's security defences.

OliveTin has had several defences against security issues for some time;

* CodeRabbit code review on all pull requests / code changes
* Aggressive static analysis (go fmt, go vet, cyclo, gocritic, golang-ci).
* Dependabot alerts and dependencies generally kept very up to date
* Several LLM analysis of the codebase

Despite these checks (which were all fine) clearly it's not enough!

Why so many reports so suddenly? Likely tooling: fuzzing, scanners, or AI-assisted analysis that isn’t in the current workflow. As reports come in, one question being asked is how each issue was found and whether any tools were used. The goal is to adopt those same tools and build them into the development process so issues can be found and fixed before they are reported.

## Summary

If I categorise these issues so far, they're generally falling into these categories;

* Denial of Service (causing OliveTin to crash), due to concurrency issues, or similar
* Permissions bypass / not being checked - due to inconsistent checking
* Input sanitation allowing remote command execution (these are the critical issues)

I'm asking the reporters to disclose what tools they're using, so that I can start using those too. I'll write future blog articles about those as I have success with them.

Again, thank you to everyone who has reported issues. The commitment is to address them as quickly and carefully as possible, and your patience is appreciated. If you are an OliveTin user, please keep your installation up to date so you can stay secure. If you are a security researcher that would like to report an issue, please do so responsibly, and I will do my best to address it as quickly as possible.

* [OliveTin's security page, with list of advisories](https://github.com/OliveTin/OliveTin/security)
