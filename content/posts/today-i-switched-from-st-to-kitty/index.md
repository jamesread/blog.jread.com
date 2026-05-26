---
title: "Keep trying new tools — a case study from st to kitty"
date: 2026-05-26T18:30:00+01:00
draft: false
tags:
  - today-i-switched
  - my-tools
  - linux
  - fedora
  - terminal
featured_image: cover.jpg
featured_image_credit: Abdullah Ali Mansour
featured_image_url: https://www.pexels.com/photo/photo-of-a-cute-kitten-6900232/
description: "Constantly re-evaluating your daily toolchain is a healthy habit — even when you maintain your own terminal fork. What finally pushed me from st to kitty on Fedora."
ai_assisted: "mostly-generative-writing"
ai_assisted_model: "Composer 2.5 Fast"
---

One of the healthiest habits I've picked up over the years is to **keep trying new tools** — even, and especially, for things I use dozens of times a day. That applies whether you're switching between commercial apps, trying a different free software project, or, in my case, maintaining your own fork of something you could just install from a package manager.

Getting attached to tools keeps you in the past. The terminal you patched in 2021 made sense in 2021. The editor you learned in 2011 made sense in 2011. But the ecosystem moves on, and if you're not periodically asking "is there something better now?", comfort slowly turns into friction you stop noticing.

This post uses my recent switch from [my own fork of st](https://github.com/jamesread/st) to [kitty](https://sw.kovidgoyal.net/kitty/) as a case study. If you're evaluating your own daily toolchain — terminal or otherwise — I hope it's useful.

## The case study: st to kitty

I've been on st since [I recompiled it to escape Konsole bloat in 2021](https://blog.jread.com/posts/recompiling-a-linux-terminal-a-story-of-time-well-invested/). That story ended with mouse-wheel zoom hacked into `config.h`, a beige background colour (`#ffffdd`), and a terminal that felt *instant*. I loved it. I forked it, kept a few patches, and honestly thought I'd be on st for another decade.

I was wrong to assume st would still be the best fit — not because st is bad, but because **a better tool for my needs exists now**. Staying on st would have been attachment keeping me on a local maximum. I swallowed that pride, tried kitty properly for a few weeks, and kept it.

## Benefit 1: sticking to old standards affects modern tools

The breaking point wasn't aesthetics. It was **Cursor**.

I've been using [Cursor daily for agentic coding](https://blog.jread.com/posts/i-use-cursor-ai/), and that's what finally pushed me to look properly at what my terminal was — and wasn't — doing. Agent tooling expects a terminal that behaves like a modern one: reliable terminal detection, sensible cursor positioning, and other behaviour that st either lacks or implements patchily enough that I kept working around it.

st isn't primitive. It handles basic colour and Unicode fine. But there's a gap between "shows text correctly" and what current terminal standards actually support. Kitty closes much of that gap — dark and light theme detection, for example, so tools can adapt to your setup (which kitty supports and st does not), along with plenty of other features built on OSC sequences and proper terminfo reporting.

I'm not asking for a bloated terminal. I'm asking for one that speaks the dialect the rest of my toolchain now expects. Cursor made that obvious.

## Benefit 2: local maximums - you don't know what you're missing

I know. st fans will say "pipe to less" or "that's not what st is for."

But here's the honest version: **the lack of proper scrollback was constantly frustrating**. Not occasionally annoying — *constantly*. A build log scrolls past. An agent dumps output. A `kubectl` command returns three screens of YAML. A quick `git diff` is longer than the visible buffer. Every time, the same little mental tax: "right, how do I get that back?"

I don't want a workaround for something every other terminal solved in 1998. I want to scroll up.

Kitty gives me that without ceremony. Shift+Page Up. Mouse wheel. Search in scrollback. Done. I didn't realise how much background irritation I'd normalised until it disappeared.

## Benefit 3: prefer to borrow instead of build

I liked having my own st fork. Genuinely. There's pride in running software you've patched yourself — background colour, mouse zoom, whatever else I accumulated over the years. [My fork is here](https://github.com/jamesread/st) if you're curious.

But "liked" and "want to maintain forever" are different things.

On Fedora, kitty is a normal package:

```bash
sudo dnf install kitty
```

That's it. Updates arrive with the rest of the system. I don't rebuild a C project because I upgraded glibc, or because I moved to a new laptop, or because I forgot which patch I applied three years ago on a Friday night. For something I open fifty times a day, **boring package-manager convenience wins**.

This is the same instinct that eventually pushed me toward [Quadlet over hand-rolled container glue](https://blog.jread.com/posts/today-i-switched-to-quadlet/): for infrastructure I rely on constantly, I want the distro — or a well-supported upstream — to carry the maintenance burden.

My st fork isn't deleted. It's just no longer my *daily driver*.

## Benefit 4: roadmap for future compatibility/tech debt

I'm still on X11. i3 doesn't care what terminal I use, and neither does my workflow.

But I have noticed kitty's **first-class Wayland support** in the back of my mind. I don't know when — or if — I'll switch compositors, but when I do, I don't want my terminal to be the blocker. st's Wayland story always felt like "possible, if you care enough to patch and maintain it yourself." kitty treats it as a normal platform.

That's future-proofing I didn't strictly need today, but it's a nice bonus for a tool I'll probably use for years.

## Highlight: the themes are embarrassingly good out of the box

I'll admit something shallow: **kitty's built-in themes are very impressive**.

I've run the same beige st background for years because it was easy on the eyes and I couldn't be bothered to recompile for experiments. With kitty, I typed `kitten themes` on a whim and spent ten minutes trying options I'd never have bothered implementing myself. The result looks better than anything I ever hacked into `config.h`, and switching themes doesn't require `make clean && make`.

Is that a reason to change terminals? On its own, no. But combined with scrollback and fewer paper cuts, it tipped the scale.

A minimal `~/.config/kitty/kitty.conf` gets you most of what I wanted immediately:

```ini
include themes/Dracula.conf
font_family      JetBrains Mono
font_size        11.0
scrollback_lines 10000
enable_audio_bell no
```

Adjust the theme name to taste — that's the point.

## Lowlights: startup time

st starts **utterly instant**. You launch it and you're typing. There's no perceptible delay. It's one of the best things about suckless software.

kitty is slower to start. On my workstation — still on **X11**, for what it's worth — I consistently see roughly **two seconds** from launch to prompt. That's not catastrophic. It's not "go make a coffee" slow. But compared to st, it's noticeable every single time I open a new window.

I'm accepting that tradeoff. Scrollback and fewer daily papercuts are worth two seconds *to me*. If you open terminals hundreds of times a day and live for snappy UI, you might disagree — and I'd understand.

## What I'm keeping from the st years

Not everything about this switch is "kitty good, st bad."

st taught me that terminals don't need to be heavy. It stayed out of my way. It never nagged me about updates or telemetry. It started instantly. Those are values I still care about.

kitty is heavier than st — in binary size, features, and startup time — but it's still a proper terminal emulator, not a desktop environment pretending to be one. Konsole, this is not.

## Summary

| | st (my fork) | kitty |
|---|---|---|
| Startup | Instant | ~2 seconds |
| Scrollback | Workarounds | Built in |
| Modern tool integration | Patchy | Good enough |
| Themes | Recompile | `kitten themes` |
| Fedora packaging | DIY build | `dnf install` |
| Wayland | DIY | Supported |

I switched because **daily friction finally outweighed pride in my fork**. Cursor/agent tooling pushed me over the edge; scrollback kept me there; Fedora packaging and excellent default themes made it easy to stay.

The broader lesson is simpler than any one terminal: **periodically try the alternatives**. You don't have to switch every month, and you don't have to abandon tools that still earn their place. But if you've stopped looking entirely — because you've invested years in a fork, because you've memorised the keybindings, because "it still basically works" — you're optimising for comfort, not improvement.

Pick one tool in your daily chain and give something else a proper trial. kitty was mine. Yours might be your editor, your file manager, your note-taking app, or something else entirely. The habit matters more than the specific switch.

I'll report back if the two-second startup starts to annoy me enough to revisit the decision. For now, I'm typing this in kitty — and it's a really nice kitty :-).
