---
title: Generate pretty HTML from YAML with Gomplate
date: 2024-07-02
tags:
  - code
featured_image_credit: "McArt"
featured_image_url: "https://pixabay.com/photos/snow-mountain-volcano-heaven-3294295/"
---

Sometimes you need to write a HTML webpage that is based on some sort of data file, like YAML files. Rather than having a server-side script generate the HTML, you can generate the HTML page statically, making it easier to host and cache.

I thought about writing a tool myself to do this, but thankfully, I found 
[Gomplate](https://github.com/hairyhenderson/gomplate). It is a powerful Go-based template renderer that allows you to generate dynamic content from various data sources, including YAML files. With Gomplate, you can easily transform your YAML data into HTML pages, making it a great tool for generating pretty HTML from YAML. 

Gomplate supports various template syntaxes like Go templates, Jinja2, and Handlebars. It offers functions and filters to manipulate and transform data within templates.

To get started with Gomplate, you'll need to install it on your system. You can find installation instructions for various platforms in the [official Gomplate documentation](https://docs.gomplate.ca/). Once installed, you can use the `gomplate` command-line tool to render templates.

To generate HTML from a YAML file using Gomplate, you'll first need to create a template file. This template file will define the structure and layout of your HTML page, as well as any dynamic content that should be populated from the YAML data. You can use Gomplate's template syntax to access and display the data from the YAML file within the HTML template.

I used this to generate a simple self-hosted sidebar page, so I could maintain a list of links in YAMl, and then use `make` to build the resulting HTML page. Here's the HTML template I used; 

sidebar.template.html
```html
<!DOCTYPE html>

<html>
<head>
  <title>{{ .title }}</title>
  <!-- style sheet, etc !-->
</head>
<body>

  <h1>{{ .title }}</h1>

  <ul>
  {{ range datasource "links" }}
  <li>
    <img src = "dashboard-icons/svg/{{ .icon }}" />
    <a href = "{{ .url }}">{{ .title }} </a>
  </li>
  {{ end }}
  </ul>
</body>
</html>
```

Here's an example YAML file with a list of links, each containing a title, icon, and URL property:

links.yaml
```yaml
links:
  - title: Link 1
    icon: icon1.svg
    url: https://example.com/link1
  - title: Link 2
    icon: icon2.svg
    url: https://example.com/link2
  - title: Link 3
    icon: icon3.svg
    url: https://example.com/link3
```

This makes it easy to add, change or remove links without having to write all the markup by hand, or worry about making the markup consistent. This can then go on a very simple webserver without any need to have server-side scripting language for something so simple. 

To make it easy to regenerate the HTML without having to type the Gomplate command each time, simply add a makefile;

```make
default:
  gomplate -d links=links.html -f sidebar.template.html > sidebar.output.html
```

Hopefully you can think of other examples, beyond just a list of links, where this technique might be useful for you. 

To learn more about Gomplate and its installation, you can refer to the [official Gomplate documentation](https://docs.gomplate.ca/). Additionally, you can explore the [GitHub repository](https://github.com/hairyhenderson/gomplate) for Gomplate to get more information and access the source code.


