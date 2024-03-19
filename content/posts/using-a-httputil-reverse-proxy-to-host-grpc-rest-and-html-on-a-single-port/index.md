---
title: Use a httputil reverse proxy to host grpc, rest and HTML on a single port
date: 2021-06-02
tags:
  - code
  - golang
---
This helps you use Go to power the next generation of APIs+PWAs.

<!--
# ![Photo by [**Negative Space](https://www.pexels.com/@negativespace?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)** from [**Pexels](https://www.pexels.com/photo/marketing-office-working-business-33999/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)**](https://cdn-images-1.medium.com/max/10000/1*lrNjClAfT1qOSUdLLGXafQ.jpeg)*Photo by [**Negative Space](https://www.pexels.com/@negativespace?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)** from [**Pexels](https://www.pexels.com/photo/marketing-office-working-business-33999/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)***
!-->

**Prerequisites;** This article assumes you know what protobuf and gRPC are, and have set up the grpc-gateway for REST already for your app.

## The context

gRPC has become the default standard for modern Cloud Native RPC in Go. And gRPC is fine for backend service-to-service communication that can speak gRPC. To support older services, and the web, REST still reigns supreme.

Thanks to [grpc-gateway](https://github.com/grpc-ecosystem/grpc-gateway), it’s possible to quickly add a REST support on top of gRPC fairly quickly… although it requires a bit of messing around with annotations and similar in your .proto file.

However, if you then want to host web content (maybe using Go’s http.FileServer), you have to host on another port. You might think that’s because gRPC is HTTP2, and your static web content is HTTP1, but that’s not it — the gRPC REST gateway doesn’t need HTTP2. In my experimenting, I could not find a way to easily combine the generated REST gateway with additional handlers on the same server for hosting static web content.

## The problems

If you look at your generated gRPC gateway code, you’ll see the way the HTTP handlers are created and added to a grpc-gateway/v2/runtime Mux (multiplexer). Below is an example of this generated code;

    func RegisterOliveTinApiHandlerServer(ctx context.Context, mux *runtime.ServeMux, server OliveTinApiServer) error { 
                                                                                    
         mux.Handle("GET", pattern_OliveTinApi_GetButtons_0, func(w http.ResponseWriter, req *http.Request, pathParams map[string]string 
         ctx, cancel := context.WithCancel(req.Context())                         

         ... 

The generated code is a bit of an eyesore to read. But the handlers are generated here, which means you have little control over adding them to an existing HTTP server.

I’ve not found any way to customize the go generator to add get greater control of the handlers. However, I don’t really want to manage them manually — that is why I am using a code generator in the first place.

So while you can easily host the gRPC REST proxy on one port, and your web content on the other, you then have to deal with the following *3 problems;*

1. The headache and hassle of CORS — because your API and web content have different origins.

1. Extra hassle when hosting behind external reverse proxies — needing to configure “external addresses” and so-on, rather than just relying on relative paths.

1. Extra open ports in firewalls, containers, etc. This is a pain for ops people who just want to run your app with minimal open ports.

## The solution —a (embedded, micro) reverse proxy

When I realized I could not easily modify the generated grpc-gateway REST code, I was left with two webservers (grpc-gateway REST and the web content server) on two separate public ports. Hmm, gross. How can I fix that?

Knowing that I could not find a solution in the generated code, I thought about infrastructure. In systems engineering we solve this problem of multiple endpoints all the time using reverse proxies like haproxy, traefik, nginx, or similar. I could add a small haproxy to my otherwise pristine Linux container, but I’m already running haproxy on the frontend before traffic hits this service, and then I’ve got external dependencies, config, etc. Nah, that’s messy.

A quick bit of Googling — and of course, Go includes a load balancer/reverse proxy in the standard libraries. Just import net/http/httpuitland then httpUtil.newSingleHostReverseProxy(). Dammit Go, that’s awesome.

Using my app [OliveTin](http://olivetin.app) as an example, I could now do the following architecture;

![](https://cdn-images-1.medium.com/max/2000/0*CujnvMet4r0j_vv9.png)

One port to rule them all, one port to bind them.

Anyway, lets look at the actual code;

```golang
package examples

// Blog post: https://medium.com/p/9d3f629762b7
// This is an extract of code I wrote for http://OliveTin.app , showing how a micro
// load balancer / reverse proxy can be used to serve gRPC REST Gateway and static
// web content on a single port. 

import (                                                                           
    config "github.com/jamesread/OliveTin/internal/config"                         
    log "github.com/sirupsen/logrus"                                               
    "net/http"                                                                     
    "net/http/httputil"                                                            
    "net/url"                                                                      
) 

// StartSingleHTTPFrontend will create a reverse proxy that proxies the API        
// and webui internally.                                                           
func StartSingleHTTPFrontend(cfg *config.Config) {                                                                                                                   
    apiURL, _ := url.Parse("http://" + cfg.ListenAddressRestActions)               
    apiProxy := httputil.NewSingleHostReverseProxy(apiURL)                         
                                                                                   
    webuiURL, _ := url.Parse("http://" + cfg.ListenAddressWebUI)                   
    webuiProxy := httputil.NewSingleHostReverseProxy(webuiURL)                     
                                                                                   
    mux := http.NewServeMux()                                                      
                                                                                   
    mux.HandleFunc("/api/", func(w http.ResponseWriter, r *http.Request) {         
        log.Debugf("api req: %v", r.URL)                                           
        apiProxy.ServeHTTP(w, r)                                                   
    })                                                                             
                                                                                   
    mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {             
        log.Debugf("ui req: %v", r.URL)                                            
        webuiProxy.ServeHTTP(w, r)                                                 
    })                                                                             
                                                                                   
    srv := &http.Server{                                                           
        Addr:    cfg.ListenAddressSingleHTTPFrontend,                              
        Handler: mux,                                                              
    }                                                                              
                                                                                   
    log.Fatal(srv.ListenAndServe())                                                
}          
```

I hope that the example above provides enough context to explain the approach here. Simply, we listen on another new port (cfg.ListenAddressSingleHTTPFrontned), and use httputil ‘s reverse proxy clients to connect back to the other webservers running on cfg.ListenAddressRestActions and cfg.ListenAddressWebUI respectively.

Both the REST and WebUI ports in my app default to running on localhost — meaning the only public port is this built-in reverse proxy. This makes life a lot easier for people setting up and running the app, and makes my life as a developer easier too!

**Style note:** I hate the term “reverse proxy” — it’s so sloppy. “Load balancer” is so much more precise. However, many people use the term “reverse proxy” — so I opted for the more popular choice.
