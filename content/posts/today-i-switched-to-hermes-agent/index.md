---
title: "Hermes Agent — early impressions"
date: 2026-06-07T12:00:00+01:00
draft: false
tags:
  - today-i-switched
  - AI
  - automation
  - self-hosting
  - homelab
  - my-tools
featured_image_url: "https://www.pexels.com/photo/grayscale-photo-of-a-futuristic-robot-8294608/"
featured_image_credit: "Pavel Danilyuk"
description: "A quick note on my first week with Nous Research's Hermes Agent over Telegram — and why it feels like it understands me better than OpenClaw did."
ai_assisted: "mostly-generative-writing"
ai_assisted_model: "Composer 2.5 Fast"
---

This is a brief snapshot post — mostly for future-me to look back on — about my early success with [Hermes Agent](https://github.com/nousresearch/hermes-agent). I've only been running it for 9 days, so treat everything here as **first impressions**, not a long-term review.

I tried [OpenClaw](https://github.com/openclaw/openclaw) in the past. It was interesting — I even mentioned it when [writing about AI autonomy levels](https://blog.jread.com/posts/ai-levels-of-autonomy-in-software-engineering/) — but it never quite clicked for me. Hermes feels different so far: it seems to **understand what I'm asking for** more often, with less re-explaining and less "yes, but that's not what I meant."

I'd like to add that I first learned about Hermes from a colleague - [Stephan Michard](https://michard.io/) - he's got a got a really [interesting blog](https://michard.io/posts/) that I've started following, please do check it out.

## How I'm running it

I'm talking to Hermes over **Telegram**, which is exactly how I want a personal agent to work — ping it from my phone, get a useful answer back, move on with my day. The gateway runs as a background service on one of my machines, installed with Hermes's built-in **systemd** integration (`hermes gateway install`, then the usual `systemctl` / `journalctl` workflow). That matters to me. For something I expect to rely on daily, I want the same operational model as the rest of my homelab: enable on boot, check status with standard tools, read logs when something breaks.

The model backend is **ChatGPT via a paid [platform.openai.com](https://platform.openai.com) subscription** — the model is just 5.5, but that's not necessarily going to stay like that. What *is* stable is the bill: **costs are pretty expensive** so far. Useful, but not cheap. I'll be watching usage closely and may look at routing some workloads to cheaper models later; Hermes supports switching providers without rewriting everything (`hermes model`), which is reassuring.

Another option is Cursor, which I'm paying for now. It seems to legitimately support API usage like this as part of the plan - so far all my Cursor usage is via the IDE and CLI Agent. I need to check this a little more as I don't want to run afoul of cursor's terms of service - much like many people were doing with OpenClaw and similar AI IDEs.

## Use cases so far

Nothing here is production-critical yet — it's a toy that might grow into a tool — but the early wins are real:

* **Task tracking with [WackyTracky](https://github.com/wacky-tracky/wacky-tracky-client-html5/)** — asking Hermes query, check and summarise what's on my plate instead of opening another app.
* **Calendar with [SickRock](https://github.com/jamesread/SickRock)** — checking what's coming up, and nudging events around when plans shift.
* **Managing both together** — "what's due this week and what clashes with the school run?" is the kind of cross-system question I actually ask in natural language.
* **Website suggestions** for [lanlist.info](https://lanlist.info) and [technowax.net](https://technowax.net) — layout tweaks, content gaps, things I've been putting off because I'm too close to the sites.
* **Daily tech news, tailored to me** — not a generic firehose; prompts shaped around my stack and interests ([OliveTin](https://olivetin.app), self-hosting, Fedora, the usual).
* **LAN events for lanlist.info** — hunting for upcoming LAN parties and community events worth listing.
* **Triaging GitHub Security Advisories for OliveTin** — with a custom skill wired up similarly to how I fetch GHSAs elsewhere; early tests look promising for sorting noise from things that actually need a patch this week.

## What I'm watching

Hermes is agentic in the real sense — terminal access, tools, skills, scheduled jobs — so the usual cautions apply. It's mostly got read access to my calendar/tasks for now, which is enough to make it useful. It's living on it's own VM that I can kill off quickly if I want to, as well.

The cost curve is the other thing on my mind. A capable model on every "quick question" adds up fast. I'll report back if I find a sustainable split between "cheap model for triage" and "smarter model for multi-step work."

## Summary

Too early to declare victory, but **Hermes + Telegram + systemd** already feels like a better personal agent setup than OpenClaw did for me — mostly because it seems to grasp intent without as much hand-holding. The OpenAI platform bill is the main downside so far.

If you're curious, start at the [Hermes docs](https://hermes-agent.nousresearch.com/docs/) and the [messaging gateway guide](https://hermes-agent.nousresearch.com/docs/user-guide/messaging). And if you've migrated from OpenClaw yourself, Hermes even ships `hermes claw migrate` — I didn't need it, but it's a nice touch.

I'll post again once I've had a few months of real usage — or once the API costs make me rethink my life choices :-).
