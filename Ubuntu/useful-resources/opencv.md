<!--ts-->
<!--te-->

### Useful functions in open CV

Description | command
------------------------------------|-----
Load image | img = **cv2.imread**( _path-to-file_ )
Write image to disk | **cv2.imwrite**( _/codingForPleasure/example.png_, _img_ )
Display image | **cv2.imshow**( _window-title_ , _img_ )
Get image size | rows, columns , _ = **cv2.shape()**
Convert to grayscale | grayImg = **cv2.cvtColor**(_img, **cv2.COLOR_BGR2GRAY**_)
Threshold | thresholdImg = **cv2.threshold**(_grayImg, &lt;threshold value&gt; ,&lt;max value&gt; **cv2.THRESH_BINARY_INV** \| **cv2.THRESH_OTSU**_ )
Retrieve contours | im2, contours, hierarchy = **cv2.findContours**(_img, **cv2.RETR_EXTERNAL**, **cv2.CHAIN_APPROX_SIMPLE**_)
Calculate contour's area | area = **cv2.contourArea**(contour)
Get the dimentions of a bounding rectangle | (x,y,w,h) = **cv2.boundingRect**(contour)
Resize image | **cv2.resize**(_letter, **(100, 100)**_)
Draw a rectangle on an image | **cv2.rectangle**(img, (x, y), (x + w, y + h), color, thickness)


### Colorspaces in OpenCV

### Arithmetic Operations on Images

### Logical Operations on Images

### Thresholding Types

**Binary:**  `if pixel > threshold
	pixel = max_val`
else
	pixel = 0

so in code:
```python
max_val = 255
cv2.threshold(img,th,max_val, THRESHOLD_BINARY)
```

Let's see some few more types of thresold:

**Binary Inv:**`if pixel > threshold pixel = 0 else pixel = max_val`

**Zero:** `if pixel < threshold pixel = 0 `

**Zero Inv:** `if pixel > threshold pixel = 0 `

**Trunc:** `if pixel > threshold pixel = 0 `

<p align="center">
  <img src="images/thresholding_example.png" title="Labeled connected component">
</p>

### Contour Approximation Method

Flag | Meaning
-----|-------------------
CHAIN_APPROX_NONE | all the boundary points are stored (maximum accuracy but the tradeoff is memory consumption).
CHAIN_APPROX_SIMPLE | removes all redundant points and compresses the contour, thereby saving memory
CHAIN_APPROX_TC89_KCOS |
CHAIN_APPROX_TC89_L1 |



### Extracting connected components from binary image
* Connected components in binary images are areas of non-zero values.
* different components don't touch each other, there are zeros around each one.
* Finding connected components in an image is much faster then finding all contours.So it's possible to quickly exclude all irrelevant paths of the image according to connected commponent features.


Description | command
------------------------------------|-----
Get some important information about each connected component, such as the bounding box, area, and center of mass (also known as centroid) |_, output, stats, _ = **cv2.connectedComponentsWithStats**(img, connectivity=4)
 | **cv2.connectedComponents**(img, connectivity=4)
 | **connectivity=4** means 4-connected pixels are neighbors to every pixel that touches one of their edges (These pixels are connected horizontally and vertically).
 |**connectivity=8** means 8-connected pixels are neighbors to every pixel that touches one of their edges or corners. These pixels are connected horizontally, vertically, and diagonally
| group_areas = stats[1:, cv2.CC_STAT_AREA]    # (ignoring 0, which is the background id)
| You can easily retrieve:


As mentioned before the **connectedComponentsWithStat** function returns 4 values.

The **second value** is a marix of the original image's size, which every pixel holds the label it belongs to the corresponding connected component.

The **third value** is a tuple (&lt;label&gt;,&lt;property-value-of-the-label&gt;)

&lt;property-value-of-the-label&gt; can hold one of the following values:

CC_STAT_LEFT

CC_STAT_TOP

CC_STAT_WIDTH

CC_STAT_HEIGHT

CC_STAT_AREA

**Let's take an example, see below:**

There are 4 connected components, **largest one is '1, let's focus on it** :

<p align="center">
  <img src="images/labeling_example.png" width="256" title="Labeled connected component">
</p>

it's **CC_STAT_LEFT** is 1

it's **CC_STAT_TOP** is 1

it's **CC_STAT_WIDTH** is 7

it's **CC_STAT_HEIGHT** is 6

it's **CC_STAT_AREA** is 19



### Useful functions in PIL (Python Imaging Library)

Description | command
------------------------------------|-----
show image | img.show()


## Contours Hierarchy

Great resource:
https://docs.opencv.org/3.4.0/d9/d8b/tutorial_py_contours_hierarchy.html
