<!--ts-->
   * [PIL (Python Image Library)](#pil-python-image-library)
      * [Installation](#installation)
      * [Useful functions in PIL (Python Imaging Library)](#useful-functions-in-pil-python-imaging-library)
      * [Get pixel values](#get-pixel-values)
      * [Get image dimenstions](#get-image-dimenstions)
      * [Rotate image](#rotate-image)
      * [Draw circle and save](#draw-circle-and-save)
      * [Save image file](#save-image-file)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: Fri 24 Dec 2021 22:17:20 IST -->

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
convert to RGB while opening image 	|  Image.open(img_path).convert("RGB")


## Get pixel values

```python
list(pilImg.getdata())
```

## Get image dimenstions

```python
rectangle = Image.open("...")
rsize_x, rsize_y = rectangle.size
```

## Rotate image

```python
PIL.Image.Image.rotate(my_image, a, resample=PIL.Image.BICUBIC, expand=True)
```

## Draw circle and save

```python
import Image, ImageDraw
image = Image.new('RGBA', (200, 200))
draw = ImageDraw.Draw(image)
draw.ellipse((20, 20, 180, 180), fill='blue', outline='blue')
image.save('test.png')
```

## Save image file
```python
image = Image.new('RGBA', (200, 200))
...
image.save('test.png')
```


## Reference

[Link](https://neptune.ai/blog/pil-image-tutorial-for-machine-learning)