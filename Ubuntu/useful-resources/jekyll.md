<!--ts-->
   * [Jekyll](#jekyll)
      * [Run Jekyll locally](#run-jekyll-locally)
      * [All posts reside](#all-posts-reside)
      * [Troubleshooting](#troubleshooting)
         * [Address already in use](#address-already-in-use)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Tue 27 Sep 2022 10:23:33 IDT -->

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



