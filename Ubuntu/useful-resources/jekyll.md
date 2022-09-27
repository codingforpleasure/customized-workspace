<!--ts-->
   * [Jekyll](#jekyll)
      * [Run Jekyll locally](#run-jekyll-locally)
      * [All posts reside](#all-posts-reside)
      * [Applying the layout design to a post](#applying-the-layout-design-to-a-post)
      * [Troubleshooting](#troubleshooting)
         * [Address already in use](#address-already-in-use)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Tue 27 Sep 2022 10:24:57 IDT -->

<!--te-->

# Jekyll

## Run Jekyll locally

```bash
bundle exec jekyll serve
```

## All posts reside

```bash
/home/gil_diy/github_pages_shay/PlotsForFun.github.io/example/_posts
```

## Applying the layout design to a post

make sure the 

```
---
title: "Markup: Syntax Highlighting"
excerpt: "Post displaying the various ways one can highlight code blocks with Jekyll. Some options include standard Markdown, GitHub Flavored Markdown, and Jekyll's `{% highlight %}` tag."
last_modified_at: 2017-03-09T10:27:01-05:00
layout: post # <- important line
categories:
  - Tensorflow  
tags: 
  - code
  - syntax highlighting
---
```


## Troubleshooting

In case of getting the following Error:

### Address already in use 

In case port 4000 is already in use:

```bash
sudo lsof -t -i tcp:4000 | xargs kill -9
```


# Reference


[so-simple-theme](https://github.com/mmistakes/so-simple-theme)

[Link](https://github.com/alshedivat/al-folio)



