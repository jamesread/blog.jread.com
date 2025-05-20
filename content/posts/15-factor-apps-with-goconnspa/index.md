---
title: "Implementing 15 Factor Apps with GoConnSPA"
date: 2025-05-20T11:58:08+01:00
draft: false
tags:
  - code
  - "GoConnSPA"
  - projects
  - golang 
featured_image: ""
description: ""
---

This is just a quick article to describe how the GoConSPA stack implements the [15 Factor App](https://domenicoluciani.com/2021/10/30/15-factor-app.html) principles.

# 1. One Codebase, Ont Application

* **GitHub**: All code for the application is stored in a single repository.

# 2. API First

* **ConnectRPC**: The api is defined in protobuf, and exposed via ConnectRPC.

# 3. Dependencies

* **Go Modules**: All dependencies are managed via Go modules, and vendored in the repository.

# 4. Configuration

* **GitOps**: Configuration is stored in Git, allowing for version control and easy collaboration.
* ** Environment Variables**: Configuration is stored in environment variables, and loaded via `viper`.
* ** YAML Configuration**: Configuration is stored in YAML files, and loaded via `viper`.

# 5. Backing Services

* **Docker**: All backing services are run in Docker containers, and managed via `docker-compose`.

# 6. Build, Release, Run

* **GitHub Actions**: All builds are done via GitHub Actions, and released to a container registry.

# 7. Processes (Statelessness)

* **Stateless Services**: All services are stateless, and can be scaled horizontally.

# 8. Port Binding 

* **HTTP/2**: All services are exposed via HTTP/2, and can be accessed via a load balancer.

# 9. Concurrency

* **Docker**: All services are run in Docker containers - no PID files, daemons, or init systems.

# 10. Disposability

* **Docker**: All services are run in Docker containers, and can be started and stopped quickly.

# 11. Log (streamiing)

* **Docker**: All logs are written to stdout and stderr, and can be collected via a log collector.

# 12. Admin Processes

* **Docker**: All admin processes are run in Docker containers - which mirror the production environment.

# 13. APi First

* **ConnectRPC**: The api is defined in protobuf, and exposed via ConnectRPC.

# 14. Telemetry

* **Prometheus**: All services expose metrics in a standard format, and can be scraped by Prometheus.

# 15. Authentication

* **OAuth2**: All services use OAuth2 for authentication, and can be accessed via a token.


