<!--ts-->
   * [Fastai](#fastai)
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
      * [doc](#doc)
      * [Fine-tuning](#fine-tuning)
      * [fast.ai datatsets](#fastai-datatsets)
      * [Download Images](#download-images)
      * [Things that can go wrong](#things-that-can-go-wrong)
      * [Terms](#terms)
      * [Resources](#resources)

<!-- Added by: gil_diy, at: 2020-06-28T07:46+03:00 -->

<!--te-->

# Fastai

## Fastai support 4 topics

1. Vision (Computer vision)

```python
from fastai.vision import *
```

2. Natural language text
2. Tabular data
3. Collabarative filtering

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

* resnet34 has 34 layers
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
or

```python
# using partial functions in python
acc_02 = partial(accuract_thresh, thresh=0.2)
f_score = partial(fbeta, thresh=0.2)
# metrics can be an list of many mrtrics types, ie: [acc_02, error_rate, f_score]
# In kaggle  you're usually get judged by f_score
learn = cnn_learner(data, models.resnet34, metrics = [acc_02, error_rate, f_score])

```

## fit dataset

How many time we show the dataset to the model?
in this example we have ran with 4 epochs:

```python
learn.fit_one_cycle(4)
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
```python
learn.unfreaze()
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

freezing prevents the weights of a neural network layer from being modified during the backward pass of training. You progressively 'lock-in' the weights for each layer to reduce the amount of computation in the backward pass and decrease training time.

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


## Terms

**Learning rate** - the number we multiply our gradient by, to decide how much to update the weights by.

**Epoch** - every single iteration on the entire data set

**Minibatch** - just a random bunch of points that you use to update
your weights.

**SGD** - Stocachstic Gradient Descent using minibatch

**Model/Architecture**
**Parameters**
**Loss functions**

## Resources


[Notebooks code examples from course](https://github.com/fastai/course-v3/tree/master/nbs/dl1)

[Documentation for the API](https://github.com/fastai/fastai/tree/master/docs_src)

[Practical Deep learning for coders 2019](https://www.youtube.com/playlist?list=PLfYUBJiXbdtSIJb-Qd3pw0cqCbkGeS0xn)

[Model Benchmarks](https://dawn.cs.stanford.edu/benchmark/#imagenet-train-time)