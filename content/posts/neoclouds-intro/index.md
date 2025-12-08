---
title: "The Neoclouds are here - AI Specialised Cloud Providers"
date: 2025-12-08T16:13:11Z
draft: false
tags:
  - Cloud
  - AI
  - Azure
  - AWS
  - GPU
  - Neocloud
featured_image: ""
description: ""
---

A new class of cloud providers is already here, and they're called "neoclouds", but you'll be forgiven if this is the first time you're hearing about it. You see, unless you're in the AI space, these could have passed you by, that's because 'neocloud' refers a new class of cloud providers that are specialised in AI. A neocloud provider specifically focuses on the infrastructure services that are needed for AI, such as GPU-as-a-service (GPUaaS), or bare-metal-as-a-service (BMaaS), that are optimised for AI workloads.  

## Who are the neocloud providers?

Some of the well known neocloud providers that are already operating in 2025 include:

* [Lambda Labs](https://lambdalabs.com/) - One of the pioneers in the neocloud space, Lambda Labs offers GPU cloud services specifically designed for AI and machine learning workloads. They provide a range of GPU instances, including high-end GPUs like the NVIDIA A100 and H100, as well as bare-metal servers for more demanding workloads.
* [Paperspace](https://www.paperspace.com/) - Paperspace is another well-known neocloud provider that offers GPU cloud services for AI and machine learning. They provide a range of GPU instances, including NVIDIA GPUs, as well as a range of tools and services to help developers build and deploy AI applications.
* [Coreweave](https://www.coreweave.com/) - CoreWeave is a neocloud provider that focuses on providing GPU cloud services for AI, machine learning, and rendering workloads. They offer a range of GPU instances, including NVIDIA GPUs, as well as bare-metal servers and other infrastructure services.
* [RunPod](https://www.runpod.io/) - RunPod is a neocloud provider that offers GPU cloud services for AI and machine learning workloads. They provide a range of GPU instances, including NVIDIA GPUs, as well as a range of tools and services to help developers build and deploy AI applications.
* [Vast.ai](https://vast.ai/) - Vast.ai is a neocloud provider that offers GPU cloud services for AI and machine learning workloads. They provide a range of GPU instances, including NVIDIA GPUs, as well as a range of tools and services to help developers build and deploy AI applications.
* [Genesis Cloud](https://www.genesiscloud.com/) - Genesis Cloud is a neocloud provider that offers GPU cloud services for AI and machine learning workloads. They provide a range of GPU instances, including NVIDIA GPUs, as well as a range of tools and services to help developers build and deploy AI applications.
* [Cerebras Cloud](https://www.cerebras.net/cloud/) - Cerebras provides cloud services that leverage their specialised AI hardware, offering high-performance computing solutions tailored for large-scale AI workloads.

There are certainly lots of classical cloud providers that can offer these services too - like the Hyperscalers (Azure, AWS) and sovereign cloud providers (like OVHCloud, Scaleway, etc) - but neoclouds are different in that they are built specifically to support AI workloads. This means that they have a greater focus on GPUs, tooling and technology needed for running AI workloads.

## Why are neoclouds happening now?

I'll assume that you're well aware with the way that AI has exploded in popularity by 2025, but what you may not be aware of is the fierce competition by cloud providers to get enough GPUs to host all those AI workloads. The demand for GPUs is so high, that even the largest cloud providers are struggling to keep up. This has led to a situation where many AI startups and companies are finding it difficult to get access to the GPU resources they need, and this is where neoclouds come in. 

Something that took me a while to get my head around, is that the neocloud providers don't necessarily own their own datacenters and GPUs - although some do, but there are neoclouds which are partnering with the hyperscalers, and "reselling" those GPU resources. Their value proposition is that they are able to drive high utilisation of those GPU resources, by focusing solely on AI workloads, and by providing a range of services that are specifically designed to support AI workloads. High utilisation means more billable compute, and you should understand that any cloud provider who has invested in GPUs wants them driving at 100% utilisation as much as possible, because idle GPUs are lost revenue.

* **Global scarcity of high-end compute (GPUs)** - reports that the global demand for high-end GPUs is outstripping supply by a significant margin, leading to significant challenges for AI startups and enterprises looking to scale their AI workloads ([McKinsey](https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/the-evolution-of-neoclouds-and-their-next-moves?)).
* **Economic and market opportunity** - predicts that the neocloud market will grow to $250 billion by 2030 ([ABI Research](https://www.abiresearch.com/blog/neocloud-market-trends?hsLang=en&)).
* **Demand for inference at scale**: While model training gets a lot of attention now, by 2030, inference workloads — the day-to-day execution of AI models — are expected to account for ~80% of neocloud usage ([ABI Research](https://www.abiresearch.com/blog/neocloud-market-trends?hsLang=en&)).

## Challenges and What Neoclouds Need to Handle to Succeed

Neoclouds might be here now, but as with everything in the AI bubble, nobody is sure what will stay in a few years time. I've been doing some reading up, and I feel that there are several challenges that faced by the neocloud provider experience/ecosystem, from a consumer perspective:

* **Fragmented infrastructure and complexity:** Many neoclouds use a mix of hardware (different kinds of GPUs, accelerators, maybe even FPGAs/TPUs), which complicates moving between providers, and creates a locked in ecosystem. As pointed out in recent research, this demands “a fundamental rethink” of how clouds allocate and price resources — moving away from static VM-style allocations to more dynamic, flexible resource scheduling ([arxiv.org](https://arxiv.org/abs/2501.11185?)).
* **Scaling and capacity limitations:** Early neocloud providers have to invest heavily in hardware, power, data-centres or GPU leasing agreements. Building sustainable capacity while keeping costs predictable is nontrivial ([Bloomberg](https://www.bloomberg.com/news/newsletters/2025-08-18/neocloud-operators-depend-on-nvidia-chips-staying-expensive)). Also, many neoclouds need to be careful about overinvesting in a single generation of GPUs, as newer models are released frequently.
* **Competition from the hyperscalers adapting:** I think that the hyperscalers are likely to embrace those neocloud providers that rent GPU capacity, and keep those GPUs highly utilitized... to a point. In the long run, I don't think that the hyperscalers will sit idly by while neoclouds take market share. They have the resources to build out their own AI-optimised infrastructure, and they will likely do so to regain control over the AI cloud market. Neoclouds may lose advantage if hyperscalers manage to offer competitive GPU-based AI services at scale ([alpha-sense](https://www.alpha-sense.com/blog/trends/cloud-computing-market-trends/)).

## Conclusion: Neoclouds Are More Than a Fad — But Not a Guaranteed Win

Neoclouds represent an important evolution in how we think about cloud infrastructure. By focusing on specialised, GPU-optimised infrastructure for AI and HPC workloads, they open the door to efficient, scalable, and cost-effective AI adoption across industries. Over the next decade, I think that the most likely outcome is an AI bubble that bursts, and probably at least half of the neoclouds mentioned above will not be around in their current format. The hyperscalers will likely continue to seek to dominate the market - via buying power, influence, and by having a massive footprint in the general purpose cloud space. 

One of the most challenging aspects for these neo clouds is who can **enough bleeding edge GPU capacity for the cheapest price** - which also means not being held back by investments in older generation hardware that they cannot offload. The neoclouds that can succeed will be the ones that can navigate these challenges, and carve out a niche in the AI cloud ecosystem.

