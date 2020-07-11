<!--ts-->
   * [sckit-image](#sckit-image)
      * [install](#install)
      * [import library](#import-library)
      * [resize image](#resize-image)
      * [downscale](#downscale)

<!-- Added by: gil_diy, at: 2020-07-11T16:50+03:00 -->

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
