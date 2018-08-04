<!--ts-->
<!--te-->


## FEH (image viewer aimed mostly at console users)

### How to install?
```bash
$ sudo apt-get install feh
```

### How to use it?
Description | command
------------------------------------|-----
Display all png images in grid order (Montage mode)  | `feh --montage ./*.png --title "My example"`
Display all png images with filenames in grid order  (Index mode) | `feh --`index ./*.png --title "My example"`
Gel list of all images' properties (Width, Height, Pixels, Alpha) in directory | `feh --list`
Display all images in grid order but remain original size-fixed value (Montage mode/Index mode) | `feh --montage --thumb-width 160 --thumb-height 60 .`
Display all images in all subdirectories in recursive manner (useful for Montage mode/Index mode) | `feh --index --recursive .`
Display all images in grid size of NxM size| `feh -i --limit-width` &lt;N x image-height&gt; `--limit-height` &lt;M x image-width&gt;
Save created montage to file (Works both on Index mode and Motage mode) | `feh --index --recursive --output my-collection.png`



### Useful functions

Description | command
------------------------------------|-----
Load image | img = **cv2.imread**( _path-to-file_ )
Write image to disk | **cv2.imwrite**( _/codingForPleasure/example.png, img_ )
Convert to grayscale | grayImg = **cv2.cvtColor**(_img, **cv2.COLOR_BGR2GRAY**_)
Threshold | thresholdImg = **cv2.threshold**(_grayImg, &lt;threshold value&gt; ,&lt;max value&gt; **cv2.THRESH_BINARY_INV** \| **cv2.THRESH_OTSU**_ )
Retrievie contours | **cv2.findContours**(_img, **cv2.RETR_EXTERNAL**, **cv2.CHAIN_APPROX_SIMPLE**_)



###Threshold

###Contours


im2, contours, hierarchy = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

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
