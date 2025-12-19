---
title: "Semantic Versions, Commits, and now Releases"
date: 2025-05-28T22:21:04+01:00
draft: false
tags:
  - code
featured_image_credit: "Bru-nO"
featured_image_url: "https://pixabay.com/photos/lamp-lightbulb-bulbs-light-3726722/"
description: ""
---

Nearly every technologist knows about semantic versioning (semver), it's familiar for developers and sysadmins alike. However, what's really cool is implementing semantic commits and semantic releasing! 

I only really started to become familiar with the concept of semantic commits a couple of years ago. When you're a hobbyiest writing lots of code, there isn't much motivation or need to write a commit message - because nobody is going to read it. Numerous times I've done `git commit -m "fix"`, or probably more often, just `git commit -m "."`. Of course that is bad practice, but it's just easy to do when you're the only person who will ever read it. 

When I started releaseing projects that people actually used, and started collaborating with other people, it became clear that writing good commit messages was important. I started to write more descriptive commit messages, but really tried to adopt semamantic commits as a way to make my commit messages more consistent and useful to others. Everyone knows what `feat:`, `build:` and `fix:` mean, and it makes it easier to read through the commit history.

Just recently, I've been trying to figure out why 1) not many people have been using other software I write beyond OliveTin, and 2) how to get around the frustrating manual release process. 

I cannot remember from where, but I stumbled upon the concept of semantic releasing. I'm very familiar with the concept of CI/CD of course, but I was making releases manually, on an arbitary timescale. The releases were "when I had enough merged PRs" or "when I had time to do it". This is not a good way to do things, and even though I had automated CI pipelines, I wasn't really doing the CD part of it. 

Anyway, semantic releasing is a way to automate the release process based on the contents of the commit messages. If you use semantic commits and push a "fix:", it will automatically create a patch release. If you push a "feat:" it will create a minor release, and if you push a "BREAKING CHANGE:" it will create a major release. This is really cool, and it means that I can automate the release process, and take the manual work out of it.

Ultimately what I hope this will bring is more people using my software, because pushing features and fixes will automatically create releases, and people will be able to see those changes quickly. It also means that I can focus on writing code, rather than worrying about the release process.

The implementation is really pretty simple, here's the "meaningful" part of the `.github/workflows/release.yml` file that I use in my projects (another benefit - I can copy and paste this into all my projects!):

```yaml
      - name: Login to ghcr
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.CONTAINER_TOKEN }}

      - name: Test build
        run: make -w service

      - name: Install goreleaser
        uses: goreleaser/goreleaser-action@v6
        with:
          install-only: true

      - name: release
        if: github.ref_type != 'tag'
        uses: cycjimmy/semantic-release-action@v4
        with:
          extra_plugins: |
            @semantic-release/commit-analyzer
            @semantic-release/exec
            @semantic-release/git

        env:
          GH_TOKEN: ${{ secrets.CONTAINER_TOKEN }}
          GITHUB_TOKEN: ${{ secrets.CONTAINER_TOKEN }}
```

And here is the corresponding `.releaserc.yaml` (not JSON because I prefer YAML!):


```yaml
---
branches:
  - main
plugins:
  - '@semantic-release/commit-analyzer'
  - '@semantic-release/git'
  - - "@semantic-release/exec"
    - publishCmd: |
        goreleaser release --clean

tagFormat: '${version}'
```

You can see from the example above that I use the `goreleaser` tool to build and release my Go projects, but you can use any tool you like. The key is that the semantic release process will look at the commit messages, determine the type of release to make, and then run the appropriate commands to create the release.

I went a bit nuts and have been implementing semantic releases in nearly all of my projects - including stuff that I've not released in years. If you'd like to check out some of the projects where I've implemented this, here's a list below (nearly all of them are Go projects, but some are in other languages):

* https://github.com/jamesread/japella
* https://github.com/jamesread/uncomplicated-alert-receiver
* https://github.com/jamesread/StencilBox
