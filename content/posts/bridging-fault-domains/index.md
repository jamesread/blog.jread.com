---
title: "Bridging fault domains"
date: 2023-11-06T09:24:00+01:00
draft: true
featured_image_caption: This is the first time I found out about .avif files. Pretty, and small.
featured_image_credit: Mohamed Thasneem
featured_image_url: https://unsplash.com/@thanni?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
tags:
  - cloud
  - architecture
---

A fault domain (or [failure domain](https://en.wikipedia.org/wiki/Failure_domain)) is essentially a set of resources, or components that share a common point of failure. One example of this is an Azure Availability Zone, or your own single Data Center. Typical points of failure for a fault domain are power (with no backup generator), or cooling, or a datacenter is served by a single network connection. The term "fault domain" could theoretically be applied to smaller areas of an application architecture, like a single network, or a rack of servers, but this article considers a fault domain more from a cloud architecture definition.

The public clouds encourage customers to design their application architecture to be aware of these fault domains ([Azure](https://learn.microsoft.com/en-gb/azure/reliability/availability-zones-overview?WT.mc_id=modinfra-11089-salean&tabs=azure-cli), [AWS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)). A highly available application in Fault Domain A (for example, Azure Availability Zone 1), should not depend on any components in Fault Domain B (for example, Azure Availability Zone 2). If you do depend on components across fault domains, this dependency is called a "bridge" - hence, you are bridging fault domains, and reducing the overall availability of the application down from two (or more) domains, down to a single domain.

In simple terms, think of is like building a bridge between two islands. If one island represents a fault domain, and the other island represents another fault domain, the bridge allows you to travel between them. At first this might seem incredibly convenient... but you're creating a mechanism for the fault to easily travel from one island to another, or even creating a dependency between the two islands, making them one.

Let's continue this example. If you put all your food supplies on island A, but live on island B, you might think, "that's no problem, I've got the bridge"... until you don't. A storm comes along, blasting that bridge away, and now you're stuck. It's no use having all the food on a single island - as it renders the second island useless.

Instead, if you'd have been planning ahead, you would have put supplies on BOTH islands, meaning that you could survive independently without the bridge, or until the bridge is repaired.

Also, let's say the bridge between the islands is storm proof, but the next natural disastair you face is a flash fire, that burns up your island in seconds. As you flee to your second island, you notice that same fire crossing over with you, burning the bridge as it goes, and eventually consumes both islands. If you didn't bridge your fault domains with an actual wooden bridge, you could have fled safely in your boat, and got away from the fire.

## Okay, now give me some real examples;

* **Datacenter A sends all it's backups only to Datacenter B**, but Datacenter B burns down shortly afterwards. You might have felt reassured that you were backing up to another **physical location**, but if those backups were only a single copy, you effectively just had one single fault domain.
* **Two sets of web application servers in different fault domains, but they both rely on a single database** - if that database goes down, you lose both fault domains. This happens surprisingly often.
* **A Kubernetes cluster, with all it's control plane in a single region**, and it's workers in others... see below...

## A case in point; Kubernetes

One of the things I most like about my job as a Solution Architect at Red Hat, is being able to speak to so many different teams at so many different companies. Naturally this exposes me to lots of different ideas and approaches to solving problems, particularly around Kubernetes deployments. Something that keeps coming up with groups that are new to Kubernetes, is the desire to do "stretch clusters", and it scares me every time. Stretching clusters can often be (but not always is), an example of bridging fault domains.

The Kubernetes architecture is fundamentally a client-server (which Kubernetes docs call "[hub and spoke](https://kubernetes.io/docs/concepts/architecture/control-plane-node-communication/)") architecture, with a "kubelet" agent running on each node, commands are dispatched to this agent from the apiserver process. The questions that come up when people start looking at these architectures, and thinking about how they scale-out, is if the control plane can exist across two different cloud regions.

An important note about terminology here, it is entirely normal, and absolutely recommended to deploy a kubernetes control plane across different availability zones within the cloud. Availability zones have physically independent cooling, power and networking. Meaning that if you are aiming for a highly available Kuberernetes deloyment, you could deploy a control plane node in zone A, B and C. When configured correctly, Kubernetes can continue to function when a control plane node goes down.

However, when you start to do things like deploy a control plane node in the London cloud region, and another in Amsterdam, and expect both of them to work - you're actively pushing against best practices recommendations of cloud providers and cloud architecture. While Amsterdam and London do have separate power, cooling, network, etc, your overall cluster availability is reduced to a *single* network connection between two regions, rather than *three* network connections if the cluster used the 3 independent availability zones within a single region.

## Summary

This blog post isn't about Kubernetes specifically, but hopefully it's a real world example of the perils of bridging fault domains when designing highly available systems.
