---
title: "How to properly archive a project"
date: 2021-07-08
draft: false
tags:
  - code
  - misc
featured_image: featured.jpg 
featured_image_credit: Masterfile.com
---

The TURTLES model.

How many times have you seen projects abandoned on GitHub, or internal Wikis, with no explanation, no “next steps”, no follow-up or notes? How many hundreds of hours were lost to that project, and what was learned?

This article proposes a model (“TURTLES”), or more simply, a checklist, of how to properly archive a project.

## Is now the right time to archive this project?

* **T — Technologists:** Do enough people contribute to maintaining this project? Developers, Architects, Security, Operations?

* **U — Users:** Does this project have enough active users?

* **R — Requirements:** Is this project still doing what we set out for it to do?

* **T — Technology:** Are there any unsustainable technologies behind this project?

* **L — Learning:** Is anything being learned by maintaining this project? (See my article [about Odyssey projects](https://medium.com/james-reads-public-cloud-technology-blog/odyssey-projects-47138a44acda) — sometimes “just coding to learn” is enough of a reason to keep a project going).

* **E — Ecosystem:** Is there an alternative to writing this project?

* **S — Salvage:** Can anything useful be salvaged from this project?

Models are easier to remember when there is an acronym — hence, “TURTLES”. :-)

The suggestions below assume that you **document **t**he answers to these questions **— in the project README, on your wiki, or somewhere else where it’s easily seen by all.

## Archive checklist —Technologists & Users

NB: I deliberately chose the word “technologist” because I wanted to include developers, architects, security, operations, and many other roles.

* **Why did this project fail to keep developers interest?** How would that be changed for next time? Did big parts of the code rely on just one developer who understood them?

* **Why did this project fail to keep its users, and grow users?**

* **What was the cost of maintaining this project?** Could 5 full-time developers not keep up with it? Was it costing huge amounts of money to keep all the test servers running?

* **Who were the users of this project?** Anyone significant (any references?), and how did this project attract users?

* **How could have the project grown, what stopped it? **Did it need more marketing, or more budget, did it need to be shown more frequently at conferences?

## Archive checklist — Requirements

* **Which of the original requirements were met?** Make a list. Of those which were unmet, why is that?

* **Did any scope creep happen? If so, why?** Bad expectation / issue management? Bad initial scoping? Too little focus on the MVP?

* **What future requirements were planned, that could not be met with this project? **Did the project have to work on Azure, or AWS, and it was only compatible with VMware environments?

## Archive checklist — Technology

* **What technical decisions about architecture are not sustainable?** Is this project a monolith in the modern world of microservices? Is the architecture hard to scale horizontally?

* **Would you choose a different language or core dependencies differently next time?** Would you choose log4j for all logging instead of logback? Golang instead of Java — why?

* **Are all the dependencies frozen?** If we want to re-build this project 5-years, or 10 years from now, relying on “latest” or “3.x+” is probably a bad idea. Maybe adjust your package.json, pom.xml or similar to stick dependencies to the version that exists now.

* **Are any of the technologies outdated or dead?** Is this project using PHP and Smarty with HTML4, in a world of reactive, progressive web apps? Does it rely on jQuery, when native HTML5 will do?

## Archive checklist — Learning

Side note: I feel this is the **absolutely most important thing** about arching a project.

* **What was learned by the developers?**

* **What was learned by operations?**

* **What was learned by project managers?**

* **What was learned by the budget owners?**

* **What was learned from the line of business, or business owner?**

If you do anything from this article, document what was learned. Have a wash-up meeting, make sure people acknowledge the learning points, and have them to hand for the future.

## Archive checklist — Ecosystem

* **Did a different project or technology come along that was more successful than this project?** That’s OK, but why did it “win”? Did it do the same thing at reduced cost, did it do 90% of what we wanted to do anyway?

* **Was this project duplicating something else?** Why are you leaving this project instead of that one? Are you joining forces?

* **Does a better Open-Source alternative exist?** Great, but is that project 50% overlap, 100% overlap, or somewhere in-between? What assumptions have been made?

## Archive Checklist — Salvage

* **Can any of the core parts of the code be moved into a smaller, reusable library?** Even things like Utility classes, or extensions you built to a configmap reader, could be usable elsewhere.

* **Is it possible, or advisable, that this project be forked?** It could be continued by a different team?

* **Was there a successful non-technical thing that is salvageable?** For example, was there a good format for weekly reports, or project management used with this project?

## Next steps — help future archaeologists

* **TELL PEOPLE IT’S BEEN ARCHIVED — and summarize why.** Don’t just abandon the repository (basically the whole point of this article!). If you can include all the documented reasons publicly, great — but at least include a summary of why.

* **Place notices on your project public website.** Explain this for non-technical users.

* **Place persistent notices in chat rooms and mailing lists.** For example, in a chat channel, set the channel topic.

* **Link to any ongoing or follow-up work.** If there was a project that is the successor to this project — tell people!

* **Place warnings for those coming after you** — does this project cause or create problems, does its design, or its approach have false, or poor assumptions now-a-days?

* **Does this project have a readme, explaining what it does?** Help the casual browser, or future you, understand what this project did.

* **Does this project have instructions for developers**? Explain what build tools, libraries, or infrastructure are needed to build the project.

* **Is the supported platform documented?** Was it built only with Windows 98 support, or only compiles “properly” with the Borland C compiler?

## Summary

Don’t just leave that Git repository to rot. Archive the project using the checklist above to help yourself, help others, and help those that come after you.

I’ll be honest, I have rarely ever **archived** **my projects properly**, until now. I’m going to be using this going forward for myself, and I hope you will consider using the model to archive your projects properly too.
