---
title: "Today I Switched to nvim"
date: 2025-04-02T22:05:02+01:00
draft: false
tags:
  - today-i-switched
  - my-tools
  - vim
featured_image: ""
description: ""
---

I've been using vim on a daily basis since about 2011, when I started my first job as a systems engineer. The reason that I picked up Vim in the first place was that I was using Linux on a day to day basis (CentOS 5, if you wanted to know), across many different servers - and I wanted to edit files over ssh on those servers. While Nano was fine, and I could use it, it was a colleague using Vim that encouraged me to give it a go. I've been using it ever since.

I started off writing PHP in Vim - it was genuinely faster to edit my .php files directly on the webserver, edit, and reload. It had syntax highlighting and I just found that I didn't miss autocomplete. At the time I was using Vim without any plugins, and my .vimrc file was just a few lines long. Over time, I found myself wanting vim on my desktop, so that I could use it for all my text editing, and over time I expanded my configuration to add a few shortcuts, while I learned more and more about using Vim productively.

When I switched to Fedora as my daily desktop in about 2014 or so, I found that there were several plugins available in the yum repositories for Vim. It was important for me to just rely on plugins that were available in the yum repos, because I didn't want to install and manage plugins on every server, if it was more than just a `yum install` away. Over time, the plugins I came to rely on were;

- `vim-nerdtree` - a file explorer in the sidebar (https://github.com/preservim/nerdtree)
- `command-t` - a "quick find" dialog to open files by searching for their filename (https://github.com/wincent/command-t)
- `jedi-vim` - a autocompletion library, but I never found this worked very well (https://github.com/davidhalter/jedi-vim)
- `vim-powerline` - a pretty looking toolbar (https://github.com/powerline/powerline)
- `vim-taglist` - mostly for c development, a list of tags, like functions, in a side buffer (https://vim-taglist.sourceforge.net/manual.html)

I experimented with Pathogen and a few others, but this was really all that was available in the Fedora repos, and I didn't feel like anything was really missing. It was convenient to have thiese packages readily available on every server I used regularly.

[nvim](https://neovim.io/) came to my attention a few years ago, and I was intrigued by the idea of a "modern" vim. However, not being compatible with most of the plugins I used, I didn't want the friction of switching. Wow, I missed a critical part - the automatic plugin manager.

What caused me to look at nvim again was [avante.nvim](https://github.com/yetone/avante.nvim) - because I wanted an AI assistant in Vim besides copilot, and this looked very promising. The initial setup was a lot to take in - I couldn't quite understand what the Lua scripts were trying to do - and why all the plugin examples I found were in a syntax that didn't match what I had setup. However, I've now got it all working, and the best thing is that with Lazy (the plugin manager I chose), I have a far richer set of plugins to choose from, and they are automatically installed and updated on every system I use - I don't have to rely on Fedora packages anymore. I can even use Debian, hah, if I really have to!

So what got me to switch to nvim was the **automatic plugin manager that brings my plugins with me to every system I use** (I still use Vim over SSH a /lot/). One of the biggest reasons I use Vim (and now NeoVim) is that I can use it absolutely everywhere, and I've built up almost 15 years of muscle memory with it. 

Here's my configuration for NeoVim, if you're interested; https://github.com/jamesread/scripts/tree/master/nvim

The plugins that I'm using are;

- [lualine](https://github.com/nvim-lualine/lualine.nvim) - replaces `powerline` as the editor status bar
- [mason](https://github.com/williamboman/mason.nvim) - a package manager focussed on LSP servers, linters and formatters (this is incredibly powerful)
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) - configure LSP servers installed with mason
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - a fuzzy finder for files, buffers, functions, etc. Replaces `command-t`.
- [advante](https://github.com/yetone/avante.nvim) - the AI assistant I mentioned earlier
- [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) - a starting point for setting up LSPs (this isn't needed after version 0.11 of nvim it seems, but I am using 0.10 from the current version of Fedora (41). I'll remove this when I've upgraded all my boxes to a release of Fedora that includes 0.11).
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) - replaces `nerdtree` as the file explorer.
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - I'm not sure I really need this, but the LSP tutorial I was following told me to get it :-)
- [trouble](https://github.com/folke/trouble.nvim) - a list of quickfixes - oh no, I'm building my own IDE! hehe. This is great though.
- [which-key](https://github.com/folke/which-key.nvim) - popup reminders of vim shortcuts. I don't use this much, but it's nice to have.

The reasons I continue to use vim are;

- It's available on every machine I use (and now with which plugins, thanks nvim!)
- It's fast, in that it's not laggy or slow to load. Everything is instant. I don't necessarily think this leads to productivity gains or makes me a faster developer, but it **never causes frustration with being slow**. 
- It never prompts me for updates, or to take surveys - **it never surprises me**.
- It's free and open source. 

Anyway, that's a bit about why I use vim, and now, neovim!
