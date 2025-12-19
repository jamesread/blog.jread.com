---
title: "Prometheus: My Life in a Time Series Database"
date: 2024-08-19T23:24:16+01:00
draft: false
tags:
  - prometheus
  - homeops
  - monitoring
featured_image_url: "https://pixabay.com/photos/cardiac-pulse-time-series-statistics-4240338/"
featured_image_credit: "romnyyepez"
---

I aggressively use Prometheus in my day-to-day life, not just for regular technical and application metrics, but for everything I can get an exporter for.

I have a Prometheus exporter for my Gmail inbox (personal and work), for my Google calendar (mostly work), all my websites I've written export prometheus metrics, I monitor my servers CPU and Memory usage with Prometheus metrics, but also their Hard Drive SMART status. I even have a Prometheus exporter for my fledgling weight loss program. Domain expiry, GitHub stars, virtual machine status, even databases and the watch status of my media library!

Why, you might ask? Prometheus is an elegant metrics system. You can write a new exporter in any language that can expose a HTTP endpoint, and then Prometheus can scrape it. I've turned Python scripts into Prometheus exporters, and written Go programs that expose Prometheus metrics as well. Once you have the data in Prometheus, you can query it with PromQL, and graph it with Grafana. It's a powerful system that can be used for anything you can think of.

Once you have written a few testing queries for things you are interested in, you'll find that Prometheus comes alive when it's combined with Alertmanager. I've used this to turn all those noise of metrics into a fine tuned alerting system that can tell me when something needs attention.

