---
title: "AI Levels of Autonomy in Software Engineering "
date: 2026-02-15T23:45:48Z
draft: false
tags:
  - code
  - AI
featured_image_credit: "Tamara Elnova"
featured_image_url: https://www.pexels.com/photo/close-up-of-wet-grass-12226331/
description: ""
---

AI tooling for software engineering has moved quickly from fancy autocomplete to the verge of fully autonomous engineering. Most people can see that AI adds value. The real question is no longer *whether to use AI*, but *how much autonomy to give it*.

Capability alone doesn’t justify maximising autonomy everywhere. You have to match autonomy to risk. This post defines a simple scale of autonomy levels and where I draw my own lines.

<!--more-->

This is especially relevant in early 2026: models and agents are proliferating, and autonomy is rising. The canonical example is OpenClaw—a fully autonomous agent (Level 5 in this taxonomy)—though its scope extends well beyond software engineering.

## Autonomy is a function of risk

The right level of autonomy depends on the risk of your project.

Low-risk environments—personal or disposable software, prototypes, greenfield projects—carry little downside. They’re good proving grounds for higher autonomy.

Production systems, customer-facing applications, heavily used apps, and regulated environments carry much higher risk. There the cost of mistakes is real, so the acceptable level of autonomy drops.

**As risk increases, acceptable autonomy decreases.**

## A sliding scale of autonomy

A simple sliding scale captures the levels:

```ini
Human Control <--------------------------> AI Control
               L0   L1   L2   L3   L4   L5
```

Below are levels 0–5.

## Level 0 - No AI Assistance

No AI in the loop. All coding, testing, documentation, and review are done by humans. Traditional software engineering.

## Level 1 - AI as a Productivity Boost

**Human drives, AI nudges.** Autocomplete, docstrings, snippets. The human remains in full control; AI only accelerates typing and boilerplate.

Tools I use: Copilot (code generation and autocomplete).

## Level 2 - AI as a Pair Programmer

**AI suggests, humans decide.** AI generates non-trivial functions, refactors, tests, and docs; humans review and approve every change. Responsibility stays with the human.

Tools I use: [CodeRabbit](https://www.coderabbit.ai/) for code review; [Cursor](https://cursor.com/home) for generation and refactoring suggestions.

## Level 3 - AI as a Semi-Autonomous Engineer

**AI implements; humans orchestrate.** AI can deliver whole features plus tests and docs. Humans own specs, architecture, and direction.

Tools I use: [Cursor Agent](https://cursor.com/home).

## Level 4 - AI as Autonomous Executor

**AI delivers artefacts; humans describe intent** - AI outputs everything, humans don't look at the code. Success depends on clear specs and strong context (e.g. “context engineering”).

Tools I use: [Cursor Agent](https://cursor.com/home) with [BMAD](https://docs.bmad-method.org/) for spec-driven development.

## Level 5 - Fully Autonomous Software Engineer

**AI writes, tests, reviews, merges; humans supervise outcomes.** AI owns the full SDLC; humans set goals and guardrails and inspect results.

I haven’t used this level in practice yet. As of early 2026 it’s still rare in production software engineering.

## More autonomy is not always better

Higher autonomy is not inherently better. The goal is to **match autonomy to the task and the risk**, not to maximise it.

Team familiarity with AI tooling matters. I stayed at Level 1–2 until I was confident with the basics before moving to Level 3 and 4. My aim is to be comfortable at every level so I can choose the right one per project—and to keep trying new tools as the landscape evolves.

There are some projects that I have today where I have deliberately chosen to limit the level of AI autonomy to Level 1, or 2, mostly because the risk is much higher in those projects, or I quite simply enjoy the concept of actually writing code myself :-)

## My brief history with AI tools

I intend to write a much longer article about my history with AI tools - infact I actually have it in draft at the moment - but I thought it would be helpful to share a brief history of my experience with AI tools, and how that experience has shaped my thinking about the different levels of autonomy that I trust AI with.

Like many others in the software engineering world, I started with a lot of scepticism, before trying tools like copilot to see what it could do. In the beginning, I didn't think AI could do much more than fancy autocomplete, but as I started seeing more tools and capabilities, I found myself trying to categorise the different levels of autonomy that I was comfortable with.

The second tool I adopted was a code review tool - CodeRabbit - which I found in my contributions to the Postiz project in early 2025. I was surprised by how much I trusted the tool to review my code, and I found myself relying on it more and more as I got used to its suggestions. This made me realise that there are different levels of autonomy that I trust AI with, and that these levels can be categorised in a way that helps me understand where I'm at with my AI adoption.

At the time of writing, I did a quick search for a standard industry model to AI autonomy in software engineering, but I couldn't find a taxonomy that I felt captured the different levels of autonomy that I was experiencing. So, I decided to create my own set of levels to help me understand and communicate about AI autonomy in software engineering.

I’m treating this post as a reference: I’ll link to it from future posts and project pages so readers know where I draw the line. I’d like it to spark a conversation—and to hear how others think about autonomy.


## Conclusion

I’d adopt an industry-standard model in a heartbeat if one existed—if you know of one, I’d like to hear about it. Until then, this framework is how I think about autonomy, and I’ll link to it from my projects so others can see where I draw the line.
