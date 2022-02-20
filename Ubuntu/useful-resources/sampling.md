<!--ts-->
   * [Sampling](#sampling)
      * [Probability sampling](#probability-sampling)
      * [Simple Random Sampling](#simple-random-sampling)
      * [Non-probability sampling](#non-probability-sampling)
      * [S](#s)
   * [Obtain a systematic sample and save it in a new variable](#obtain-a-systematic-sample-and-save-it-in-a-new-variable)
      * [Negative sampling](#negative-sampling)
      * [oversampling](#oversampling)

<!-- Added by: gil_diy, at: Sun 20 Feb 2022 16:21:31 IST -->

<!--te-->

# Sampling

## Probability sampling

## Simple Random Sampling

```python
df.sample(n=4).sort_values(by='product_id')
```

## Non-probability sampling

## S

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

## 


## oversampling 
 https://arxiv.org/abs/1710.05381