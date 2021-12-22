<!--ts-->
   * [PIL (Python Image Library)](#pil-python-image-library)
      * [Installation](#installation)
      * [Useful functions in PIL (Python Imaging Library)](#useful-functions-in-pil-python-imaging-library)
      * [Get pixel values](#get-pixel-values)
      * [Rotate image](#rotate-image)
      * [Draw eliipse](#draw-eliipse)
      * [Save image file](#save-image-file)

<!-- Added by: gil_diy, at: Wed 22 Dec 2021 16:23:59 IST -->

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

## Rotate image

```python
PIL.Image.Image.rotate(my_image, a, resample=PIL.Image.BICUBIC, expand=True)
```

## Draw eliipse

```python
image = Image.open("x.png")
draw = ImageDraw.Draw(image)
leftUpPoint = (x-r, y-r)
rightDownPoint = (x+r, y+r)
twoPointList = [leftUpPoint, rightDownPoint]
draw.ellipse(twoPointList, fill=(255,0,0,255))
```

## Save image file
```python
image = Image.new('RGBA', (200, 200))
...
image.save('test.png')
```