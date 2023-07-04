---
title: "GitHub may replace DockerHub"
date: 2021-12-23
draft: false
---

# GitHub may replace DockerHub

It’s been interesting to witness the meteoric rise of “Docker” over the years, and it is undoubted that the technology that was pioneered and popularized by Docker (more correctly called “Linux Containers”), is here to stay for the long run. The rise of the technology was partially due to the ease of publishing containers, enabled by free DockerHub service. However, in this article, I propose that DockerHub as a single repository of container images is becoming less and less important than it once was, and in it’s place, GitHub is a strong contender to take over as the 1 repository for containers — as it has its sights on being everything a developer needs.

![Photo by [Teng Yuhong](https://unsplash.com/@live_for_photo?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/shipping-container?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)](https://cdn-images-1.medium.com/max/13440/1*8v3_NywOdo3-dP2C1dGMFA.jpeg)*Photo by [Teng Yuhong](https://unsplash.com/@live_for_photo?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/shipping-container?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)*

DockerHub served as the only repository for container images for a little while, but quickly, additional container registries, like quay.io, started to show up. In itself, this would not have been a threat to the popularity of DockerHub. Generally, people like to go to just one place to get their software — that’s why people like app stores. However, when you’re using Linux containers, it’s just frictionless to different repositories. No setup is required — the only difference would be docker pull quay.io/fedora vs docker pull docker.io/fedora. If it took effort to start using quay.io, or others, then people wouldn’t bother using them — but it’s no effort, no hardship. If the container image I want is in the quay.io repository, I just copy that “pull command” instead.

DockerHub’s web interface doesn’t keep me wanting to use it, either. It’s not bad, really, but it’s just not really necessary after I’ve found the container image I want, I have no reason to interact with the web interface any more. The same is true of most basic container registries — they’re just a “folder of stuff”, most don’t add extra value. Quay.io has some really nice visibility into the security of an image, which is nice to know, but I don’t go looking for it after I’ve found the image I want.

Docker, the company, has tried to make DockerHub more useful over the years. There has been the little “Official image” badge, and some other minor cosmetic improvements.

One huge improvement to the usefulness of DockerHub was automated builds. That was a killer feature… Until that feature was killed for non-paying users.

I used the automated builds feature quite a bit — why not? Free CI/CD tools? Yes, please! However, when I was notified that this feature was going away, I didn’t care. I can just move to one of the many other repositories that offer this feature, or build somewhere else. DockerHub had nothing that was “sticky” — that kept me on the service.

I cannot imagine the cost of resources that needed to go into maintaining DockerHub —serving billions of pulls, and probably millions of images. That’s a lot of storage and bandwidth, that must have been expensive. I totally sympathize that as a company paying for this, that they needed to recoup costs — and that’s why subscriptions, and other paid services popped up, no doubt.

Parallel to Docker’s growth, has been GitHub, with an even more impressive rate of adoption by it’s users.

GitHub has become the defacto standard for any Open Source project, and developers, on the whole, seem to like using it. The moment you irritate or annoy developers though, they’ll stop using your tools, and your stuff. I think the team behind GitHub knows this pretty well, and so they seem to be pretty conservative about changing things. However, quietly in the background, it’s been gaining impressive functionality for automated builds, via GitHub actions. It’s been improving the issues, documentation, and site hosting functionality. And most importantly for this article — it’s gained support for “packages”.

Back in the days of SourceForce, it was incredibly easy to host binary packages, and downloads. This is one of the few things that SourceForce actually did well. Over time, though, it was eventually eaten alive by not focussing on developer experience. However, compared to GitHub, it did that one thing better — GitHub has always been pretty poor at hosting binary packages that are easy for users to download.

We’ve seen the Tags functionality be improved, and now there are “Releases” on GitHub. This can still feel a little hidden in the user interface, unfortunately, but I would suspect, in time, that we’ll start to see this usability improve for non-technical users browsing GitHub.

Today, GitHub packages already support containers, but few projects host their container images there. There is, however, support for Python packages, Ruby packages, and more.

Ahead of DockerHub’s issues with monetization, GitHub packages does have several payment tiers. However, importantly, to entice users in, it does have a free tier.

I think that GitHub’s user interface will continue to improve for end users, making it more accessible for container images, and downloads of other “binary” packages too.

The community owes a lot to Docker — the company, the technology, and to DockerHub too, so in no way am I sneering, or making fun of any parts of Docker. Of course this article is a prediction, that may well not come true. If that’s the case in a few years to come, I’ll hold up my hands and say I was wrong! Nevertheless, I think we’ll start to see more container images on GitHub going forward, and the gradual decline of DockerHub.
