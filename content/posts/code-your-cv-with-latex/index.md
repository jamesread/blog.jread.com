---
title: "Code your CV/Resume with LaTeX"
date: 2025-11-28T15:30:00+01:00
draft: false
tags:
  - code
  - career
---

I hate writing documents about myself - CVs, promotion applications, or even just long documents in general - like my dissertation. However, I do love coding, so I can trick myself into writing these documents by using using a markup language. What better language to use than LaTeX?

[LaTeX](https://en.wikipedia.org/wiki/LaTeX) (pronounced "Lay-tech" or "Lah-tech") is a document preparation system and markup language, widely used in academia for writing papers, theses, and books. People say t hat it allows you to focus on the content of your document while LaTeX takes care of the formatting, but the markup syntax really is quite verbose. Having said that, it's extremely powerful, and once you get the hang of it, you can create complex documents with ease.

Here's a simple example of how to start the document;

**resume.tex**
```latex
\documentclass[a4paper,11pt]{article}
\usepackage{fancyhdr}
\usepackage{lastpage}
\cfoot{\thepage  of \pageref{LastPage}}
\usepackage[document]{ragged2e} % left align everything, not justify
\usepackage[a4paper]{geometry}
\setlength{\headheight}{0pt}
\setlength{\parindent}{0mm}
\setlength{\parskip}{6mm}
\setcounter{secnumdepth}0
\newcommand\tab[1][1cm]{\hspace*{#1}}
\usepackage{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	filecolor=blue,
	urlcolor=blue,
}
\urlstyle{same}
\usepackage{titlesec}
\titlespacing\section{0pt}{0pt}{0pt minus 25pt}

\usepackage{titling}
\predate{}
\date{}
\postdate{}
\preauthor{}
\postauthor{}

\geometry{top=1cm, bottom=1cm, left=1cm, right=1cm}


\begin{document}

\huge
\Centering{
James Read
}

\footnotesize
\Centering{\textbf{Email:} contact@jread.com 
\normalsize

\RaggedRight

\section{A Red Hatter keen to add a new hat}

I wear two hats at Red Hat ....
```

That's quite a lot - bit when you read through, it's no less than you would manually do in a simple word processor. One of the nicest things is that once it's setup, it's super consistent. 

To build the .tex file into a PDF, you can use the `pdflatex` command. It's even available in the Fedora repositories as well;

```bash
sudo dnf install pdflatex texlive-scheme-basic`
```

Then you can build the PDF with;

```bash
pdflatex resume.tex
```

This will generate a `resume.pdf` file in the same directory. If you're like me, you want a live updated preview as you edit and build. `evince` automatically does this;

```bash
evince resume.pdf &
```

Then every time you run `pdflatex resume.tex`, the PDF viewer will automatically refresh to show the latest version.

To make things flow a little quicker, you don't need to type the `pdflatex` command every time. You could use a simple `Makefile`, sure, but I prefer simply adding a `shebang` to the top of my `.tex` file, making it executable, and running it directly.

```latex
%& /usr/bin/env pdflatex resume.tex

\documentclass[a4paper,11pt]{article}
```

Assuming that I set the file `chmod +x` to be executable, I can run the following in vim to build the PDF;

```vim  
nnoremap M :!./%<CR>
```

So simply pressing "M" (shift+m) in normal mode will build the PDF, and update in evince.

From here, you're back to the boring work of writing your CV/Resume, but at least you're doing it with code (and a feeling of superiority!!).
