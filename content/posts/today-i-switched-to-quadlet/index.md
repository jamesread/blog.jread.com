---
title: "Today I switched to Quadlet to start Linux containers"
date: 2024-09-01T21:08:02+01:00
tags:
  - today-i-switched
  - containers
  - linux
  - homeops
---

This post is written simply for myself to mark the date when I fully decided to ditch Ansible's `containers.podman.podman_containers`, and Podman's nasty port of `docker-compose`, in favour of Quadlet. Hopefully this page can serve as a useful reference for others considering the same move.

## Problems with `containers.podman.podman_containers`

Ansible is great, but it's a pain if you ssh on to a server, to find a container is down. You then have to jump on to another server to run the playbook to start the container.

## Problems with `docker-compose`

Technically I use the port of `docker-compose` - `podman-compose`, but it frequently exits with Python stacktraces, and I've had to resort to quite a bit of "up, down, up, down", to get it to start containers.

## Problems I had with `podman generate systemd`

This solution worked really nicely for me, with one little issue - the conmon.pid file was not being included in the service file, meaning that starting/stopping the container reliably was a bit of a pain, especially after reboots. I found myself manually adding the `PIDFILE=...` line to the service file, which was cumbersome.

## Problems solved by Quadlet

* `systemctl enable` to start containers on boot.
* Standard `systemctl` commands to start, stop, restart and check the status of containers.
* Free `journalctl` integration.
* Super easy portability of container configuration between servers, just copy the `.container` file

```ini
[Unit]
Description=UAR
After=local-fs.target

[Container]
Image=ghcr.io/jamesread/uncomplicated-alert-receiver:latest
PublishPort=6666:8080
ContainerName=uar
Environment=ALERTMANAGER_HOST="http://am.webapps.teratan.lan"


[Install]
WantedBy=multi-user.target
```

## Really good quadlet blog posts that helped me

* https://www.redhat.com/sysadmin/quadlet-podman
* https://fale.io/blog/2023/05/17/manage-podman-containers-with-systemd-and-quadlet
* https://blog.while-true-do.io/podman-quadlets/
