<!--ts-->
   * [Gensim](#gensim)
      * [word2vec](#word2vec)

<!-- Added by: gil_diy, at: Mon 14 Feb 2022 09:19:32 IST -->

<!--te-->

# Gensim

## word2vec


<p align="center"> <!-- style="width:400px;" -->
  <img src="images/nlp/word2vec.jpg" title="tool tip here">
</p>

```python
model = Word2Vec(sent, min_count=1,size= 50,workers=3, window =3, sg = 1)
```

**size**: The number of dimensions of the embeddings and the default is 100.

**window**: The maximum distance between a target word and words around the target word. The default window is 5.

**min_count**: The minimum count of words to consider when training the model; words with occurrence less than this count will be ignored. The default for min_count is 5.

**workers** : The number of partitions during training and the default workers is 3.

sg: The training algorithm, either CBOW(0) or skip gram(1). The default training algorithm is CBOW.