<!--ts-->
   * [Detectron](#detectron)
      * [How to install Detectron2](#how-to-install-detectron2)
      * [Coco file annotation format:](#coco-file-annotation-format)
         * [config](#config)
      * [Using default Instance segmentation model](#using-default-instance-segmentation-model)
      * [Using default Panoptic segmentation model](#using-default-panoptic-segmentation-model)
      * [Using default Keypoint detection model](#using-default-keypoint-detection-model)
         * [Metrics output while training](#metrics-output-while-training)
      * [Mean Average Precision (mAP)](#mean-average-precision-map)
      * [configuration](#configuration)
      * [loading custom made model](#loading-custom-made-model)
      * [Saving model](#saving-model)
      * [Terminology](#terminology)
      * [Debugging with pycharm](#debugging-with-pycharm)
      * [Measuring Object Detection models - mAP - What is Mean Average Precision?](#measuring-object-detection-models-map-what-is-mean-average-precision)
      * [References](#references)

<!-- Added by: gil_diy, at: Wed 29 Dec 2021 02:36:06 IST -->

<!--te-->


# Detectron

## How to install Detectron2

[Link](https://detectron2.readthedocs.io/tutorials/install.html)

## Coco file annotation format:

[Link](
https://detectron2.readthedocs.io/tutorials/datasets.html#standard-dataset-dicts)


### config 

[Link](https://github.com/facebookresearch/detectron2/tree/master/configs)


## Using default Instance segmentation model

```python
from detectron2.utils.visualizer import Visualizer
from detectron2.engine import DefaultPredictor
from detectron2.config import get_cfg
import cv2

def use_predictor_get_segmentation_from_existing_model(im):
    cfg = get_cfg()
    # add project-specific config (e.g., TensorMask) here if you're not running a model in detectron2's core library
    cfg.merge_from_file(model_zoo.get_config_file("COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml"))
    cfg.MODEL.ROI_HEADS.SCORE_THRESH_TEST = 0.5  # set threshold for this model
    # Find a model from detectron2's model zoo. You can use the https://dl.fbaipublicfiles... url as well
    cfg.MODEL.WEIGHTS = model_zoo.get_checkpoint_url("COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml")
    predictor = DefaultPredictor(cfg)
    outputs = predictor(im)

    # look at the outputs. See https://detectron2.readthedocs.io/tutorials/models.html#model-output-format for specification
    print(outputs["instances"].pred_classes)
    print(outputs["instances"].pred_boxes)

    # We can use `Visualizer` to draw the predictions on the image.
    v = Visualizer(im[:, :, ::-1], MetadataCatalog.get(cfg.DATASETS.TRAIN[0]), scale=1.2)
    out = v.draw_instance_predictions(outputs["instances"].to("cpu"))
    cv2.imshow("Model1 - Detection and segmentation", out.get_image()[:, :, ::-1])
    cv2.waitKey()
    cv2.destroyWindow("Model1 - Detection and segmentation")

```
Now let's invoke the function:

```python
img = cv2.imread("./input2.jpg")
cv2.imshow("Original image", img)
cv2.waitKey()
cv2.destroyWindow("Original image")

use_predictor_get_segmentation_from_existing_model(img)
```

## Using default Panoptic segmentation model

```python
from detectron2.utils.visualizer import Visualizer
from detectron2.engine import DefaultPredictor
from detectron2.config import get_cfg
import cv2

def use_predictor_get_panoptic_segmentation_from_existing_model(im):
    ## panoptic segmentation model

    # Inference with a panoptic segmentation model
    cfg = get_cfg()
    cfg.merge_from_file(model_zoo.get_config_file("COCO-PanopticSegmentation/panoptic_fpn_R_101_3x.yaml"))
    cfg.MODEL.WEIGHTS = model_zoo.get_checkpoint_url("COCO-PanopticSegmentation/panoptic_fpn_R_101_3x.yaml")
    predictor = DefaultPredictor(cfg)
    panoptic_seg, segments_info = predictor(im)["panoptic_seg"]
    v = Visualizer(im[:, :, ::-1], MetadataCatalog.get(cfg.DATASETS.TRAIN[0]), scale=1.2)
    out = v.draw_panoptic_seg_predictions(panoptic_seg.to("cpu"), segments_info)
    cv2.imshow("Model3 - Panoptic", out.get_image()[:, :, ::-1])
    cv2.waitKey()
    cv2.destroyWindow("Model3 - Panoptic")
```

Now let's invoke the function:

```python
img = cv2.imread("./input2.jpg")
cv2.imshow("Original image", img)
cv2.waitKey()
cv2.destroyWindow("Original image")

use_predictor_get_panoptic_segmentation_from_existing_model(img)
```

## Using default Keypoint detection model

```python
from detectron2.utils.visualizer import Visualizer
from detectron2.engine import DefaultPredictor
from detectron2.config import get_cfg
import cv2

def use_predictor_get_keypoints_from_existing_model(im):
    
    cfg = get_cfg()  # get a fresh new config
    cfg.merge_from_file(model_zoo.get_config_file("COCO-Keypoints/keypoint_rcnn_R_50_FPN_3x.yaml"))
    cfg.MODEL.ROI_HEADS.SCORE_THRESH_TEST = 0.7  # set threshold for this model
    cfg.MODEL.WEIGHTS = model_zoo.get_checkpoint_url("COCO-Keypoints/keypoint_rcnn_R_50_FPN_3x.yaml")
    
    predictor = DefaultPredictor(cfg)
    outputs = predictor(im)

    # “pred_keypoints”: a Tensor of shape (N, num_keypoint, 3).
    # Each row in the last dimension is (x, y, score). Confidence scores are larger than 0.

    v = Visualizer(im[:, :, ::-1], MetadataCatalog.get(cfg.DATASETS.TRAIN[0]), scale=1.2)
    out = v.draw_instance_predictions(outputs["instances"].to("cpu"))
    cv2.imshow("Model2 - Keypoints", out.get_image()[:, :, ::-1])
    cv2.waitKey()
    cv2.destroyWindow("Model2 - Keypoints")

```
Now let's invoke the function:

```python
img = cv2.imread("./input2.jpg")
cv2.imshow("Original image", img)
cv2.waitKey()
cv2.destroyWindow("Original image")

use_predictor_get_keypoints_from_existing_model(img)
```


### Metrics output while training 

Term | Description
------------|-----
eta |
iter | 
total_loss | 
loss_cls | a loss that measure the correctness of the classification of each predicted bounding box: each box may contain an object class, or a "background". This loss is usually cross entropy loss
loss_box_reg | loss_bbox a loss that measure how "tight" the bounding box the model predicted around the true object (usually a regression loss, L1, smoothL1 etc.).
loss_mask | element-description
loss_rpn_cls | element-description
loss_rpn_loc | element-description
time | element-description
data_time | element-description
lr | element-description
max_mem | element-description


## Mean Average Precision (mAP) 

mAP is used to evaluate the performance of the model.

## configuration 

```
/detectron2/detectron2/config/defaults.py
```

## loading custom made model

* In order to load a custom trained model `pth` file, you need to refer to the corresponding file,
using the `cfg.MODEL.WEIGHTS` . 

* Moreover please pay attention to load the correct config file using the `get_config_file`

* If it's a keypoint model you must initialize the field `cfg.MODEL.ROI_KEYPOINT_HEAD.NUM_KEYPOINTS` with the correct
number of keypoints, otherwise it won't work.


```python
   from detectron2.config import get_cfg
   
   cfg = get_cfg()
   
   path_to_model = "/home/gil_diy/PycharmProjects/detectron_with_GPU/arrow_keypoints_training/output/model_arrows_keypoint.pth"

   cfg.merge_from_file(model_zoo.get_config_file("COCO-Keypoints/keypoint_rcnn_R_50_FPN_3x.yaml"))
   cfg.MODEL.ROI_HEADS.SCORE_THRESH_TEST = 0.5  # set threshold for this model
   cfg.MODEL.WEIGHTS = path_to_model
   cfg.MODEL.ROI_KEYPOINT_HEAD.NUM_KEYPOINTS = 1
   cfg.MODEL.ROI_HEADS.NUM_CLASSES = 1
```

## Saving model

After the GPU has finished the long training process, 
which following lines has been completed:

```python
    trainer = Trainer(cfg)
    trainer.resume_or_load(resume=False)
    trainer.train()
```

A model will save all it's weights & biases under the name "model_final.pth" in the directory "output"

```python
   full_model_path = os.path.join(cfg.OUTPUT_DIR, "model_arrows_keypoint.pth")

   shutil.move(src=os.path.join(cfg.OUTPUT_DIR, "model_final.pth"),
             dst=full_model_path)
```



## Terminology

Term | Description | url
------------|-----|----
 FPN | Feature Pyramid Networks for Object Detection | [Link](http://www.my-website.com)
 RPN |  Region Proposal Network | [Link](https://towardsdatascience.com/region-proposal-network-a-detailed-view-1305c7875853)


## Debugging with pycharm

It seems pycharm is unable to debug parallel programs. you can disable parallel data loading by setting the cfg to:

```python
cfg = get_cfg()
...
cfg.DATALOADER.NUM_WORKERS = 0
````

## Measuring Object Detection models - mAP - What is Mean Average Precision?

[Link](https://tarangshah.com/blog/2018-01-27/what-is-map-understanding-the-statistic-of-choice-for-comparing-object-detection-models/)

## References
[coco-annotator](https://github.com/jsbroks/coco-annotator)
[Detectron2 example with Augemntation](https://towardsdatascience.com/how-to-train-detectron2-on-custom-object-detection-data-be9d1c233e4)
[Digging into Detectron2](https://medium.com/@hirotoschwert/digging-into-detectron-2-47b2e794fabd)
[download the COCO annotation - great reference JSON file](http://images.cocodataset.org/annotations/annotations_trainval2017.zip)