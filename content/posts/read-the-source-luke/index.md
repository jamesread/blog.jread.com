---
title: Read the source, Luke
date: 2021-05-24
tags:
  - code
---

Reading the source code is a pathway to many abilities that some consider… unnatural.

*Luke’s original strategy was to attack the death star via SQL injection, but in the end he went for an X-Wing based buffer overflow.*

**I want to encourage you to actually read through the open source code for the software that you’re using.** Doing so has many potential benefits, and skills like this can give you a real edge and advantage in your team. In the article I’m going to outline my top three benefits for doing so.

Many people will not be able to understand the complexities of large programs, or unfamiliar programming languages. However, you don’t need to be a skilled programmer and understand every detail to get benefits from reading source code. Many people in IT are not programmers. My top three reasons to spend time reading the source code for applications you use, are;

1. **Documentation often hides the true meaning of the force**— how does this code REALLY work? Does this app/API/library actually work in the way the documentation describes?! Are there any undocumented features? Undocumented issues?

1. **Root cause analysis after the battle **— even after reading through patch notes and documentation, and looking at logs and config files, sometimes it’s necessary to look at what was going on in the code. This is especially useful to work out how an issue was allegedly patched.

1. **Bend the force to your will**— make changes and customizations, after reading the code, making small and useful changes is often not as difficult as you expect.

## Documentation hides the true meaning of the force

![Courtesy of [https://starwarsintrocreator.kassellabs.io](https://starwarsintrocreator.kassellabs.io)](https://cdn-images-1.medium.com/max/2000/1*wWDiLe8VzdtYZ-AbpMQ02w.png)*Courtesy of [https://starwarsintrocreator.kassellabs.io](https://starwarsintrocreator.kassellabs.io)*

In particular, so much API documentation is built up from code and function comments, which inevitably fall out of sync as code is updated and changed. Documentation might well tell you that a program “does X”, or an API call “computes Y”… only for you to find out that in the real production world the code actually does “potato”.

**My examples of how reading through the source helped me better understand code;**

1. Recently, I’ve been working my way through adding a grpc-gateway (REST on top of gRPC) to [OliveTin](http://github.com/jamesread/OliveTin). I found it so frustrating that the API documentation is very limited (on a difficult to read website). After hours of frustration, I found myself just opening up the project in vim and started having a read. It’s far more simple to see what is exposed and how that code works than reading the docs.

1. In the early days of my programming hobby, I learned C / C++ by reading through the Quake3 source code and copy-pasting things I found on the internet to make changes.

1. I have found countless undocumented methods and functions that were useful to me in OpenGL and SDL libraries, and various web APIs I’ve used over the years. Fun fact, [many security vulnerabilities exist in public APIs that are not documented](https://www.youtube.com/watch?v=g-JgA1hvJzA) (in that case — Google — unfortunately their code is not open source!).

## **Root cause analysis after the battle**

![The battle of Dev and Ops?](https://cdn-images-1.medium.com/max/3840/0*XFQ7Owqi1IonGZkX.jpg)*The battle of Dev and Ops?*

If you’ve ever had to do a root cause analysis in a decently complex system, at some point someone probably read through some source code. Maybe they didn’t go into the Linux kernel to work out how memory is allocated, but if you’ve ever looked at a stacktrace or memory/core dump, that’s going to require code at some point.

Looking at configuration files, documentation, and notes is likely to answer most questions in most cases. But patch notes in particular probably reference a bug/issue number, and that will probably link back to source code. Having a look at how something was actually patched, after they just said, “it was fixed”, is often really revealing.

Some fixes can be nasty — if a project just increases a timer timeout, or if they just add in a few more bloated checks in already complex code. As an ops person, you don’t have to have a degree in C++ to understand a few small code changes in a patch.

I do this with most software I use regularly — there are too many examples to list. Where I’ve found it useful, is if I then see a patch or fix doesn’t really address the root issue (or introduces other problems). Find below all the helpful information you’ll need to solve any technical issue.

## **Bend the force to your will**

![All I wish for Christmas is a web browser that doesn't use 2Tb of RAM. (I’m joking — I use Firefox ❤)](https://cdn-images-1.medium.com/max/2974/0*ww32C4qFqjH_u_g2.jpg)*All I wish for Christmas is a web browser that doesn't use 2Tb of RAM. (I’m joking — I use Firefox ❤)*

In a recent article I documented how I spent a bunch of time deleting tonnes of software from my Linux workstation after a failed upgrade, which led me to using a lightweight desktop and terminal. I then needed to [recompile that terminal program to make config changes](https://medium.com/james-reads-public-cloud-technology-blog/recompiling-a-linux-terminal-a-story-of-time-well-invested-9895a9e31a38). However, making those changes was super easy (the terminal —[ st](https://st.suckless.org/) — is designed to be tweaked and recompiled). I was surprised at just how easy it was though, it took me only a few minutes rather than hours like you might expect.

So many of the apps we use on our desktops and servers are open source, which allows us to tweak and change and customize them as much as we like. It’s strange that so many of us rarely just get on and make code changes. We instead spend time moaning on bug and issue trackers. Often when we can probably make small tweaks ourselves easily much more quickly.

**Examples of how reading the source makes it easy to make a few simple changes;**

1. Remove or tweak an annoying log message that keeps popping up (I did this quite a lot with parts of OpenStack in the past).

1. Edit a few assumptions or defaults an application makes — like I did with the st terminal above — added some extra keyboard and mouse terminals.

1. Just remove parts of code you don’t like. I often get really frustrated about software that runs on “0.0.0.0” (all interfaces) by default, and doesn’t allow you to change it — just the port. I’ve made code changes in stuff like jabberd and bitlbee in the past to listen on just 127.0.0.1 — tighter security controls.

## Summary

Maybe I’ve been watching too much of Star Wars: Clone Wars recently (The Mandalorian was excellent, and I cannot wait until Season 3!).

print(“Read the source, %s”, yourName);
