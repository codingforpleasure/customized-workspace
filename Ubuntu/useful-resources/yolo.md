<!--ts-->
   * [YOLO](#yolo)
      * [Basic operations](#basic-operations)
         * [Recognize objects in a photo:](#recognize-objects-in-a-photo)
         * [Recognize objects in a video:](#recognize-objects-in-a-video)
         * [Changing The Detection Threshold](#changing-the-detection-threshold)
      * [Training model](#training-model)

<!-- Added by: gil_diy, at: 2020-05-27T21:26+03:00 -->

<!--te-->


#  YOLO


The actual classes names appear in the file: `coco.names`

## Basic operations

### Recognize objects in a photo:
```
./darknet detect cfg/yolov4.cfg weights/yolov4.weights data/dog.jpg
```


### Recognize objects in a video:
```
./darknet detector demo cfg/coco.data cfg/yolov4.cfg weights/yolov4.weights input_video.mp4 -out_filename res.avi
```


### Changing The Detection Threshold

By default, YOLO only displays objects detected with a confidence of .25 or higher. You can change this by passing the -thresh <val> flag to the yolo command. For example, to display all detection you can set the threshold to 0:

```
./darknet detect cfg/yolov4.cfg weights/yolov4.weights data/dog.jpg -thresh 0
```

## Training model
