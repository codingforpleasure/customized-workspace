<!--ts-->
   * [PIL (Python Image Library)](#pil-python-image-library)
      * [Installation](#installation)
      * [Useful functions in PIL (Python Imaging Library)](#useful-functions-in-pil-python-imaging-library)
      * [Get pixel values](#get-pixel-values)

<!-- Added by: gil_diy, at: Sat 13 Feb 2021 11:54:19 IST -->

<!--te-->

# PIL (Python Image Library)

## Installation
```python
pipenv install pillow
```

## Useful functions in PIL (Python Imaging Library)

Description | command
------------------------------------|-----
show image | img.show
convert to RGB while opening image |  Image.open(img_path).convert("RGB")


## Get pixel values

```python
list(pilImg.getdata())
```