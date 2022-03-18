<!--ts-->
   * [PIL (Python Image Library)](#pil-python-image-library)
      * [Installation](#installation)
      * [Useful functions in PIL (Python Imaging Library)](#useful-functions-in-pil-python-imaging-library)
      * [Get pixel values](#get-pixel-values)
      * [Get image dimenstions](#get-image-dimenstions)
      * [Exporting numpy array as image](#exporting-numpy-array-as-image)
      * [Rotate image](#rotate-image)
      * [Draw circle and save](#draw-circle-and-save)
      * [Pasting image on to an image](#pasting-image-on-to-an-image)
      * [Horizontal flip](#horizontal-flip)
      * [Save image file](#save-image-file)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: Fri 18 Mar 2022 13:20:14 IST -->

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
rectangle = Image.open("bla.jpg")
rsize_x, rsize_y = rectangle.size
```

## Exporting numpy array as image

```python
from PIL import Image

img_array = np.array(list_values, dtype=np.uint8).reshape(96, 96)
im = Image.fromarray(img_array)
im.save(f"face.jpeg")
```

## Rotate image

```python
foreground = Image.open("rec.png").convert('RGBA')
rotated_image = fg.rotate(angle = 30, expand=True)
rotated_image.save('result.png')
```

`Coordinates of the center of rotation: center`

## Draw circle and save

```python
import Image, ImageDraw
image = Image.new('RGBA', (200, 200))
draw = ImageDraw.Draw(image)

# Pay attention: (20, 20, 180, 180) is (x1,y1,x2,y2)
# Bounding box of the ellipse
draw.ellipse((20, 20, 180, 180), fill='blue', outline='blue')
image.save('test.png')
```

## Pasting image on to an image

```python
# Open background and foreground and ensure they are RGB (not palette)
bg = Image.open('bg_stripes.png').convert('RGBA')
fg = Image.open('only_matches.png').convert('RGBA')

# Resize foreground down from 500x500 to 100x100
#fg_resized = fg.resize((100, 100))

# Overlay foreground onto background at top right corner, using transparency of foreground as mask
bg.paste(fg, box=(50, 50), mask=fg)

# Save result
bg.save('result.png')
```

## Horizontal flip

```python
out = im.transpose(PIL.Image.FLIP_LEFT_RIGHT)
```

[Link](https://pythonexamples.org/python-pillow-flip-image-vertical-horizontal/)

## Save image file
```python
image = Image.new('RGBA', (200, 200))
...
image.save('test.png')
```


## Reference

[Link](https://neptune.ai/blog/pil-image-tutorial-for-machine-learning)