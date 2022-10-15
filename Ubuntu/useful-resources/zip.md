<!--ts-->
   * [zip](#zip)
      * [How to unzip a multipart (spanned) ZIP on Linux?](#how-to-unzip-a-multipart-spanned-zip-on-linux)

<!-- Added by: gil_diy, at: Sun 12 Dec 2021 23:18:44 IST -->

<!--te-->

# zip

## How to unzip a multipart (spanned) ZIP on Linux?

Let's say I have:

train.zip.001,
train.zip.002,
train.zip.003,
train.zip.004,

This will concatenate all of your train.zip.001, test.zip.002, etc files into one larger, train.zip file. Once you have that single file, you may run `unzip test.zip`

```bash
cat train.zip* > train.zip
```