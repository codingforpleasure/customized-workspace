<!--ts-->
   * [table](#table)
      * [Terminology](#terminology)
      * [Mean Average Percision](#mean-average-percision)

<!-- Added by: gil_diy, at: Sun 11 Jul 2021 01:14:33 IDT -->

<!--te-->


# table

## Terminology

* **Object Localization** is finding **what** and **where** a **(single)** object exists in an image

 * **Object Detection** is finding **what** and **where (multiple)** objects are in an image

* **IoU (intersection over union)** - is for how to evaluate a bounding box prediction

* NMS (Non Max Suppression)  - Cleanup multiple bounding boxes

**Non-max suppression algorithm**

Phase #1: Start with discarding all **bounding boxes < probabilty threshold**

Phase #2: 
```
# We do this for each class

while BoundingBoxes:
	- Take out largest probabilty box
	- Remove all other boxes with IoU > threshold

```

## Mean Average Percision

Goal is to understand the most common metric used in Deep Learning to evaluate 
object detection models.


[Link](https://youtu.be/FppOzcDvaDI?list=PLhhyoLH6Ijfw0TpCTVTNk42NN08H6UvNq)