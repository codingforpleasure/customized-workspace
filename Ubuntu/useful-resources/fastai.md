<!--ts-->
   * [Fastai](#fastai)
      * [Downloading dataset](#downloading-dataset)
      * [Save model](#save-model)
      * [Build an interpertation object](#build-an-interpertation-object)
      * [Get confusion matrix](#get-confusion-matrix)
      * [Train our model some more](#train-our-model-some-more)
      * [doc](#doc)
      * [Fine-tuning](#fine-tuning)
      * [Resources](#resources)

<!-- Added by: gil_diy, at: 2020-06-25T17:17+03:00 -->

<!--te-->

# Fastai


## Downloading dataset
```python
untar_data(URLs.PETS)
```



```python
learn = ConvLearner(data, models.resnet34, metrics = error_rate)
```
or

```python
# using partial functions in python
acc_02 = partial(accuract_thresh, thresh=0.2)
f_score = partial(fbeta, thresh=0.2)
# metrics can be an list of many mrtrics types, ie: [acc_02, error_rate, f_score]
# In kaggle  you're usually get judged by f_score
learn = create_cnn(data, models.resnet34, metrics = [acc_02, error_rate, f_score])

```

How many time we show the dataset to the model?
in this example we have ran with 4 epochs:

```python
learn.fit_one_cycle(4)
```


## Get all classes of the data
```python
data.classes
```

## Save model
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
## 
```python
learn.freaze()
```

## Train our model some more
```python
learn.unfreaze()
learn.fit_one_cycle()
learn.load('stage-1')
learn.lr_find() #learning rate find
learn.recorder.plot()
```

## doc
For getting assistance, use **doc(the function you're looking for)**


## Fine-tuning


## fast.ai datatsets

[Link to fastai datasets](https://course.fast.ai/datasets)


## Resources


[Notebooks code examples from course](https://github.com/fastai/course-v3/tree/master/nbs/dl1)

[Practical Deep learning for coders 2019](https://www.youtube.com/playlist?list=PLfYUBJiXbdtSIJb-Qd3pw0cqCbkGeS0xn)

[Benchmarks](https://dawn.cs.stanford.edu/benchmark/#imagenet-train-time)