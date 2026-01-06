---
title: "Nginx's map directive allows for cleaner config"
date: 2025-11-20T11:02:08Z
draft: false
tags:
  - code
  - nginx
  - haproxy
featured_image_credit: "heladodementa"
featured_image_url: "https://pixabay.com/photos/technology-servers-server-1587673/"
description: ""
---

I didn't start with Nginx, but it's become my standard for open source load balancing now-a-days. I started with HAProxy - I remember first hearing about it in my first job, in 2008, when our CTO at the time was raving about it - "HAProxy rocks", he would say. I didn't get a chance to use it until several years later. It was when I first started load balancing services properly - somewhat of an improvement than having many services listen publicly on various ports. 

At the same time, I've been using good old trust Apache HTTPD since the late 90s. I remember that it took me ages and ages to configure it originally, but I built up so much muscle memory to set it up over the years. 

Nowadays, I don't hear about my beloved HAProxy and HTTPD anymore, and it seems like the world has moved on to Nginx for load balancing, serving static web content AND hosting good old PHP! It wasn't love at first sight, however. My first ever experience of Nginx was very horrible, in about 2019, when I was first introduced to an early version of [lancache](https://github.com/lancachenet/monolithic). The configuration syntax really threw me - I knew nothing like it, and it was very difficult to understand.

However, over the years, it's clear that Nginx dominated the Kubernetes space as an ingress controller, and it's configuration syntax really is lightweight and easy to understand. 

Anyway, this blog post is about a server that I wanted to migrate, from an old HAProxy instance, with sprawling repetitive config, to Nginx which I standardised on many years ago. 

In particular, the "map" directive in in Nginx config is really powerful, and allows you to do a lot with very little code.

Let's look at a comparison of before - with HAProxy, and after - with Nginx.

**Original HAProxy config**:

```php
frontend https
	bind *:443 ssl crt /etc/letsencrypt/live/demo.jread.com/combined.pem

    mode http
    option httplog
    redirect scheme https code 301 if !{ ssl_fc }

	use_backend spooncheck if { hdr(host) -i spooncheck.demo.jread.com }
	use_backend japella if { hdr(host) -i japella.demo.jread.com }
	use_backend stencilbox if { hdr(host) -i stencilbox.demo.jread.com }
	use_backend uar if { hdr(host) -i uar.demo.jread.com }
	use_backend faridoon if { hdr(host) -i faridoon.demo.jread.com }
	use_backend olivetin if { hdr(host) -i olivetin.demo.jread.com }
    ... many more lines ...

backend spooncheck
    mode http
    option httplog
    server spooncheck 127.0.0.1:8080 check

backend japella
    mode http
    option httplog
    server japella 127.0.1:8081 check

backend stencilbox
    mode http
    option httplog
    server stencilbox 127.0.1:8082 check


... many more lines ...
```

This configuration is fine, it works, but it's very verbose and repetitive. There's probably 12+ services simply running on different ports and this creates a lot of duplicate config.

However, using the `map` directive, we can simplify that massively in Nginx. Compare the same configuration from HAProxy, ported to Nginx:

**Nginx config using `map` directive**:

```nginx
map $host $backend {
	default								127.0.0.1:8080;
	stencilbox.demo.jread.com			127.0.0.1:8080;
	cookingtimer.demo.jread.com			127.0.0.1:8086;
	faridoon.demo.jread.com				127.0.0.1:8083;
	japella.demo.jread.com				127.0.0.1:8082;
	olivetin.demo.jread.com				127.0.0.1:1337;
    ... many more lines ...
}

server {
    server_name demo.jread.com;              # Define domain names
    root /var/www/demo.jread.com/;           # Set the document root
    index index.html index.htm;              # Specify default index files

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/demo.jread.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/demo.jread.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

	location / {
		proxy_pass http://$backend;
	}
}
```

Nice! This configuration is way more concise and is easier to understand. Nginx's `map` directive is really powerful, and allows you to do a lot with very little code.
