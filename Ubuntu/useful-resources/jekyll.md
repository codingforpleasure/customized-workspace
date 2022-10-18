<!--ts-->
   * [Jekyll](#jekyll)
      * [Run Jekyll locally](#run-jekyll-locally)
      * [Build Jekyll locally](#build-jekyll-locally)
      * [All posts reside](#all-posts-reside)
      * [Applying the layout design to a post](#applying-the-layout-design-to-a-post)
      * [Change so-simple-theme's default layout's](#change-so-simple-themes-default-layouts)
      * [Add another Author to your website:](#add-another-author-to-your-website)
      * [Troubleshooting](#troubleshooting)
         * [Address already in use](#address-already-in-use)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Tue 27 Sep 2022 21:55:32 IDT -->

<!--te-->

# Jekyll

## Run Jekyll locally

```bash
bundle exec jekyll serve --verbose
```

All files are generated and getting copied to the directory: `_site`

## Build Jekyll locally


```bash
bundle exec jekyll build --verbose
```


## All posts reside

```bash
/home/gil_diy/github_pages_shay/PlotsForFun.github.io/example/_posts
```

## Applying the layout design to a post

make sure each post holds the following header format, as seen below:

```
---
title: "Markup: Syntax Highlighting"
excerpt: "Post displaying the various ways one can highlight code blocks with Jekyll. Some options include standard Markdown, GitHub Flavored Markdown, and Jekyll's `{% highlight %}` tag."
last_modified_at: 2017-03-09T10:27:01-05:00
layout: post       # For setting the post layout
author: Shay Cohen # I'm assuming you have list the name in the file `authors.yml`
categories:
  - Tensorflow  
tags: 
  - code
  - syntax highlighting
---
```

## Change so-simple-theme's default layout's

All layout design is located in:

```bash
/home/gil_diy/github_pages_shay/PlotsForFun.github.io/_layouts
```

## Add another Author to your website:

Focus on the following file:

```bash
./example/_data/authors.yml
```
 and add:
``` 
Shay Cohen:
  name: "Shay Cohen"
  picture: "/example/images/michael-rose-photo.jpg"
  twitter: "corneliusfiddlebone"
  links:
  - label: "Made Mistakes"
    icon: "fas fa-fw fa-link"
    url: "https://www.nba.com"
```

In case you haven't noticed the image in the layout make sure you have entered 
the correct path for the `picture` field.


## Updating image of the person who wrote the post

```bash
./example/_data/authors.yml
```

update the field:

```md
picture: "/example/images/shay_head.jpeg"
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

[al-folio](https://github.com/alshedivat/al-folio)

[minimal-mistakes](https://github.com/mmistakes/minimal-mistakes)

