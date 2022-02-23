<!--ts-->
   * [Sampling](#sampling)
      * [Probability sampling](#probability-sampling)
      * [Simple Random Sampling](#simple-random-sampling)
      * [Non-probability sampling](#non-probability-sampling)
      * [Systematic sampling](#systematic-sampling)
   * [Obtain a systematic sample and save it in a new variable](#obtain-a-systematic-sample-and-save-it-in-a-new-variable)
      * [Negative sampling](#negative-sampling)
      * [oversampling](#oversampling)
      * [Deal with imbalanced datasets](#deal-with-imbalanced-datasets)

<!-- Added by: gil_diy, at: Wed 23 Feb 2022 10:09:50 IST -->

<!--te-->

# Sampling

## Probability sampling

## Simple Random Sampling

```python
df.sample(n=4).sort_values(by='product_id')
```

## Non-probability sampling


## Systematic sampling

The systematic sampling method selects units based on a fixed sampling interval (i.e. every nth unit is selected from a given process or population). This sampling method tends to be more effective than the simple random sampling method.
Define systematic sampling function

```python
def systematic_sampling(df, step):
   indexes = np.arange(0,len(df),step=step)
   systematic_sample = df.iloc[indexes]
   return systematic_sample
``` 
# Obtain a systematic sample and save it in a new variable
systematic_sample = systematic_sampling(df, 3)

## Negative sampling

The Skip-gram model works in a way that, given an input, it predicts the surrounding or context words. Using this method, we can learn a hidden layer that we’ll use to calculate **how probable a word is to occur as the context of the input**:

<p align="center">
  <img width="400" src="images/nlp/skipgram.jpg" title="Look into the image">
</p>

The Skip-gram model for training word vectors and learned about how negative sampling is used for this purpose. In order to **reduce the computational cost of the softmax function which is done over the entire vocabulary**, we can approximate this function by only drawing a few examples from the set of samples that do not appear in the context of the main word.


## oversampling 
 https://arxiv.org/abs/1710.05381


 ## Deal with imbalanced datasets

 Resampling with `sklearn.resample` upsampling the minority class or downsampling the majority class.