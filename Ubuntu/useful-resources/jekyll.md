<!--ts-->
   * [Jekyll](#jekyll)
      * [Run Jekyll locally](#run-jekyll-locally)
      * [Troubleshooting](#troubleshooting)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Mon 26 Sep 2022 18:43:47 IDT -->

<!--te-->

# Jekyll

## Run Jekyll locally

```bash
bundle exec jekyll serve
```


## Troubleshooting

In case of getting the following Error:

**Address already in use - bind(2) for 127.0.0.1:4000 (Errno::EADDRINUSE)**


```bash
sudo lsof -t -i tcp:4000 | xargs kill -9
```


# Reference

[Link](https://github.com/alshedivat/al-folio)



