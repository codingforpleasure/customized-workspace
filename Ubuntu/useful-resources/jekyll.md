<!--ts-->
   * [Jekyll](#jekyll)
      * [Run Jekyll locally](#run-jekyll-locally)
      * [Troubleshooting](#troubleshooting)
         * [Address already in use](#address-already-in-use)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Mon 26 Sep 2022 18:44:28 IDT -->

<!--te-->

# Jekyll

## Run Jekyll locally

```bash
bundle exec jekyll serve
```


## Troubleshooting

In case of getting the following Error:

### Address already in use 

In case port 4000 is already in use:

```bash
sudo lsof -t -i tcp:4000 | xargs kill -9
```


# Reference

[Link](https://github.com/alshedivat/al-folio)



