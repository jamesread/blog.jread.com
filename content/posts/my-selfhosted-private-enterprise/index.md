---
title: "teratan.lan - My Self-Hosted private Enterprise"
date: 2025-11-26
tags:
  - architecture
  - self-hosting
featured_image_credit: Sebastian Ganso
featured_image_url: "https://pixabay.com/photos/ice-block-winter-frozen-lake-7665945/"
description: ""
---

One of my favourite topics to talk about with anyone is self hosting. Some people refer to home automation, some people call it homelabs - I have both, and many other systems, in a fairly vast environment where everything is self hosted. 

I truly believe that self hosting is the best way to really understand lots of aspects of technology, privacy, and how to efficiently build and secure systems. 

## "So, what do you self host?"

I've often wondered even howto refer to all this "stuff" I have - which is more than a collection of servers (at home, in cloud, in all different architectures). It's also more than a collection of services, which ranges from Home Assistant, to Apache clusters, Kubernetes clusters, and everything in between. Do I just give people a list my containers, for example? 

Well, let's take a quick peek into just *one of the servers*;

```bash
jamesread@shared-services-kubemaster: kubectl ns | wc -l
32

jamesread@shared-services-pets: podman ps -a | wc -l
24
```

That's **32 Kubernetes namespaces** on one cluster alone, and **24 podman containers**. I can dump that as a spreadsheet if you like, but if you don't know what that container name is, or, if you see "OliveTin" listed 3-4 times, then that's confusing, that is *not really a useful way to convey the information* to most people.

It's *literally my day job* to advise some of the most interesting companies in the world to make their next technology choices with Red Hat and Azure - in my role as a solutions architect. So, I decided to apply some of my "work brain" to the things I do outside of work and formally document my own personal list of self hosted stuff as a full enterprise architecture. Think in terms of high level systems and objectives, not in containers and VMs. So, without further ado, Welcome to teratan.lan - my Enterprise Architecture!

## Enterprise architecture - highest level

**teratan.lan** is the name I've given to my enterprise architecture. My enterprise is composed of **6 primary systems**, each with their own purpose, and each composed of multiple services (containers, VMs, serverless functions etc).

<style type = "text/css">
.enterprise {
    font-weight: 600;
}

.boundary {
    border: 1px dashed #000000;
    display: grid;
    gap: 1em;
    padding: .5em;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    border-radius: .5em;
    text-align: center;
}

.system {
    background-color: #dee3e7;
    color: black;
    padding: .5em;
    box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
    border: 1px solid #abb4b9;
    border-radius: .5em;
    text-align: center;
}

.system:hover {
    background-color: #c3c9ce;
    cursor: pointer;
}

.shared {
    background-color: beige;
    color: black;
    border: 0;
    border: 1px solid #abb4b9;
    border-radius: .5em;
    box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
}

.description {
    font-weight: normal;
    grid-column: 1 / -1;
}

.sizing {
    font-weight: normal;
    color: green;
}

.service-list {
    color: #555555;
    font-weight: normal;
    margin-top: .5em;
    line-height: 1.4em;
}

.wide {
    grid-column: 1 / -1;
}

h3 {
    font-family: sans-serif;
    margin-top: 0;
    margin-bottom: .2em;
}
</style>
<div class = "enterprise boundary">
    <div class = "system">
        <h3>Memories</h3>
        <div class = "description">Capture life, organise it, keep it safe.</div>
        <div class = "service-list">Camera Photos, Videos, CCTV.</div>
    </div>
    <div class = "system">
        <h3>Entertainment</h3>
        <div class = "description">Ingest & serve media.</div>
        <div class = "service-list">Music, Films, Lectures, Indexing, Search, Suggestions, Release Notifications.</div>
    </div>
    <div class = "system">
        <h3>Lab</h3>
        <div class = "description">Build, Test, Break, Learn, Grow.</div>
        <div class = "service-list">Source Control, Testing, Experimentation, 3D Printing, Reverse Engineering.</div>
    </div>
    <div class = "system">
        <h3>Insights</h3>
        <div class = "description">Ingest public data &amp; generate knowledge.</div>
        <div class = "service-list">Consume feeds of News, Finance, Social Media -> Data Warehouse & Analysis.</div>
    </div>
    <div class = "system">
        <h3>Knowledge</h3>
        <div class = "description">Reliable, indexed, external brain.</div>
        <div class = "service-list">Note Taking, Document Storage, Wikis, Reference Material.</div>
    </div>
    <div class = "system">
        <h3>Productivity</h3>
        <div class = "description">Everything that keeps my day flowing.</div>
        <div class = "service-list">Home Assistant, Personal Assistants, Calendars, To-Do, Planning Lists.</div>
    </div>
    <div class = "wide stack">
        <div class = "shared">
            <h3>Infrastructure</h3>
            <div class = "description">Compute, Network, Metrics, Logs, Monitoring, Backup, Security, Storage.</div>
            <div class = "service-list">Kubernetes, Podman, VMs, git-annex.</div>
        </div>
    </div>
</div>

When you start thinking of what you're hosting as not just a list of containers and VMs, and start thinking about WHY you're hosting them, it forces you to think about lists of systems (which compose multiple VMs and containers). 

## Adapting the Enterprise Architecture layers to Personal Self-Hosting
This highest level diagram shows the topmost **6 primary systems** that compose my self hosted environment, but a true enterprise architecture has many layers of detail below this - which I will document in future blog posts. If I take the principle of designing an enterprise architecture, and adapt those principles to a **personal self-hosted environment**, it would look something like this;

- **Personal Vision and Strategy** - what **I** want to achieve (eg: learn, build, create, share, automate etc)
- **Personal Capabilities** - what abilities do I want my digital life to have? (eg, control over memories, knowledge, entertainment etc) 
- **Personal value streams** - how do I deliver value to myself? (eg: learn something -> automate it -> free up time, or ideas -> prototypes -> projects -> share)
- **Personal Processes & workflows** - How work actually happens in my life (eg: media ingestion -> sharing with my family, turning physical letters into useful digital knowledge etc)
- **Personal Information & Data Architecture** - How data is structured, stored, and accessed (eg: git-annex for everything, super heavy preference for flat files, paranoia about backups)
- **Systems Architecture** - The actual systems that deliver the capabilities (eg: the 6 primary systems above, and their subsystems)
- **Technology Architecture** - The actual technology choices that deliver the systems (eg: Kubernetes, Podman, VMs, specific software choices etc)
- **Governance & Principles** - How I make decisions about self hosting, what to build, and what to avoid (eg: free software only, security first, durability etc)

The last one of those, **Principles**, is what I started with when putting the first systems into teratan.lan. So, let's start there.

## Self-Hosted Enterprise [Design] Principles

When designing teratan.lan, I applied a few key design principles to ensure that it meets my needs effectively:

- **Free Software**: I only use free and open-source software in whatever I do. This also means I build a lot of stuff myself.
- **Modularity**: Each system is designed to operate independently, allowing for easy updates and maintenance without affecting other systems.
- **Durability**: Data integrity and longevity are crucial, especially for systems like Memories and Knowledge. I am utterly paranoid about backups and redundancy.
    - **Flat data**: I barely trust SQL dumps, I prefer flat files and git-annex for everything.
    - **Versioned**: I am obsessed with storing everything in Git repository - not just for GitOps+Flux, but I aggressively use git-annex to store everything.
- **Security**: Given the sensitive nature of some of the data (like personal memories), security is a top priority. I am aiming for a zero-trust architecture in the future.

## What's next & Summary

Over time, I would like to document as many of these systems as possible - diving into the services I run, the architecture decisions I've made, and the lessons I've learned along the way. I've deliberately made the diagram above simple, and in HTML, so that I can link to future blog posts about each system and subsystem. 

I also have **teratan.net** - which is my public facing enterprise architecture. It's used for hosting public websites, blogs (like this one!), and other projects and services that I want to share with the world. It has some slightly different design principles to teratan.lan - such as the need for running extremely low cost, and being very highly available. I'll document that in another blog post sometime.

My roadmap for future systems, to complement the 6 primary systems is;

- **Simulation & Modelling** - I've been obsessed with the idea of simulating people, crowds, buildings, even cities, for a long while. I want to build a system that can do that effectively.
- **Instant Messaging & Fediverse** - I want control over my own communications, but I'm held back because it's non-trivial, and critical - if it's down, I can't communicate!

So, if *you* are someone who is interested in self hosting, (or home automation or homelabs, etc), then you should be careful if you tell me - because we'll have to geek out about it for a while!
