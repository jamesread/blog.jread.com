---
title: "You can't do GitOps until you `git add`"
date: 2020-02-03
draft: false
medium: https://medium.com/james-reads-public-cloud-technology-blog/you-cant-do-gitops-until-you-git-add-16d11d40ff14
tags:
  - github
  - git
  - gitops
  - code
---

This article explains how I solved a couple of challenges of getting my initial environment and configs into Git — the first steps to GitOps.

I’ve been wanting to embrace GitOps for quite some time, but it’s always tricky to know where to start. Do I use Jenkins Jobs — I know Jenkins well? It’s a bit old school though, maybe I should be using Ansible Tower. I’ve heard things about ArgoCD, and lots of others. The truth is, I can’t do anything until I actually have my environment and configuration stored in Git.

**By the end of this article,** I hope that you’ll pick up a few of my tips to get started.

## What will I get by using Git for server configs?

1. **All changes are logged & tracked.** Who made that change? When? etc.

1. **All changes are versioned. **Oops, the most recent change broke something. Easy to roll back.

1. **Free backup. **Just clone the repository to multiple locations.

1. **Easy to re-use configs. **Just installed a new server, and want to use 90% of a common apache configuration. Just clone the repo and copy the file.

## Create a Git repository — private, but accessible

My intention is to store all my configuration files for dnsmasq, httpd, and so on, all in Git. Configuration is sensitive, including usernames and passwords, and so obviously a GitHub public repository isn’t the best idea. If you’re willing to pay for a private repository, go for it. I opted to create a repository on a dedicated server I have on the public internet, so that all other servers can get it.

    cd /opt/ 
    git init --bare ServerConfiguration.git

## **DNS-based directory names — easy to browse**

I want to make it easy to sort and structure my configuration. I decided to **use server DNS names for the directories**. I on my of home servers, I did;

    git clone ssh://root@example.com/opt/ServerConfiguration.git
    cd ServerConfiguration.git
    mkdir -p example.com/server1/{httpd,dnsqmasq}

Why store it in /opt? I generally use this directory for files stored on a server that are specific to it. It has the advantage of most often being the same filesystem as / — making it easy to hardlink files. Onto the next point;

## Hardlinking service configs into your Git repo

You could have a separate Git repository per server, or even per service, but this will very quickly become unmanageable. Rather, this “ServerConfiguration” repository for your whole environment can easily store configuration for lots of different services.

How then, do we get Apache, dnsmasq, and all those other services to use it? Hardlinks is the way to go. The syntax is ln <existing file> <new link>

    ln /opt/ServerConfiguration/example.com/server1/httpd.conf /etc/httpd/conf/httpd.conf

Why not symlinks, you say? Well, I started off using symlinks, but I found that SELinux policies for things like dnsmasq really complained about using a configuration file outside of an expected directory. It seems that SELinux allows two separate hardlinks to have two separate SELinux contexts.

## Symlinking to common service configuration

I’ve got a bunch of servers that all share the same configuration files. A common directory with relative symlinks works well here.

    cd /opt/ServerConfiguration 
    mkdir -p example.com/common
    cp /etc/httpd/conf/httpd.conf common/httpd.conf
    ln -s "../common/httpd.conf" server1/httpd.conf
    ln -s "../common/httpd.conf" server2/httpd.conf
    ...

## Get Committed

Once you’ve linked your configuration files in, don’t forget to git add and git commit your progress.

    cd /opt/ServerConfiguration
    git add -A
    git commit 'Made some changes...'
    git push

Get into a habbit of editing configs, and adding then,committing changes. Push those changes back to your origin server periodically and pull/update when needed. I find it’s infectious, and when I find a server not under Git config version control, I quickly go around adding it’s necessary configs into the repository.

This will be the foundation for some more sophisticated GitOps later down the line. But for now, this process already has many benefits.

If you’re looking for a tutorial to get started with Git, I highly recommend the [Git Book](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository).

## Where can I go from here?!

1. Store production, test, and configuration in different branches, and merge between them.

1. Do code reviews when people submit — who needs a Change Advisory Board?!

1. Explore the various options to automatically apply that config on checkin — Jenkins Jobs, Ansible Tower, ArgoCD, etc.

Photo by [Yancy Min](https://unsplash.com/@yancymin?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/git?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
