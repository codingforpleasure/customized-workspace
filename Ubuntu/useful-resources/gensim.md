<!--ts-->
   * [Gensim](#gensim)
      * [word2vec](#word2vec)
         * [Create word2vec represetnation model](#create-word2vec-represetnation-model)
         * [Get word representation as a vector](#get-word-representation-as-a-vector)
         * [Compute Similarities](#compute-similarities)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Mon 14 Feb 2022 09:46:19 IST -->

<!--te-->

# Gensim

## word2vec


There are two main training algorithms for word2vec:

1) CBOW - continuous bag of words

2) skip-gram

The major difference between these two methods is that **CBOW** is using context to predict a target word while skip-gram is using a word to predict a target context.

<p align="center" style="width:400px;" >
  <img src="images/nlp/word2vec.jpg" title="tool tip here">
</p>



### Create word2vec represetnation model
```python
model = Word2Vec(sent, min_count=1,size= 50,workers=3, window =3, sg = 1)
```

**size**: The number of dimensions of the embeddings and the default is 100.

**window**: The maximum distance between a target word and words around the target word. The default window is 5.

**min_count**: The minimum count of words to consider when training the model; words with occurrence less than this count will be ignored. The default for min_count is 5.

**workers** : The number of partitions during training and the default workers is 3.

**sg**: The training algorithm, either CBOW(0) or skip gram(1). The default training algorithm is CBOW.


### Get word representation as a vector 

* After training the word2vec model, we can obtain the word embedding directly from the training model as following.

```python
model['Toyota Camry']
```

### Compute Similarities

This will give us the Euclidian similarity between `Porsche 718 Cayman` and `Nissan Van`:

```python
model.similarity('Porsche 718 Cayman', 'Nissan Van')
```


We also can use the built-in function model.most_similar() to get a set of the **most similar** make models for a given make model based on the Euclidean distance.

```python
model1.most_similar('Mercedes-Benz SLK-Class')[:5]
```

# Reference

[Academic paper](https://arxiv.org/pdf/1301.3781.pdf)