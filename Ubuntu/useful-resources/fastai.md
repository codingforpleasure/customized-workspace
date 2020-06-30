<!--ts-->
   * [Fastai](#fastai)
      * [Courses of Fastai](#courses-of-fastai)
      * [Fastai support 4 topics](#fastai-support-4-topics)
      * [Downloading dataset](#downloading-dataset)
      * [See the image files](#see-the-image-files)
      * [Creating databunch (training set, validation set, test set)](#creating-databunch-training-set-validation-set-test-set)
      * [Creating databunch from images and csv file](#creating-databunch-from-images-and-csv-file)
      * [Look at your actual data images](#look-at-your-actual-data-images)
      * [Get all classes of the data](#get-all-classes-of-the-data)
      * [Augmentation](#augmentation)
      * [Training](#training)
         * [Using resnet34](#using-resnet34)
      * [creating the CNN](#creating-the-cnn)
      * [fit dataset](#fit-dataset)
      * [Save model](#save-model)
      * [Build an interpertation object](#build-an-interpertation-object)
      * [Get confusion matrix](#get-confusion-matrix)
      * [Train our model some more](#train-our-model-some-more)
      * [Freeze](#freeze)
      * [Unfreeze](#unfreeze)
      * [doc](#doc)
      * [Fine-tuning](#fine-tuning)
      * [fast.ai datatsets](#fastai-datatsets)
      * [Download Images](#download-images)
      * [Things that can go wrong](#things-that-can-go-wrong)
      * [Running in conda](#running-in-conda)
      * [Terms](#terms)
      * [What is U-Net? For image segementation](#what-is-u-net-for-image-segementation)
      * [What is the difference between Object Detection vs Object Recognition vs Image Segmentation?](#what-is-the-difference-between-object-detection-vs-object-recognition-vs-image-segmentation)
      * [Five steps to avoiding overfitting:](#five-steps-to-avoiding-overfitting)
      * [Python debugger](#python-debugger)
      * [Terms in the first course:](#terms-in-the-first-course)
         * [Affine functions &amp; non-linearities](#affine-functions--non-linearities)
         * [Parameters &amp; Activations](#parameters--activations)
         * [Random init &amp; transfer learning](#random-init--transfer-learning)
         * [Convolutions](#convolutions)
         * [Batch-norm](#batch-norm)
         * [Dropout](#dropout)
         * [Data-Augumentation](#data-augumentation)
         * [Weight decay](#weight-decay)
         * [Res/dense blocks](#resdense-blocks)
         * [Image classification and regression](#image-classification-and-regression)
         * [Embeddings](#embeddings)
         * [Continuos &amp; Categorical Variables](#continuos--categorical-variables)
         * [Collaborative filtering](#collaborative-filtering)
         * [Lanaguge Models; NLP classification](#lanaguge-models-nlp-classification)
         * [Segmentation; U-net; GANS](#segmentation-u-net-gans)
      * [Resources](#resources)

<!-- Added by: gil_diy, at: 2020-06-30T15:21+03:00 -->

<!--te-->

# Fastai

## Courses of Fastai

* Course 2019 Beginner  - 7 Lessons about FastAI 
[Practical Deep Learning for Coders 2019](https://www.youtube.com/playlist?list=PLfYUBJiXbdtSIJb-Qd3pw0cqCbkGeS0xn)

* Course 2018 Advance - 
[Cutting Edge Deep Learning for Coders 2](https://www.youtube.com/playlist?list=PLfYUBJiXbdtTttBGq-u2zeY1OTjs5e-Ia)


* Course 2019/2020 Advance  - 
[Deep Learning from the Foundations](https://www.youtube.com/playlist?list=PLfYUBJiXbdtTIdtE1U8qgyxo4Jy2Y91uj)

## Fastai support 4 topics

1. Vision (Computer vision)

```python
from fastai.vision import *
```

2. Natural language text

```python
from fastai.text import *
```

3. Tabular data
4. Collabarative filtering
5. Fast.ai Audio

```python
from fastai.audio import *
```




## Downloading dataset
```python
path = untar_data(URLs.PETS)
path.ls()
path_anno = path/'annotations'
path_img = path/'images'
```

## See the image files 
```python
fnames = get_image_files(path_img)
fnames[:5]
```

## Creating databunch (training set, validation set, test set)
How we get the labels?
sometimes we can notice the labels are actual the filenames.
Therefore we will use regular expressions.

```python
my_pattern = r'/([^/]+)_\d+.jpg$'
data = ImageDataBunch.from_name_re(path_img,
									fnames, 
									my_pattern, # the pattern to extract the labels from the filenames
									ds_tfms = get_transforms(),
									size = 224 # set image size 224X224
									)

# Normalizing our data, usually mean of zero and stardard deviation of 1.
data.normalize(imagenet_stats) 
```

In case the directory hierarchy folders' names are the labels:
Just use from_folder:

for example the mnist dataset:

```python
tfms = get_transforms(do_flip = False)
data = ImageDataBunch.from_folder(path,
									ds_tfms = tfms,
									size = 26
								  )
```


* In case of memory shortage please use different bs (batch size).


## Creating databunch from images and csv file

```python
tfms = get_transforms(flip_vert = True,
					max_lightning = 0.1,
					max_zooming = 1.05,
					max_warp = 0.
					)

np.random.seed(42)
src = (ImageFileList.from_folder()
		.label_from_csv('train_v2.csv',sep='',folder = 'train-jpg',suffix = '.jpg')
		.random_split_but_pct(0.2) # split by percent
	)

data = (src.datasets()
		.transform(tfms, size=128)
		.databunch().normalize(imagenet_stats)
		)
```

Here is an example of the data block API, all the stages, which will be explained below, can be grouped together like this:

```python
data = (ImageList.from_folder(path) #Where to find the data? -> in path and its subfolders
        .split_by_folder()              #How to split in train/valid? -> use the folders
        .label_from_folder()            #How to label? -> depending on the folder of the filenames
        .add_test_folder()              #Optionally add a test set (here default name is test)
        .transform(tfms, size=64)       #Data augmentation? -> use tfms with a size of 64
        .databunch())                   #Finally? -> use the defaults for conversion to ImageDataBunch
```

[Reference](https://github.com/fastai/fastai/blob/master/docs_src/data_block.ipynb)

## Look at your actual data images
```python
data.show_batch(rows = 3, figsize = (7, 6))
```

## Get all classes of the data
```python
print(data.classes)
print(len(data.classes))
print(data.c)
```


## Augmentation 

please remember that all type of transfromations are enabled by default and numerical values consist of their values.

So if would like to avoid flip, just write:
`get_transforms(do_flip=False)`

[Link](https://docs.fast.ai/vision.transform.html)

tfms = get_transforms()


## Training

### Using resnet34

* resnet34 has 34 layers with last layer holds 1000 
  because Imagenet requested to classify into 1000 categories.

* resnet50 has 50 layers

```python
# It will download the pretrianed model with weights in the model of resnet
# We start from a model which recognize images already, but fromthere we 
# improve it. 
# It is based on transfer learning how to take a model that know to do 
# soemthing quite well and make it so that it can do your thing really well.
learn = ConvLearner(data, models.resnet34, metrics = error_rate)
```

## creating the CNN

```python
# using partial functions in python
acc_02 = partial(accuract_thresh, thresh=0.2)
f_score = partial(fbeta, thresh=0.2)

# metrics can be a list of many metrics types, ie: [acc_02, error_rate, f_score]
# In kaggle  you're usually get judged by f_score
# in fastai under the hood it throws the last layer, cause there is no need to 1000 categories and replace it with a matrix of size according to thr number of classes you have in your dataset
learn = cnn_learner(data, models.resnet34, metrics = [acc_02, error_rate, f_score])

```

## fit dataset

How many time we show the dataset to the model?
in this example we have ran with 4 epochs:

```python
learn.fit_one_cycle(4)
```

Specifying the learning rate (second argument):

```python
# First case:
# With single number `1e-3` means every layer gets the same learning rate.
learn.fit_one_cycle(4, 1e-3)

# Second case:
# The final layers get the learning rate 1e-3
# the rest layers get a learning rate of (1e-3)/3
learn.fit_one_cycle(4, slice(1e-3))


# third case:
# The final layers get the learning rate 1e-3
# the first layers get a learning rate of 1e-5
# the rest layers get a learning rate of equally spread between first learning rate to the last layer learning rate.
learn.fit_one_cycle(4, slice(1e-5,1e-3))
```


## Save model 
Saving the weights:
```python
learn.save('stage-1')
```


## Build an interpertation object
**top losses** means where the model was most confident but has done a mistake.
```python
interp = ClassificationInterpretation.from_learner(learn)
interp.plot_top_losses(9, figsize = (15,11))
```

## Get confusion matrix

```python
interp.plot_confusion_matrix(figsize = (12,12), dpi=60)
# Will grab from the confusion matrix the combination of the actual 
# and got wrong image which appeared the most often.
interp.most_confused(min_val = 2)
```


## Train our model some more

**First layer:** One of the filters was finding diagonal edges
**Second layer:** One of the filters was finding corners in the top left
**Third layer:** One of the filters was finding round orange things

**In cnn as we go towards the last layer it is becoming more spohisticated and more specific**

```python
learn.unfreeze()
learn.fit_one_cycle()
learn.load('stage-1')

# Learning rate find
# X axis is the learning rate,
# Y axis describes the Loss

learn.lr_find() 
learn.recorder.plot()
```

You can easily see the learning rate while running the
function **fit_one_cycle** 0.003.


* Rule of thumbs use lr.find for getting the first value for the slice function. the second value should be larger in about by 100.

```python
learn.unfreaze()
learn.fit_one_cycle(2, max_lr = slice(1e-6, 1e-4))
```

## Freeze

Freezing prevents the weights of a neural network layer from being modified during the backward pass of training. You progressively 'lock-in' the weights for each layer to reduce the amount of computation in the backward pass and decrease training time.

We ask FastAI and Pytorch, So when we train don't (backproporgate the gradients into those first layers) which means Don't  recalculate the weights of the first layers only calculate to the new layers.


## Unfreeze

unfreeze a model if you decide you want to continue training - an example of this is transfer learning: start with a pre-trained model, unfreeze the weights, then continuing training on a different dataset

## doc
For getting assistance, use **doc(the function you're looking for)**


## Fine-tuning


## fast.ai datatsets

[Link to fastai datasets](https://course.fast.ai/datasets)


## Download Images

In fastai there is an existing function with given file path it will download the images.

```python
download_images(path/file, dest, max_pics = 200, max_workers = 0)
```


## Things that can go wrong

side effects | concolusion
------------|-----
**validation loss** gets very high | The learning rate is too high
**training loss** is higher than **validation loss** | The learning rate is too low
**training loss** is higher than **validation loss** | Too few epochs

```python
# You can plot the training loss with the validation loss
learn.recorder.plot_losses()
```

[Reference explained well](https://youtu.be/ccMHJeQU4Qw?list=PLfYUBJiXbdtSIJb-Qd3pw0cqCbkGeS0xn&t=2813)

```python
# Plot the learning rate
learn.recorder.plot_lr()
```
[Nice demo](https://nbviewer.jupyter.org/gist/joshfp/85d96f07aaa5f4d2c9eb47956ccdcc88/lesson2-sgd-in-action.ipynb)

## Running in conda

```bash
conda activate fastai

jupyter-notebook
```

## Terms

**Learning rate** - the number we multiply our gradient by, to decide how much to update the weights by.

**Epoch** - every single iteration on the entire data set

**Minibatch** - just a random bunch of points that you use to update
your weights.

**SGD** - Stocachstic Gradient Descent using minibatch

**Model/Architecture**
**Parameters**
**Loss functions**


## What is U-Net? For image segementation

[Link](https://youtu.be/nG3tT31nPmQ?t=6230)


## What is the difference between Object Detection vs Object Recognition vs Image Segmentation?

[Great Explanation](https://www.geeksforgeeks.org/object-detection-vs-object-recognition-vs-image-segmentation/)

## Five steps to avoiding overfitting:

More data -> Data augemtation -> Generlizeble architecture -> Regularization -> Reduce architecture complexity.


[Link](https://youtu.be/4u8FxNEDUeg?t=1335)

## Python debugger

[Link](https://youtu.be/Z0ssNAbe81M?t=6194)

```Python
if i == 13
	pdb.set_trace()
```

 command | Description
------------|-----
 l | list
 c | continue
 n | next
 p | print
 s | step into
 u | show call stack up
 d | show call stack down

If there was a crash you can write in a new cell:

`%debug`
## Terms in the first course:

[Link](https://youtu.be/4u8FxNEDUeg?t=1248)

### Affine functions & non-linearities
### Parameters & Activations
### Random init & transfer learning
### Convolutions
### Batch-norm
### Dropout
### Data-Augumentation
### Weight decay
### Res/dense blocks
### Image classification and regression
### Embeddings
### Continuos & Categorical Variables
### Collaborative filtering
### Lanaguge Models; NLP classification
### Segmentation; U-net; GANS



## Resources

[Notebooks code examples from course](https://github.com/fastai/course-v3/tree/master/nbs/dl1)

[Documentation for the API](https://github.com/fastai/fastai/tree/master/docs_src)

[Practical Deep learning for coders 2019](https://www.youtube.com/playlist?list=PLfYUBJiXbdtSIJb-Qd3pw0cqCbkGeS0xn)

[Model Benchmarks](https://dawn.cs.stanford.edu/benchmark/#imagenet-train-time)

[Fastai Share your work ](https://forums.fast.ai/search?q=share%20your%20work)


