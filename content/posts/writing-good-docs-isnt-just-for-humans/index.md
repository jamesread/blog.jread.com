---
title: "Writing good docs isn't just for humans"
date: 2026-06-19T12:00:00+01:00
draft: false
tags:
  - code
  - documentation
  - AI
  - olivetin
  - open-source
featured_image_url: "https://www.pexels.com/photo/pile-of-books-159866/"
featured_image_credit: Photo by Pixabay from Pexels
description: "Why I added llms.txt and llms-full.txt to the OliveTin documentation site — and why your docs might need the same."
ai_assisted: "mostly-generative-writing"
ai_assisted_model: "Composer 2.5 Fast"
---

I've spent a fair bit of time on [OliveTin documentation](https://docs.olivetin.app) over the years — migrating to [Antora](/posts/migrate-to-antora/), chasing broken links, adding search, and generally trying to make it usable for humans. That still matters. But recently I've been thinking about a second audience: **LLMs and AI agents**.

When someone (or something) asks "how do I configure OliveTin webhooks?" or "what's the difference between shell and exec actions?", the answer is probably already in the docs. The problem is getting there. HTML documentation sites are great in a browser — navigation, search, tabs, admonitions — but they're awkward for an AI agent that wants a clean, text-first view of your content without scraping dozens of pages.

## llms.txt — docs for machines

There's a small but growing convention for this: [llms.txt](https://llmstxt.org/). The idea is simple — publish a plain-text (Markdown) index at a well-known URL on your site that tells LLMs what your project is about and where to find the important bits. Cerbos wrote a good explainer when they [added it to their own docs](https://www.cerbos.dev/blog/llm-understanding-of-cerbos-documentation).

The spec defines two files:

- **`llms.txt`** — a concise index: project summary, key links, and a map of the documentation.
- **`llms-full.txt`** — a much larger dump of the actual page content, so an agent can ingest the docs in one shot rather than fetching hundreds of HTML pages individually.

You can see both on the OliveTin docs site now:

- [docs.olivetin.app/llms.txt](https://docs.olivetin.app/llms.txt)
- [docs.olivetin.app/llms-full.txt](https://docs.olivetin.app/llms-full.txt)

## One line in the Antora playbook

OliveTin's docs are built with Antora (AsciiDoc source, GitHub Actions publish). Adding LLM-friendly output turned out to be almost embarrassingly easy — Cerbos open-sourced an Antora extension, [`@cerbos/antora-llm-generator`](https://github.com/cerbos/antora-llm-generator), that generates both files automatically at build time.

The change to the [Antora playbook](https://github.com/OliveTin/docs.olivetin.app/blob/main/antora-playbook.yml) was literally adding one extension:

```yaml
antora:
  extensions:
    - '@antora/lunr-extension'
    - '@cerbos/antora-llm-generator'
```

That's it. Every docs build now produces `llms.txt` and `llms-full.txt` alongside the normal HTML site. No manual maintenance, no copy-pasting — the generator walks the same AsciiDoc sources humans read and emits machine-friendly versions.

## Why bother?

I'm not suggesting everyone rush to optimise docs purely for AI consumption. Humans still come first. But the overlap is bigger than you might think:

- **AI coding assistants** (Cursor, Copilot, etc.) increasingly try to pull context from documentation when you ask questions about a project.
- **AI agents** with web access or MCP tools will hit your docs site directly — and plain text is much easier to parse than a themed HTML layout with sidebars and JavaScript.
- **Your future self** might paste `llms-full.txt` into a chat and get a surprisingly good answer about your own project without clicking through twenty pages.

Good documentation structure — clear headings, consistent page titles, sensible cross-links — helps both humans *and* LLMs. The llms.txt files are just making that structure explicit for the second audience.

## Summary

Writing good docs isn't just for humans anymore. If you're already using Antora, adding `@cerbos/antora-llm-generator` is a small change with a clear payoff: your documentation becomes discoverable to LLMs and AI agents, not just people with a browser.

I'll keep an eye on how useful this actually is in practice — early days for the llms.txt convention — but it felt like the right thing to do for a project where people increasingly ask AI for help before they read the manual :-).
