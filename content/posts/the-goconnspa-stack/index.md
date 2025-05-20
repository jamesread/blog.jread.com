---
title: "The GoConnSPA Stack"
date: 2025-05-20T10:52:02+01:00
draft: false
tags:
  - code
  - projects
  - golang
featured_image: ""
description: ""
---

I'm eager to write about a technology stack that I've stumbled into, which I believe is the nicest one I've ever worked with. The stack is called **GoConnSPA**, and it consists of the following *technologies* and *tools*;

## Technologies

* **Go**: The Go programming language, which is known for its simplicity and efficiency.
* **Conn**ectRPC: A gRPC framework for Go that simplifies the process of building and consuming gRPC services.
* **SPA** (+CSR): Single Page Application with client side rendering - not reliant on the server.

## Tools

* **Air**: A live reloading tool for Go applications, which automatically reloads the application when code changes are detected.
* **Vite**: A build tool that provides a fast development environment and optimizes the build process for production.
* **Goreleaser**: A tool for building and releasing Go applications, making it easy to create binaries and publish them to various platforms.
* **precommit**: A framework for managing and maintaining multi-language pre-commit hooks, ensuring code quality and consistency.
 * **conventional-pre-commit**: A pre-commit hook that enforces conventional commit messages, helping to maintain a clean and understandable commit history.
* **GitHub Actions**: A CI/CD tool that allows you to automate your software development workflows directly in your GitHub repository.
 * **goreleaser-action**: A GitHub Action that integrates with Goreleaser, automating the process of building and releasing Go applications.
 * **semantic-release-action**: A GitHub Action that automates the release process based on semantic versioning, ensuring that releases are consistent and predictable.
* **Docker:** Just release containers

## Misc

### Properties

* **Expose Prometheus Metrics**: Making monitoring and observability easier by exposing metrics in a standard format.
* **GitOps Configuration**: Configuration is stored in Git, allowing for version control and easy collaboration, not via an admin interface.
 * **Read-Only YAML Configuration**: Easy for humans to write, and apps to decode. Easy fit for GitOps.

I'm just throwing this blog post out there to get it started, and because otherwise I'll never find the time to finish the perfect blog post. However, I've ported the majority of projects I maintain to use this stack now. 

The list of projects where I've used this stack can be found here; https://jread.com/projects/ .
