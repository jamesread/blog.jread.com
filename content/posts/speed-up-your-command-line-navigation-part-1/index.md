---
title: "Speed up your command line navigation"
date: 2020-01-21
draft: false
medium: https://medium.com/james-reads-public-cloud-technology-blog/speed-up-your-command-line-navigation-d4050207f02c
featured_image: cover.jpg
featured_image_credit: Kevin Ku
featured_image_url: https://www.pexels.com/@kevin-ku-92347?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels
tags:
  - misc
---

# Speed up your command line navigation

Photo by Kevin Ku from Pexels

Knowing a few key shortcuts can have a surprising impact. As someone who sits frequently with others over a command line to help debug code and navigate servers, it’s easy to become frustrated on their behalf at how cumbersome things can be when you may not know time-saving shortcuts.

Here are some essential shortcuts and key tips to help you speed up your command line usage.

**Update: **this article seemed popular. So I wrote a follow up [Part #2 here.](https://medium.com/james-reads-public-cloud-technology-blog/speed-up-your-command-line-navigation-part-2-d55ef1ef8ca9)

## Run that again as root — sudo !!

    user@host: cat /var/log/messages
    cat /var/log/messages: Permission denied.

**Don’t type:** Up. Left. Left. Left…. sudo Enter. Eugh.
**Instead: **sudo !!

This is a little shortcut works, because !! is a shell place holder for the last command executed. Typing these 7 characters will run that last command as root without those Up and Left keypresses. Equally this shortcut works without sudo, if you want to run the last command again without changes, for some reason.

## Re-type that last argument — Alt+.

Did you want to use that last argument you just typed? The directory you just created, for example?

**Don’t type; **mkdir MyNewDirectory; cd MyNewDirectory
**Instead;**

    mkdir MyNewDirectory
    cd <Alt+.>

## Search for that command I ran — Ctrl+R

What was that command I ran? Up. Up. Up. Up. Oh there it is.

You search through your history one step at a time because you don’t know any better. What if I told you… there was a search!;

**Don’t type:** Up. Up. Up. Enter.
**Instead: **Ctrl+R

Simply tap Ctrl+R, and type the first few letters of the command you wanted. If the search doesn’t match on the first result, just tap Ctrl+R a few more times to scroll through results — shown below searching just on cat.

    (reverse-i-search)cat: sudo cat /var/log/messages

## Go back to your home directory — cd

You would be amazed how many people don’t know this. cd. That’s right. Without any arguments, it takes you back to your home directory.

## Go back to the last directory - cd -

Sometimes the simplist things are the best. Where you in the /var/www/foo directory, but are now in /etc ? Simply cd - will take you back to /var/www/foo .

**Don’t type:** cd /var/www/foo
**Instead:** cd -

## Job control — backgrounding, foreground, etc

This might take some getting used to, but when you get the hang of it you’ll never go back. Let’s say you are editing a file in vim (well, you wouldn’t use nano , would you?!), and now you want to go and look in the /var/www/html directory. You could quit vim, browse to the directory, only to find that you want to edit the file again. Instead, you can send vim to the background and come back to it later.

**Type:** Ctrl+Z — This is a shortcut that backgrounds any existing foreground task. Useful for, but not limited to; less , cat , man , vim , etc.

Where did my foreground task go, you might ask. Simply type jobs to see it in a list.

    user@host: jobs
    [1] Stopped       vim 

Great. You can now go do something else. whenever you want this back again, simply, type fg . This will bring the background job (vim) back again. Note that the process is paused, so if you’re running something like tail on a file, the process will have some catching up to do. If you have multiple jobs running in the background fg 3 , for example, will resume the 3rd job. Don’t forget to run the jobs command to see a list.

## Alias the stuff you use frequently — eg netstatx

If you run a command with the same arguments nearly all the time, create a “shortcut” alias for this — I have many of them. I often use the <commandname>x syntax — ie, the command’s normal name followed by an x. For example, with netstat, I always run it with -n(numeric addresses only) , -t (tcp protocol), -a (all), -u (udp protocol), and -e (extended output). netstat -ntaupe — it rolls right off the tounge. I’m lazy though (and might forget an option), so I aliased that to netstatx like this;

    alias netstatx="netstat -ntaupe"

Try it for anything you run regularly.

**Don’t type:** netstat -ntaupe
**Instead:** netstatx (or whatever command you use often!

## Summary

Investing time now to learn how to save time in the future will really speed up your life :-)

**Update: **this article seemed popular. So I wrote a follow up [Part #2 here.](https://medium.com/james-reads-public-cloud-technology-blog/speed-up-your-command-line-navigation-part-2-d55ef1ef8ca9)
