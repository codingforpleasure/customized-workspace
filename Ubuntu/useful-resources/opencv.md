<!--ts-->
   * [An OpenCV glimpse](#an-opencv-glimpse)
      * [Basics](#basics)
         * [Useful functions in open CV](#useful-functions-in-open-cv)
         * [Colorspaces in OpenCV](#colorspaces-in-opencv)
         * [Arithmetic Operations on Images](#arithmetic-operations-on-images)
            * [Addition](#addition)
            * [Substruction](#substruction)
         * [Logical Operations on images](#logical-operations-on-images)
         * [Thresholding Types](#thresholding-types)
            * [Threshold set manualy](#threshold-set-manualy)
            * [Threshold calculated automaticaly (THRESH_OTSU)](#threshold-calculated-automaticaly-thresh_otsu)
            * [Adaptive thresholding](#adaptive-thresholding)
         * [Geometric Transformations](#geometric-transformations)
            * [Scale an image](#scale-an-image)
            * [Shift/Tranaslate an image](#shifttranaslate-an-image)
            * [Rotate an image](#rotate-an-image)
            * [Affine transformation (Shear)](#affine-transformation-shear)
         * [Morphological Transformations](#morphological-transformations)
            * [Erosion](#erosion)
            * [Dilation](#dilation)
            * [Gradient (For determining the borders)](#gradient-for-determining-the-borders)
            * [Structuring Element (elliptical/circular shaped kernels)](#structuring-element-ellipticalcircular-shaped-kernels)
         * [Contour Approximation Method](#contour-approximation-method)
         * [Contours Hierarchy](#contours-hierarchy)
         * [Extracting connected components from binary image](#extracting-connected-components-from-binary-image)
         * [distance transform](#distance-transform)
         * [Useful functions in PIL (Python Imaging Library)](#useful-functions-in-pil-python-imaging-library)

<!-- Added by: gil_diy, at: 2018-08-29T02:25+03:00 -->

<!--te-->
# An OpenCV glimpse

## Basics

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
Resize image | **cv2.resize**(_img, **(100, 100)**_)
Draw a rectangle on an image | **cv2.rectangle**(img, (x, y), (x + w, y + h), color, thickness)


### Colorspaces in OpenCV

### Arithmetic Operations on Images

apply a simple arithmation operation on each pixel of the image
#### Addition
**Commutative operation**
#### Substruction
### Logical Operations on images

```python
img1 = cv2.imread(imgpath1, 1)
img2 = cv2.imread(imgpath2, 1)

img1 = cv2.cvtColor(img1, cv2.COLOR_BGR2RGB)
img2 = cv2.cvtColor(img2, cv2.COLOR_BGR2RGB)

img3 = cv2.bitwise_not(img1)
img4 = cv2.bitwise_and(img1, img2)
img5 = cv2.bitwise_or(img1, img2)
img6 = cv2.bitwise_xor(img1, img2)
```
### Thresholding Types

#### Threshold set manualy
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

**THRESH_BINARY_INV:**`if pixel > threshold pixel = 0 else pixel = max_val`

**THRESH_TOZERO:** `if pixel < threshold pixel = 0 `

**THRESH_TOZERO_INV:** `if pixel > threshold pixel = 0 `

**THRESH_TRUNC:** `if pixel > threshold pixel = 0 `

<p align="center">
  <img src="images/thresholding_example.png" title="Labeled connected component">
</p>



What about those two: THRESH_TRIANGLE, THRESH_MASK ?




#### Threshold calculated automaticaly (THRESH_OTSU)

Will automatically calculate the appropriate threshold and then apply the binarization algorithm we are using with it.
Is used to **automatically** perform clustering-based image thresholding,
The algorithm assumes that the image contains two classes of pixels following bi-modal histogram (foreground pixels and background pixels), it then calculates the optimum threshold separating the two classes so that their combined spread (intra-class variance) is minimal, or equivalently (because the sum of pairwise squared distances is constant), so that their inter-class variance is maximal.

To apply THRESH_OTSU second argueumnt (threshold) should be set to zero, and should add the THRESH_OTSU flag:

cv2.threshold(img,0,max_val, THRESHOLD_BINARY + THRESH_OTSU)

http://www.labbookpages.co.uk/software/imgProc/otsuThreshold.html

#### Adaptive thresholding

When the THRESH_OTSU approach fails, we should consider adaptive thresholding:

```python
block_size = 513
constant = 2

th1 = cv2.adaptiveThreshold(img, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, block_size, constant)
th2 = cv2.adaptiveThreshold (img, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, block_size, constant)
```

### Geometric Transformations


<p align="center">
  <img src="images/transformations_example.png" title="Transformations examples:">
</p>

#### Scale an image
Scale scales a set of points up or down in the x and y directions.

```python
cv2.resize(img1, None,...)
```
#### Shift/Tranaslate an image
Shift/Translate moes a set of points a fixed distance in x anf y

```python
T = np.float32([[1,0,50],[0,1,-50]])
cv2.warpAffine(img1,T, (columns,rows))
```
#### Rotate an image

cv2.getRotationMatrix2D(center, angle, scale)
 - returns a **rotation matrix**.

```python
rows, columns, channels = img1.shape

# Generate an rotation matrix clockwise by 45 degress and remain the same size (scale factor = 1):
R = cv2.getRotationMatrix2D((columns/2, rows/2), 45, 1)

# Now apply the rotation matrix on the image
output = cv2.warpAffine(img1, R ,(columns,rows))



```
#### Affine transformation (Shear)
Shear offsets a set of points a distance proportional to their x and y coordinates.

### Morphological Transformations

Should apply those transformations on black and white images

#### Erosion
```python
erosion = cv2.erode(binary_inv, kernel, iterations = 1)
```
#### Dilation
```python
dilation = cv2.dilate(binary_inv, kernel, iterations = 1)
```
#### Gradient (For determining the borders)

```python
gradient = cv2.morphologyEx(binary_inv, cv2.MORPH_GRADIENT, kernels)
```

#### Structuring Element (elliptical/circular shaped kernels)
```python
kernel = cv2.getStructuringElement(cv2.MORPH_CROSS,(5, 5))
```

<!-- MORPH_BLACKHAT = 6
MORPH_CLOSE = 3
MORPH_CROSS = 1
MORPH_DILATE = 1
MORPH_ELLIPSE = 2
MORPH_ERODE = 0
MORPH_GRADIENT = 4
MORPH_HITMISS = 7
MORPH_OPEN = 2
MORPH_RECT = 0
MORPH_TOPHAT = 5 -->

### Contour Approximation Method
```python
kernel = kernel = np.ones((5,5),np.uint8)
gradient = cv2.morphologyEx(binary_inv, cv2.morphologyEx, cv2.MORPH_GRADIENT, kernel)
```

Flag | Meaning
-----|-------------------
CHAIN_APPROX_NONE | all the boundary points are stored (maximum accuracy but the tradeoff is memory consumption).
CHAIN_APPROX_SIMPLE | removes all redundant points and compresses the contour, thereby saving memory
CHAIN_APPROX_TC89_KCOS |
CHAIN_APPROX_TC89_L1 |

### Contours Hierarchy

Great resource:
https://docs.opencv.org/3.4.0/d9/d8b/tutorial_py_contours_hierarchy.html

### Extracting connected components from binary image
* Connected components in binary images are areas of non-zero values.
* different components don't touch each other, there are zeros around each one.
* Finding connected components in an image is much faster then finding all contours.So it's possible to quickly exclude all irrelevant paths of the image according to connected commponent features.


Description | command
------------------------------------|-----
Get some important information about each connected component, such as the bounding box, area, and center of mass (also known as centroid) |_, labels, stats, _ = **cv2.connectedComponentsWithStats**(img, connectivity=4)
 | **cv2.connectedComponents**(img, connectivity=4)
 | **connectivity=4** means 4-connected pixels are neighbors to every pixel that touches one of their edges (These pixels are connected horizontally and vertically).
 |**connectivity=8** means 8-connected pixels are neighbors to every pixel that touches one of their edges or corners. These pixels are connected horizontally, vertically, and diagonally
| group_areas = stats[1:, cv2.CC_STAT_AREA]    # (ignoring 0, which is the background id)


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

There are 4 connected components, **largest one holds label '1, let's focus on it** :

<p align="center">
  <img src="images/labeling_example.png" width="256" title="Labeled connected component">
</p>

it's **CC_STAT_LEFT** is 1

it's **CC_STAT_TOP** is 1

it's **CC_STAT_WIDTH** is 7

it's **CC_STAT_HEIGHT** is 6

it's **CC_STAT_AREA** is 19



### distance transform

https://homepages.inf.ed.ac.uk/rbf/HIPR2/distance.htm

### Useful functions in PIL (Python Imaging Library)

Description | command
------------------------------------|-----
show image | img.show()

