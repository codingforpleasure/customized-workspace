<!--ts-->
   * [sckit-image](#sckit-image)
      * [install](#install)
      * [import library](#import-library)
      * [resize image](#resize-image)
      * [downscale](#downscale)
      * [Detecting edges](#detecting-edges)
      * [Canny edge detector](#canny-edge-detector)

<!-- Added by: gil_diy, at: 2020-07-11T17:08+03:00 -->

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