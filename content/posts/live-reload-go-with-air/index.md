---
title: "Live reload Go with air"
date: 2024-01-30
draft: false
tags:
  - code
  - golang
  - my-tools
---

It can be a real effort to bring yourself to write articles to maintain a healthy blog, and sometimes the simple articles are best. Therefore, I just want to take a quick few moments to talk about a tool that I just cannot live without now-a-days, when writing Go code, I am always live-reloading with Air in the background.

It's really valuable for developers to be able to get fast feedback on the code that they are writing. Many of use will use one monitor for the code in web applications, for example, and another monitor for the web browser to quickly glance to the side, and refresh the page. However with non-web applications, it can be a little more tedious to compile, re-run tests, and run the application once again. Of course it isn't difficult - most developers of microservices and similar will have a terminal window open on that second monitor, and they'll hit Up on the keyboard to get the last command, make, ./myapp, etc. 

`air` is a simple Go application that does goes that. It uses inotify to look for changes to .go files, and simply runs `go run main.go` (recompiling as necessary), or it can be customised to run `make, or whatever`. It will then run `myapp` in the foreground, restarting it with the updated changes.

Quickstart;

```shell
user@host: cd projects/myGoApplication/
user@host: air init
user@host: air
```

This will generate a simple `.air.toml` file in the current working directory - which is used to configure air, but most of the time no configuration is necessary. The 2 things that I might normally change are `go build` to `make`, and occasionally I'm working on apps that need a slight deliberate delay before restarting - there is a helpful `delay` flag.

So, I use `air` on all my Go projects now-a-days, I encourage you to get stated by looking at the Github project page - I hope this helps you get faster feedback cycles in writing Go! https://github.com/cosmtrek/air
