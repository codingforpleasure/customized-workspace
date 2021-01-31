<!--ts-->
   * [YOLO](#yolo)
      * [The format of the text file is:](#the-format-of-the-text-file-is)
      * [See List of all classes pretrianed in yolov5](#see-list-of-all-classes-pretrianed-in-yolov5)
      * [Training](#training)
         * [Start training](#start-training)
            * [From scratch:](#from-scratch)
            * [From pretrained weights:](#from-pretrained-weights)
         * [Image and labels directory structure](#image-and-labels-directory-structure)
      * [Detection (Prediction)](#detection-prediction)
         * [Filter many classes except some few builtin classes:](#filter-many-classes-except-some-few-builtin-classes)
         * [Get the bounding box of each frame:](#get-the-bounding-box-of-each-frame)
         * [Using your own model for detecting (after doing your own training)](#using-your-own-model-for-detecting-after-doing-your-own-training)
         * [Accuracy with Yolo](#accuracy-with-yolo)
         * [Hyperparamaters and Augmentations:](#hyperparamaters-and-augmentations)
         * [Yolov5 crashes, what to do?](#yolov5-crashes-what-to-do)
         * [Avoid disconnections of Google colab after training for some time](#avoid-disconnections-of-google-colab-after-training-for-some-time)
         * [Detection options](#detection-options)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: Sat Nov 21 20:43:44 IST 2020 -->

<!--te-->


#  YOLO


The actual classes names appear in the file: `coco.names`


## The format of the text file is:

```
<class number> <Cx> <Cy> <Width> <Height>
```

[Documentation - Well explained steps](https://github.com/AlexeyAB/darknet#how-to-train-to-detect-your-custom-objects)




## See List of all classes pretrianed in yolov5

```bash
cat ./yolov5/data/coco.yaml
```

## Training 

### Start training

#### From scratch:


```bash
python ./train.py --img 1024 --batch 16 --epochs 100 --data wheat_gdrive.yaml --cfg models/yolov5s.yaml --name wheat_model
```

It will use the default hyperparameters which appear here: `yolov5/data/hyp.scratch.yaml`

#### From pretrained weights:

Using pretrained YOLOv5s:

```bash
python ./train.py --img 1024 --batch 16 --epochs 100 --data wheat_gdrive.yaml --cfg models/yolov5s.yaml --name wheat_model --weights yolov5s.pt
```

the name will appear as the directory in: `./runs/exp____`

Int the **yaml** file in the example: **wheat_gdrive.yaml** is written the actual path for both **training set** and **validation set** :

```yaml

train: /content/drive/My Drive/Colab_Notebooks/datasets/yolov5/wheat_data_generated/images/train
val: /content/drive/My Drive/Colab_Notebooks/datasets/yolov5/wheat_data_generated/images/validation
nc: 4
names: ["class_name1",
        "class_name2",
        "class_name2",
        "class_name3"]
```

### Image and labels directory structure

**Good practice will be** split the dataset into:

*  **70% Training** 

* **20% Validation**

* **10% Testing**

Now we focus only for building a model with the **Training** and **Validation** :

<p> <!-- style="width:400px;" -->
  <img src="images/yolo/file_hierarchy_structure.jpeg" title="tool tip here">
</p>

Afterwards we will use the **Testing set** for checking accuracy.



## Detection (Prediction)

### Filter many classes except some few builtin classes:

lets say I would like to detect only 'car', therfore i would write:

```bash
python detect.py --source ./Before.mp4 --classes 2
```

Car is class number 2, it can be seen from coco.yaml


### Get the bounding box of each frame:

Use the `--save-txt`

```bash
python detect.py --source ./Before.mp4 --save-txt
```

### Using your own model for detecting (after doing your own training)


```bash
MODEL_FULL_PATH="./runs/exp22_mazda_fronts/weights/best.pt"

python detect.py --source ./test_set --weights $MODEL_FULL_PATH
```


### Accuracy with Yolo

* object confidence threshold
* IOU threshold for NMS ([url](https://www.pyimagesearch.com/2016/11/07/intersection-over-union-iou-for-object-detection/))

### Hyperparamaters and Augmentations:

In file: `data/hyp.scratch.yaml`


### Yolov5 crashes, what to do?

Step 1: Read logs here:
```bash
!cat /var/log/colab-jupyter.log
```

Step 2: Very important clean all the cache files (Both train.cache, valid.cache)

Step 3: Don't put prints in google colab in training it will freeze your browser and crash.

### Avoid disconnections of Google colab after training for some time

In the console run:

```
function ClickConnect() {
  console.log('Working')
  document
    .querySelector('#top-toolbar > colab-connect-button')
    .shadowRoot.querySelector('#connect')
    .click()
}

setInterval(ClickConnect, 60000)
```

### Detection options

Option | Description
------------|-----
--max-bbox | Take only the maximum bbox
--crop-to-bbox | crop the bbox
--txt-for-future-training | create annotation with the following format: class_number , x_center , y_center , width height 





## Reference

[Yolo5 Train Custom Data](https://github.com/ultralytics/yolov5/wiki/Train-Custom-Data)

[Guide for Hyperparameter Evolution](https://github.com/ultralytics/yolov5/issues/607)

[Darknet/YOLO](https://pjreddie.com/darknet/)

[Github YOLO creator](https://github.com/pjreddie)

[YOLO demo](https://robocademy.com/2020/05/01/a-gentle-introduction-to-yolo-v4-for-object-detection-in-ubuntu-20-04/)

[Yolo v3 explained very well](https://towardsdatascience.com/yolo-v3-object-detection-53fb7d3bfe6b)


Here below is a link for a convienient way **to get various backgrounds** for the images:
[Describable Texture Dataset](https://www.robots.ox.ac.uk/~vgg/data/dtd/)

[python library for augmenting images](https://github.com/aleju/imgaug)

[Labelimg](https://github.com/tzutalin/labelImg)