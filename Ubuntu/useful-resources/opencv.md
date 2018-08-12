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
Calculate contour | area = **cv2.contourArea**(contour)
Resize image | **cv2.resize**(_letter, **(100, 100)**_)
Draw a rectangle on an image | cv2.rectangle(img, (x, y), (x + w, y + h), color, thickness)


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
 | group_areas = stats[1:, cv2.CC_STAT_AREA]    # (ignoring 0, which is the background id)
 | **cv2.connectedComponents**(img, connectivity=4)

### Useful functions in PIL (Python Imaging Library)

Description | command
------------------------------------|-----
show image | img.show()


## Contours Hierarchy


https://docs.opencv.org/3.4.0/d9/d8b/tutorial_py_contours_hierarchy.html


#### Example #1: cv2.RETR_CCOMP

Current Contour | Next contour in same hierarchy level under largest contour which was revealed | Previous contour | parent not necessarily from the same hierarchy |
----------------|--------------------------------------|------------------|-----------------------------------------------------|
**0**           |                    3                 |       -1         | -1                                                    |
**1**           |                    2                 |       -1         |  0                                                   |
**2**           |                    -1(??)            |       -1         |                                                     |
**3**           |                   5                  |                |                                                     |
**4**           |                                     |                |                                                     |
**5**           |                                     |                |                                                     |
**6**           |                                     |                |                                                     |
**7**           |                                     |                |                                                     |
**8**           |                                     |                |                                                     |
**9**           |                                     |                |                                                     |
