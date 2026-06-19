# AGENTS.md — blog.jread.com

Guide for AI agents writing, editing, or publishing content on **James Read's Code, Containers & Cloud blog** ([blog.jread.com](https://blog.jread.com/)).

## About this site

- **Stack:** [Hugo](https://gohugo.io/) static site, custom theme `themes/jwr`, deployed via Azure Static Web Apps.
- **Author:** James Read — Solution Architect (Red Hat on Azure), long-time self-hoster, maintainer of [OliveTin](https://olivetin.app) and many personal projects.
- **Locale:** `en-gb` — use British English spelling (*favourite*, *realise*, *organised*).
- **Topics:** Code, containers, cloud, self-hosting/homelab, AI, Linux tooling, open-source projects, career reflections, and personal tech choices.

The blog is personal and opinionated. Posts are grounded in real experience — homelab setups, day-to-day tools, work-adjacent architecture thinking, and lessons from decades of web development.

---

## Repository layout

```
content/posts/{slug}/index.md   # One post per directory (Hugo page bundle)
content/posts/{slug}/*.{png,jpg,gif}  # Images co-located with the post
content/tags/{tag}/_index.md  # Optional tag landing pages (usually minimal)
themes/jwr/                   # Site theme — only change when explicitly asked
config.yaml                   # Hugo site config (AI disclosure text, nav, etc.)
archetypes/default.md         # Template for `hugo new`
```

**Post slugs** are kebab-case and descriptive, e.g. `today-i-switched-to-hermes-agent`, `a-snapshot-of-cloud-provider-usage-in-2026`.

Do **not** commit unless the user explicitly asks.

---

## Creating or editing a post

### File location

Create `content/posts/{slug}/index.md`. Put screenshots and diagrams in the same directory and reference them relatively:

```markdown
![azure.png](azure.png)
```

### Front matter template

```yaml
---
title: "Human-readable title"
date: 2026-06-19T12:00:00+01:00
draft: true
tags:
  - code
  - self-hosting
  - homelab
featured_image: cover.jpg          # optional — local file in the bundle
featured_image_url: "https://www.pexels.com/photo/..."
featured_image_credit: "Photographer Name"
description: "One sentence for SEO / social previews."
ai_assisted: "review-only"         # optional — see AI disclosure below
ai_assisted_model: "Composer 2.5 Fast"  # optional
---
```

### Front matter fields

| Field | Purpose |
|-------|---------|
| `title` | Display title. Often conversational; em dashes and subtitles are fine. |
| `date` | ISO 8601 with timezone offset (`+01:00` or `Z`). |
| `draft` | `true` until the author is ready to publish. New agent-written posts should default to `true`. |
| `tags` | See tagging section below. |
| `description` | Short summary for RSS/social. Fill this in for new posts when possible. |
| `featured_image_url` | Link to the **source page** of the stock photo (Pexels photo URL, not the CDN image URL). |
| `featured_image_credit` | Photographer or artist name. Rendered as "Cover image by {name}" linking to `featured_image_url`. |
| `featured_image` | Local filename (e.g. `cover.jpg`) in the post bundle. Used when you want a custom or cropped cover. |
| `featured_image_caption` | Rare — tooltip text on the cover image. |
| `medium` | Legacy — original Medium URL for migrated posts. Do not add for new content. |
| `ai_assisted` | `"review-only"` or `"mostly-generative-writing"`. Omit if no AI was used. |
| `ai_assisted_model` | Model name shown in the disclosure footer. |

### Summary truncation

Use `<!--more-->` after the opening paragraph(s) when the post is long and you want a clean excerpt on the home page. Common on snapshot/list-style posts.

---

## Tagging conventions

Tags drive the site navigation. The main menu links to **Code**, **Containers**, and **Cloud** — most posts should include at least one of these where relevant.

### Preferred tag vocabulary

Use **lowercase** for consistency (Hugo lowercases tag URLs anyway; mixed casing creates duplicate tag pages):

| Tag | When to use |
|-----|-------------|
| `code` | Programming, tooling, architecture, open-source projects |
| `containers` | Docker, Podman, Quadlet, Kubernetes |
| `cloud` | Azure, AWS, multi-cloud, cloud providers |
| `self-hosting` | Running services yourself |
| `homelab` | Home infrastructure — often paired with `self-hosting` |
| `AI` | AI tools, agents, LLMs, vibe coding |
| `today-i-switched` | Personal tool/product switches (see series below) |
| `my-tools` | Editors, terminals, productivity, workstation setup |
| `linux` | CLI tips, distro notes, system admin |
| `golang` | Go-specific posts |
| `projects` | Meta posts about naming, archiving, project philosophy |
| `monitoring` / `prometheus` | Observability |
| `ansible` / `redhat` / `certifications` | Red Hat ecosystem |
| `open-source` | Community/project governance |
| `architecture` | Enterprise/homelab architecture thinking |
| `automation` | n8n, CI/CD, agent workflows |
| `MCP` / `n8n` | Specific technologies when central to the post |

Project-specific tags (e.g. `"GoConnSPA"`, `olivetin`) are fine — quote names that contain capitals.

**Typical count:** 1–7 tags. Don't over-tag.

### The `today-i-switched` series

Posts about adopting or dropping a tool. Conventions:

- Include tag `today-i-switched` plus relevant tags (`my-tools`, `linux`, `terminal`, etc.).
- Frame as **early impressions**, not a definitive review — "snapshot for future-me".
- Mention what you switched *from* and *why*, with links to prior blog posts where applicable.
- Often end with a `## Summary` and a light-hearted sign-off (`:-)`).

---

## Featured images

The theme displays a cover image on every post. If none is set, it falls back to `/socialSharePreview.jpg`.

### Preferred approach (current convention)

1. Find a **metaphorical or loosely related** stock photo on [Pexels](https://www.pexels.com/) (Pixabay or Unsplash are acceptable alternatives).
2. Set `featured_image_url` to the **Pexels photo page URL**, e.g. `https://www.pexels.com/photo/grayscale-photo-of-a-futuristic-robot-8294608/`
3. Set `featured_image_credit` to the photographer's name as shown on Pexels.

The theme renders:

> Cover image by [Photographer Name](featured_image_url).

Do **not** embed attribution markdown in the post body unless migrating legacy Medium content.

### Local cover images

When using a custom cover:

```yaml
featured_image: cover.jpg
featured_image_url: "https://www.pexels.com/photo/..."  # still link to source
featured_image_credit: "Photographer Name"
```

**Pre-commit enforces 1200×630 px** for any `cover.png` / `cover.jpg` staged in git (`scripts/check-og-cover.sh`). Resize before committing.

### Legacy patterns (avoid for new posts)

Older migrated posts sometimes use `featured_image` with embedded Medium markdown or raw CDN URLs. Do not copy that pattern — use `featured_image_url` + `featured_image_credit` instead.

---

## Writing style

Write as **James Read**: a experienced, practical technologist who explains things through personal story and real setups.

### Voice and tone

- **First person**, conversational, direct. "I've been using…", "I think…", "In my experience…"
- **Honest and self-deprecating** — willing to admit wrong assumptions, past mistakes, or incomplete knowledge.
- **Pragmatic** — prefers tools that work in a homelab/systemd mental model; values stability, simplicity, and operability.
- **Not corporate** — avoid marketing speak, buzzword stuffing, or generic AI filler.

### Structure

- Open with **context**: why this topic now, what prompted the post, or a personal hook.
- Use `##` headings to break up sections. Many posts end with `## Summary` (occasionally `# Summary`).
- Use **bullet lists** for use cases, tool lists, and takeaways.
- Include **code blocks** and **screenshots** when teaching something concrete.
- **Cross-link** generously to other posts on this blog, [jread.com/projects](https://jread.com/projects/), GitHub repos, and external docs — always with descriptive link text.

### Formatting habits

- **Bold** key phrases sparingly for emphasis: `**Hermes + Telegram + systemd**`
- **Em dashes** (—) for asides, not hyphens
- **Blockquotes** for historical quotes or definitions
- **`:-)`** emoticon for warmth/humour at the end of sentences — this is a signature; use occasionally, not in every paragraph
- Mermaid diagrams are supported (see `the-goconnspa-stack` post) but rare

### What to avoid

- Emoji (James uses `:-)` not 😀)
- Overly polished "thought leadership" tone
- Declaring victory too early on tool reviews — prefer "early impressions", "so far", "I'll report back"
- American spellings unless quoting code/API names
- Filler phrases: "In today's fast-paced world…", "Let's dive in…", "It's worth noting that…"

### Example opening (good)

> This is a brief snapshot post — mostly for future-me to look back on — about my early success with Hermes Agent. I've only been running it for 9 days, so treat everything here as **first impressions**, not a long-term review.

### Example closing (good)

> Too early to declare victory, but Hermes + Telegram + systemd already feels like a better personal agent setup than OpenClaw did for me. I'll post again once I've had a few months of real usage — or once the API costs make me rethink my life choices :-).

### Publishing philosophy

James sometimes publishes **good-enough posts** rather than waiting for perfection ("I'm just throwing this blog post out there to get it started"). Agents should match that pragmatism — complete, readable, honest — but not over-polish into generic content.

---

## AI disclosure

The theme renders an AI disclosure footer on every post. Configure via front matter:

| `ai_assisted` value | Meaning |
|---------------------|---------|
| *(omit)* | Written by the author without AI |
| `"review-only"` | Author wrote it; AI helped review |
| `"mostly-generative-writing"` | AI drafted most of the text; human reviewed |

When an agent writes or heavily rewrites a post, set `ai_assisted` appropriately and include `ai_assisted_model`.

James often **writes blog posts by hand in neovim** and uses AI for code/projects — respect that distinction. Don't assume AI authorship for posts unless told.

---

## Post types (quick reference)

| Type | Characteristics |
|------|-----------------|
| **Tool switch** (`today-i-switched`) | Short-to-medium, personal, compares old vs new, links to prior posts |
| **Tutorial / tips** | Numbered sections, code snippets, actionable commands |
| **Snapshot / inventory** | Lists current usage (cloud providers, AI tools, homelab services) |
| **Opinion / essay** | Longer narrative, personal history, single thesis |
| **Project announcement** | OliveTin roadmap, resilience plans, community updates |
| **Certification / review** | Red Hat exams, email providers, etc. |

---

## Build and validation

```bash
hugo server -D    # local preview including drafts
hugo              # production build → public/
```

Pre-commit hooks check trailing whitespace, YAML validity, and cover image dimensions. Run `pre-commit run --all-files` if available before committing.

---

## Agent checklist

When creating or editing blog content:

- [ ] Post lives at `content/posts/{slug}/index.md`
- [ ] `draft: true` unless explicitly publishing
- [ ] Tags use lowercase (except quoted project names); include `code` / `containers` / `cloud` where relevant
- [ ] Pexels (or similar) cover with `featured_image_url` + `featured_image_credit`
- [ ] `description` filled in
- [ ] British English spelling
- [ ] James's voice — personal, practical, honest
- [ ] Cross-links to related posts and projects
- [ ] `ai_assisted` set honestly if AI wrote or heavily edited the post
- [ ] `cover.jpg` is 1200×630 if used
- [ ] Do not commit or push unless the user asks
