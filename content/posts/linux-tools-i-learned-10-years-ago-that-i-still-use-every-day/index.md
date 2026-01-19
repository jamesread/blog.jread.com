---
title: Linux tools that I learned 10 years ago, which I still use every day
date: 2021-05-12
tags:
  - linux
  - code
featured_image_url: "https://www.pexels.com/photo/background-blank-business-craft-301703/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels"
medium: https://medium.com/james-reads-public-cloud-technology-blog/linux-tools-that-i-learned-10-years-ago-which-i-still-use-every-day-9289f952f169
---

There are a lot of cool Linux commands and tools you COULD learn, but what’s the point in investing a bunch of time if you just use them once a week, or once a month? A good example I like to give is Vim — it takes a long time to learn and master, but I use it over 10 times a day so it’s worth it.

## vim — the universal text editor

I remember thinking vim was stupid — so many keypresses and shortcuts to remember. Before that I was a nano user. What got me to switch? I started getting really annoyed that all the servers I was logging into didn’t have nano installed, didn’t have syntax highlighting, and similar. I consciously stuck with it and now I have a text editor that I love on every server.

vim has a steep learning curve, but it really pays off in productivity over time.

## ps and htop — listing and finding processes

I pretty much always run ps aux | grep ... to find a list of process threads, process IDs, or what user a process is running as. I find that this is incredibly powerful because ps and grep is always available on every server.

    root@stuffbox: ps aux | grep bash
    root        8258  0.0  0.1 225772  4860 pts/0    Ss   May11   0:00 -bash

For servers that you login to on a regular basis, the htop program provides a little more flexibility and ease of use — and supports things like sorting columns in your terminal using the mouse.

![htop screenshot — a process manager in your terminal](https://cdn-images-1.medium.com/max/2166/1*0WsxoUIZsK4wvTskHFhv_w.png)*htop screenshot — a process manager in your terminal*

## ss and netstat — what ports is that process using?

netstat is an old tool now-a-days, largely replaced by ss in most distributions. In my first sysadmin job, I learned these command line flags which I always use; ss -ntaupe

* -n lists processes using numeric addresses (eg, IP addresses instead of DNS names)

* -t lists TCP connections

* -a lists all connections — listening and established

* -u lists UDP connections

* -p shows the process using the socket — probably the most useful

* -e shows some extended information, like the uid.

**Edit: **Thanks to [Lawrence Xu](undefined) in the comments — ntaupe is actually an anagram of peanut! I don’t know how I’ve never seen that before. Much easier to remember — it’s going to be ss -peanut from now on!

This produces a lot of output, which I normally will filter through using grep and less. A very common, shorter version of these flags that I use are -ntpl . To just find processes listening on a port; ss -ntpl looks like this;

    sudo root@mindstorm: ss -ntpl
    State  Recv-Q Send-Q Local Address:Port  Peer Address:PortProcess
    LISTEN 0      64           0.0.0.0:46465      0.0.0.0:*
    LISTEN 0      64           0.0.0.0:2049       0.0.0.0:*
    LISTEN 0      4096         0.0.0.0:58947      0.0.0.0:*    users:(("rpc.statd",pid=2811,fd=10))
    LISTEN 0      5            0.0.0.0:35587      0.0.0.0:*    users:(("ecbd",pid=2767,fd=5))
    LISTEN 0      50           0.0.0.0:139        0.0.0.0:*    users:(("smbd",pid=2770,fd=54))

## Shell job control — fg / bg / jobs etc

I find myself flipping between a text editor and log files quite a lot. Using vim and less to read log files — I will often hit Ctrl+Z to background the current application so I can look at something else.

If I forget what is running, I can run jobs to see a list.

To get an application back, just fg <jobnumber> to bring it back to the foreground, or bg <jobnumber> to let it run in the background. This really saves you having to open up multiple SSH connections.

## git — version control all the things

I remember when I hated git, and loved subversion. I had taken one look at git and found it looked too complex. However, learning git is way more simple than it first seems, and now I use Git to store everything.

* [My server configuration is stored in Git](https://medium.com/james-reads-public-cloud-technology-blog/you-cant-do-gitops-until-you-git-add-16d11d40ff14)

* [My photos, media and disk images are all stored in Git](https://medium.com/james-reads-public-cloud-technology-blog/i-dont-trust-any-storage-how-my-for-git-annex-solved-my-backup-paranoia-cb7ddb0260ae) [annex]

* My source code is all stored in Git (mostly on [GitHub](http://github.com/jamesread/))

## ssh / mosh / tmux

ssh — I know it seems incredibly simple, but most people don’t know that you can do things like run one-liners like ssh user@host 'service httpd restart' .

tmux (and before it, I used screen) is the defacto standard for terminal multiplexing, and keeping things running after you logout.

[mosh](https://mosh.org/) is something that unfortunately not enough people know about. It basically provides SSH access over unreliable, slow, or laggy networks.

![[mosh](https://mosh.org/) rocks.](https://cdn-images-1.medium.com/max/2000/0*XuSLP1P0BeK_Lg84.png)*[mosh](https://mosh.org/) rocks.*

## Honourable mentions / power tools

Control sequences — Ctrl+C (normally “cancel”), Ctrl+D (end of input), Ctrl+L (redraw), Ctrl+S (xoff — stop printing output), Ctrl+Q (xon — continue printing output). I find myself using Ctrl+C, S and Q quite a bit on slow SSH connections!

nc — net cat, great for easily connecting to remote ports and network debugging.

openssl — mostly for investigating x509 certificates — openssl x509 -in foo.cert -text -noout — very useful for seeing when certs expire, or simila

strace — trace system calls, like fopen, flock, or similar being used by processes.

dd — Useful for directly writing to, and copying to storage. Fun fact, dd is for “**c**onverting and **c**opying” files, but it’s not called “cc”, because that was taken (cc is a C compiler).

iptables — I’m sorry, I remove firewalld from most of my servers and write rules directly with itpables. I’m not elitist — firewalld can be great, but it’s just a overly complex user interface on top of netfilter in my opinion. I know how to open a port using iptables rules directly ( iptables -A INPUT -p tcp --dport 1337 -s 1.2.3.4 -j ACCEPT etc) so I just find that more convenient for me.

dig — I have a lot of domains, and find myself interacting with DNS quite a bit. It’s a simple and powerful tool to quickly run DNS queries.
