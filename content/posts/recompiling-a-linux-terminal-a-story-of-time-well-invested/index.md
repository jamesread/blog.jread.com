---
title: Recompiling a Linux terminal — a story of time well invested
date:2021-02-08
tags:
  - my-tools
---

My desktop after the story; i3, st, and some other stuff.

It was worth it, but I need to explain how I got here.

It’s about 2pm on a Friday afternoon, my week of meetings is finally drying up. I have a few hours in my calendar the rest of the day — and I’m not going to spend it catching up on more emails. I want to fill these last couple of hours with something a bit more fun, so I pick up the Ansible collection I was hacking code on and get to work.

About 20 minutes in, I found a small issue that ideally needed me to upgrade from Ansible 2.8 to 2.9 to fix. No drama. I would simply run dnf upgrade ansible normally, but my slightly out of date Fedora 32 distribution also required an update to get Ansible 2.9. Hey, it’s Friday, I’ve upgraded a million times, I can just grab my laptop out and work on that, while my main desktop spends 40 minutes or so doing an upgrade. A few memorized dnf system-upgrade commands and off it went, while I opened my laptop and alas, started looking at email.

At some point I pushed my laptop on my desk as I shuffled in my chair, inadvertently pushing my main keyboard, and a bunch of keys on said keyboard. The happy little upgrade progress bar ground to a halt, and 4 screens went blank. Ooops. For what it’s worth, I think I mashed several F1, F2, F3 keys, although I’m not entirely sure. Maybe I just switched virtual terminals now thinking about it (Ctrl + Alt + F2, F3, etc). However, I did pause, and I did think for a moment — you’re often given that “Do not turn off your computer during an upgrade” message, but those are superficial now-a-days, right? RPM upgrades are not that complex, and everything is journeled, etc. Screw it, the screens are black and everything looks dead at first glance, I’m doing a hard reset.

The BIOS pops up, the boot loader, the first few kernel messages, and kaboom. Damnit.

Linux being what it is, I can very easily get into a single user terminal. Let’s see what the damage is.

Symbol not found in libsolv: _rpmSf9a

Oh. For the uninitiated — that was me trying to run dnf (the Fedora package manager), and it’s main dependency solving library (libsolv) basically cannot be loaded. The more complex answer is that dnf and libsolv versions probably did not match up — so it was looking for a entry point or method in a different version of the library, or whatever. It’s not important to this article, but it meant my package manager is busted. That’s going to make it a lot more tricky to repair damage if I cannot install or uninstall anything easily.

Okay. Frustrating, but Fedora downloads all it’s updates locally. I can just update libsolv, or dnf, or whatever needs updating manually. and then continue with my day.** 10 minutes of productivity lost so far.**

/var/cache/dnf/system-upgrade contains all my downloaded upgrade RPMs. I find the new dnf , libsolv, and various other RPMs for Fedora 33 that need to be installed. I try, and, no. Python 3.9 required. Hmm, a quick check, python --version , I have 3.8. Ugh. I try installing the Python 3.9 RPMs manually ( rpm -U python3-3.9...), Nope. Not allowed, it conflicts with Python 3.8.

Now, it’s getting a bit annoying. You see when Fedora installs stuff like Python, it installs the RPMs in such a way that typically Python 3.8, 3.9, and all the way back to versions like 2.7 can co-exist on the same system. It’s probably not doing rpm -U ... under the covers (upgrade), but it wasn’t doing a general install either ( rpm -i ... ), I tried that. **25 minutes of productivity lost so far.**

Okay. Breathe. How many packages can really depend on Python 3.8? … 390?! What the HELL?! What is all this junk? python3-oslo-config, python3-twisted, python3-bla. It wasn’t just some old tools (Oslo is part of the OpenStack clients, which I’ve not used in years), and some libraries (twisted is a popular Networking library), as I soon found out, the rabbit hole went much deeper than I could have imagined. I’m determined to fix this, I’m not going to reinstall (I’ve had this install for years, and what do you learn by doing that?!). Now, in hindsight, I should have just looked up how to install Python 3.9 at the same time as Python 3.8 — I did have a quick search, but I did not find the answer easily. People don’t really do that by hand.

Fine. I’m doing this. And so it begun, again, without a package manager that handles dependencies, I started erasing one by onerpm -e python3-oslo-config python3-psutil python3-pyyaml. I needed to be faster. 387 remain. I bust [out some shell shorthands](https://medium.com/james-reads-public-cloud-technology-blog/speed-up-your-command-line-navigation-part-2-d55ef1ef8ca9);

    rpm -e python3-{trio,msrest,cmd2}

So many to go. Oh but wait, there’s more dependencies. yamllint requires python3-yaml, so that gets deleted too. On and on I go. **At least 1 hour of productivity lost so far.**

**Ding,** goes my laptop calendar. Arf, an afternoon meeting. I join on my working laptop. I spend most of the meeting removing python3 packages on my desktop while I listen to people talk. I did engage, and speak up, but I did also remove a lot of packages. 260 to go.

Then there was KDE. It’s been my loved, trusted desktop for over a decade. It’s okay, I can reinstall it. It gets removed — Python 3.8 has become a mortal enemy.

It didn’t let up. I needed to remove OpenGL, my Nvidia Kernel mode setting drivers, libreoffice, photo gallery stuff. It started to feel cathartic. I didn’t use a lot of what I was removing, yes, I use KDE, but a small fraction of it — the “desktop”, and the terminal. As I slowly got closer to my goal, a new thought dawned on me.

This is mostly all junk. Libraries and utilities built on top of one another. Layers upon layer that are getting further and further away from the Linux philosophy of doing one thing, and doing it right.

When I finally removed Python 3.8, I found that Python 3.9 installed without a fuss. So did the upgraded version of RPM, libsolv, dnf and the other stuff I needed to bring my wounded system back from near death. I rebooted and to my surprise I got a functional, graphical login screen.

Meeting finished. I could end my day early here, but I’d need to have a functional desktop for work next week — so I should continue. Besides, despite a bit of frustration, this was turning into fun. **1 hour, 40 minutes of fun in the making.**

Wait, what? I just removed probably over 500 packages, and after a mass cull of packages anda reboot, my login screen was working?

More importantly for this article, was that of course, KDE was not there — but it defaulted to logging me in with a desktop I’d entirely forgotten about — i3.

Now, i3 is the opposite of KDE in every way. It’s pedantically minimalistic. It’s low on resources, and everything, including all keyboard shortcuts needed to operate it (for there is nothing graphical about it really), are controlled by a config file.

I sat, staring at my very plain terminal, with a window manager that used a tiny fraction of resources (and functionality, and bloat) of KDE, and I thought to myself — I’m going to stick with this for now.

You see, after spending that precious time removing everything, thinking about the bloat it contains, to add it all back again really is wasted productivity. What can I learn from this experience instead?

I’ve always heard that i3 is favoured for it’s potential boost in productivity. While it is minimalistic, and while you do have to invest time fine tuning a config file, it should be “just faster” in the end.

Now I need to pause in this long story, to explain, I don’t have time on my side. There may be a few hours available on a Friday afternoon, sure, but I’m busy, and do have “real work” to do. Moreover, I have a 3 month old baby, and he, and the wife do /not/ appreciate “unnecessary” computer time! However, opportunities to hack my own productivity has become an obsession, and I’m not scared of investing time to learn now, to get gains later. Having something that “just works” now isn’t as important as having to invest some time for something that “just works better” later. Case in point: vim. Anyway, I digress.

It didn’t take hours to configure i3, it took about 10 minutes to do the initial setup (and admittedly some minor tweaking through the weekend). It’s configuration syntax is far far more user friendly than it first appears. It just does exactly what you tell it to. It’s a tiling window manager though, and it’s going to take some getting used to. Again, time well invested if it ends up making me more productive.

I browse a few web pages, and fix that [Ansible collection](https://github.com/jamesread/jwr-ansible-collection/) that I wanted to do before I started all this, and I join my wife and baby a just a little later than a typical workday ends — at about 6pm. I it probably **cost me a maximum of an hour in lost actual productivity**, but **about 2 hours 30 minutes of total time, **if you factor in time while on meetings and doing a bit of work on my laptop too. I certainly have been in wasted meetings for more than 2 hours 30 minutes this week. So net-net, I’m doing OK.

I could have stopped there. I did not.

While I don’t return to my computer until the evening (free time, after the baby is asleep, dinner cooked, said hello to the wife, etc), I’m hungry for more.

The default 10 workspaces that i3 comes with — I don’t use — I have 4 monitors on my main desktop, and they are each a workspace. So I take those out of the configuration.

I find myself reaching for Alt+F2 — the KDE shortcut to run the launcher. I add that to the configuration.

I reconfigure the “taskbar” — i3status, to represent the minimal amount of stuff that I need, basically just a clock.

i3 is looking good. Firefox is working. I launch a terminal to do something else. Eugh, it’s not snappy — it takes 1–2 seconds to load. That’s because the terminal I’m using is still my beloved KDE’s konsole. “It’s having to load all that KDE stuff under the hood just to give me a terminal”, I thought. Now, I know that st (simple terminal) is popular with the crowd that uses i3. So I open it. Black screen — which my eyes just cannot deal with. Mouse wheel and keyboard shortcut zooming does not work either — which I use extensively.

I could have stopped there. Again, I did not.

Now st does not come with a configuration file, it comes with config.h. That’s right, C source code. If you want to make a configuration change then your only option is to recompile.

That is because st was built by people who have the philosophy that software should suck less, and be simple, clear and frugal; [http://suckless.org](http://suckless.org) . Imagine their horror that I have been mostly using KDE for 10+ years.

Now I imagine that even the most geekiest of geeks would probably think “recompile source code to change the background colour of the terminal? No thanks”. I did think that for a moment, but I’ve had the same background color in my terminal for well over 10 years (it’s a beige colour — easy on the eyes, if you must know). So I only need to change it once, and I know C, what do I have to be afraid of?

git clone [https://git.suckless.org/s](https://git.suckless.org/s)t

I open config.h, and find unsigned int defaultbg = … in a second or two. I see an associative array of colors. I add #ffffdd (beige), run make and run st. Not only did it work first time, but I’m greeted by what looks like a familiar looking terminal, and it’s so much snappier, and faster than that big bloated Konsole.

I smile to myself. I’m reminded of a conversation I had with a colleague on Friday afternoon — he poked fun at my broken Linux machine I’d mentioned in chat, his MacOS machine “just works” :-) What made me smile though is that he told me he was spending part of his weekend watching the superbowl. He joked that I would be fixing my machine all weekend! Now, I certainly did not spend “all weekend” fixing my machine, but I certainly did not imagine I would be using a precious free hour of my remaining weekend to recompile a terminal!

The story continues a bit further. I didn’t stop there, I needed to hack in support for mouse wheel zoom scolling in my terminal. That didn’t take hours — st is really nicely written. This is literally all it needed;

    static MouseShortcut mshortcuts[] = {                                               
        /* mask        button   function  argument release */   
        { ControlMask, Button4, zoom, {.f = +1 } },                   
        { ControlMask, Button5, zoom, {.f = -1 } },                    
    };

Now it’s important to state I’m certainly not programming here — config.h is much more like a conventional configuration file, with lots of starting points for stuff most people need. Yes, most people would be put off by running make afterwards, but, is that really far from a yaml configuration file and restarting a service? No, it really isn’t.

## Summary

In **summary** the story is that I spent a few hours fixing a broken upgrade, I removed more packages while fixing it than I normally would, and I started back with a minimalistic desktop and I had to recompile a terminal to get what I wanted.

## The moral of the story

Now, I could have just reformatted and reinstalled, or found the “proper” way to fix the broken upgrade. I certainly could have reinstalled the familiar KDE for which I have been (and still am) a long time fan.

**The point is,** Linux gives us the power to get “under the bonnet”, and choices, and the source code to change those choices and what is under the bonnet if we choose. So few people, even Linux users, take advantage of that. For the longest time I’ve not recompiled applications I use frequently, or deviated from the default settings. But, I can, and I’m a power user who knows how to do those things, so why don’t I?

With the **main justification** that using i3 lends itself to productivity for power users (after investing some time getting to know it), and the **secondary justification** seize learning opportunities, whatever they are, wherever they are (ie, a broken package upgrade).

**I consider this time well invested.**
