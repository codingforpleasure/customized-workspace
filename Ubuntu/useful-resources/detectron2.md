<!--ts-->


<!-- Added by: gil_diy, at: 2020-10-11T03:32+03:00 -->

<!--te-->


# Detectron

## Instance detection

## Instance
## Semantic
## Panoptic segmentation
## Keypoint detection



## How to install Detectron2

[Link](https://detectron2.readthedocs.io/tutorials/install.html)

## Coco file annotation format:

[Link](
https://detectron2.readthedocs.io/tutorials/datasets.html#standard-dataset-dicts)


### config 

[Link](https://github.com/facebookresearch/detectron2/tree/master/configs)

##
```
from detectron2 import model_zoo

model_zoo.get_config_file
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

## loading model
```python
from detectron2.checkpoint import DetectionCheckpointer
DetectionCheckpointer(model).load(file_path_or_url)
```

## Saving model
```python
checkpointer = DetectionCheckpointer(model, save_dir="output")
checkpointer.save("model_999")  # save to output/model_999.pth
```


## Terminology

Term | Description | url
------------|-----|----
 FPN | Feature Pyramid Networks for Object Detection | [Link](http://www.my-website.com)
 RPN |  Region Proposal Network | [Link](https://towardsdatascience.com/region-proposal-network-a-detailed-view-1305c7875853)


## References
[coco-annotator](https://github.com/jsbroks/coco-annotator)
[Detectron2 example with Augemntation](https://towardsdatascience.com/how-to-train-detectron2-on-custom-object-detection-data-be9d1c233e4)
[Digging into Detectron2](https://medium.com/@hirotoschwert/digging-into-detectron-2-47b2e794fabd)