<!--ts-->
   * [sckit-image](#sckit-image)
      * [install](#install)
      * [import library](#import-library)
      * [resize image](#resize-image)
      * [downscale](#downscale)
      * [Thresholding](#thresholding)
      * [Detecting edges](#detecting-edges)
      * [Canny edge detector](#canny-edge-detector)
      * [Hough lines](#hough-lines)
      * [Flood Fill](#flood-fill)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: 2020-07-28T15:21+03:00 -->

<!--te-->
# sckit-image

## install 
```python
pipenv install scikit-image
```

## import library

```python
from skimage import io
img = io.imread('images/test_image.jpg', as_gray = True)
```

## resize image
```python
from skimage.transform import rescale, resize, downscale_local_mean
resized_img = resized(img, (200,200))
plt.imshow(resized_img)
```
## downscale
```python
downscaled_img = downscale_local_mean(img,(4,3))
plt.imshow(downscaled_img)
```

## Thresholding

[Link](https://scikit-image.org/docs/stable/auto_examples/applications/plot_thresholding.html#sphx-glr-auto-examples-applications-plot-thresholding-py)

```python
import matplotlib.pyplot as plt

from skimage import data
from skimage.filters import try_all_threshold

img = data.page()

fig, ax = try_all_threshold(img, figsize=(10, 8), verbose=False)
plt.show()
```

## Detecting edges
```python
from skimage.filters import roberts, sobel, scharr, prewitt

edge_roberts = roberts(img)
edge_sobel = sobel(img)
edge_scharr = scharr(img)
edge_prewitt = prewitt(img)

fig, axes = plt.subplots(nrows = 3,
						 ncols = 2,
						 sharex = True,
						 sharey = True, 
						 figsize = (8,8))

ax = axes.ravel()

ax[0].imshow(img, cmap = plt.cm.gray)
ax[0].set_title('original image')

ax[1].imshow(edge_roberts, cmap = plt.cm.gray)
ax[1].set_title('Roberts Edge Detection')

ax[2].imshow(edge_sobel, cmap = plt.cm.gray)
ax[2].set_title('Sobel')

ax[3].imshow(edge_scharr, cmap = plt.cm.gray)
ax[3].set_title('Scharr')

ax[4].imshow(edge_prewitt, cmap = plt.cm.gray)
ax[4].set_title('prewitt')

for a in ax:
	a.axis('off')

plt.tight_layout()
plt.show()
```

## Canny edge detector
```python
from skimage.feature import canny

# play with sigma
edge_canny = canny(img, sigma = 3)
```

## Hough lines

[Link](https://scikit-image.org/docs/dev/auto_examples/edges/plot_line_hough_transform.html#id3)

Attention: The Hough line will only work on **black background**


## Flood Fill

[Link](https://scikit-image.org/docs/stable/auto_examples/segmentation/plot_floodfill.html)


```python
from skimage import data, filters
from skimage.segmentation import flood, flood_fill

checkers = data.checkerboard()

# Fill a square near the middle with value 127, starting at index (76, 76)
filled_checkers = flood_fill(checkers, (76, 76), 127)
```



## Reference

[Examples can be seen here](https://github.com/scikit-image/scikit-image/tree/master/doc/examples)