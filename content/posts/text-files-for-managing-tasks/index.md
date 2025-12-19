---
title: "Use simple .txt files for organising tasks"
date: 2024-02-28
draft: false
tags:
  - code
  - my-tools
  - vim
  - git
featured_image_credit: "webandi"
featured_image_url: "https://pixabay.com/photos/stone-tablet-latin-board-writing-2185080/"
---

I am so sick and tried of changing task management systems, I will just be using plain .txt files from now on.

In the last 10 years, I have tried so many different systems for organising my work and my personal life and yet I've not been able to keep using one of them after a few weeks or months. After all this time I think I've finally come to the realisation that they all suffer from the same inadequacies. Before anybody recommends me their favourite, here is a list of apps I've tried; RememberTheMilk (~2011), Trello, Google Keep (~2015), Google Tasks (~2022), Todoist (~2018 I think, but again in ~2023), and of course, because I am developer with a hammer (ie: the ability to write code), I had to write my own - [wacky-tracky](https://github.com/wacky-tracky/wacky-tracky-client-html5/). I have probably had the most all around success with TaskWarrior (until recently).

All of these options have the following flaws and limitations;

- Most of them allow a level of nesting, or sub-tasks, or dependencies, but it's so often clunky to be able to cross references tasks between different projects, or when projects have the same dependency. Most complex tasks are difficult to break down into next steps (yes, looking at you, GTD), and sometimes it's useful to store reference material (ie, notes about a task) alongside the place where you'll next work on that task.
- Sharing tasks from your tasks system, to copy into an email, or similar, is a pain. Many friends or co-workers are not using the same task tracking tool as you (this is one of my biggest problems), or task tracking tools don't offer a simple copy and paste out of their format for sharing in emails, etc.
- Most task tracking apps do have have clients on Android, and some have the web too (this is important, as most of my tasks are done in front of a computer, not my phone). However the web version and the mobile app just don't work nicely together, or have slow syncing, or don't have the same feature parity. Sure, a web-app works on any web browser, but I do I want to go searching browser tabs to find my task app? No. So many weppapps don't have good shortcut key support, or are bloated, too.
- So many of the app publishers lose interest. Google is notorious for dropping support for their projects and tools. Trello hasn't had any new functionality in at least the last 5 years. RememberTheMilk went out of business.
- Backup any sync. So many apps make it hard to go back to hisorical tasks, or encourage you to entirely delete old tasks. Some of these task apps have broken during syncs (my biggest problem with TaskWarrior), and end up spewing duplicate tasks all over the place.

Plain .txt files literally solve all of these problems. I can use my beloved vim, with it's keyboard shortcuts, universal availability, lack of bloat, and huge customizations I already have for using vim every day, to just write simple text files. Moreover, a huge advantage for me is that I can add those text files to git, and store versions indefinately into my mega Git backup system :-)

I do have some templates for common activities, like meeting notes, if you're interested - and yes, I do use unicode emoji from time to time, I'm not a monster!

```text
yyyy-mm-dd

Attendees
	Red Hat
		- James Read

	Asdf
		- Aasdf

Objective

Notes
	Asdf

Ⓐ	Action
	[James] Asdf


📖	Research
	- Asdf

❓	Question
	- Asdf

👨	Contact
	- Asdf <asdf@asdf.com>
----
```
