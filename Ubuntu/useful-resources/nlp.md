<!--ts-->
   * [NLP](#nlp)
      * [Well known libraries in NLP](#well-known-libraries-in-nlp)
      * [Topic Discovery](#topic-discovery)
         * [LDA - Latent Dirichlet Allocation](#lda---latent-dirichlet-allocation)
      * [Preprocessing](#preprocessing)
         * [Stemming](#stemming)
         * [Lemmatiziation](#lemmatiziation)
         * [Bag of Words](#bag-of-words)
         * [TFIDF](#tfidf)
         * [Word2Vec](#word2vec)
      * [BERT](#bert)

<!-- Added by: gil_diy, at: Mon 14 Feb 2022 14:30:20 IST -->

<!--te-->

# NLP 

## Well known libraries in NLP

* NLTK
* Spacy
* [Gensim](https://github.com/RaRe-Technologies/gensim)


[look into it](https://youtu.be/m20_dfn6tsU)


## Topic Discovery

Is to discover topics in a collection of documents, and then automatically **classify** any individual document within the collection in terms of how "relevant" it is to each of the discovered topics.


**For example:**

* In a document collection related to pet animals, the terms dog, spaniel, beagle, golden retriever, puppy, bark, and woof would suggest a DOG_related theme.

* Terms cat, siamese, main coon, tabby, manx, meow, purr, and kitten would suggest a CAT_related theme.

### LDA - Latent Dirichlet Allocation

[Link1](https://youtu.be/T05t-SqKArY)


[Training Latent Dirichlet Allocation: Gibbs Sampling](https://youtu.be/BaM1uiCpj_E)


## Preprocessing

### Stemming

The problem using stemming it produces **intermediate representation of the word may not have any meaning**. 

**Example:** 

`intelligent` gets converted into `intelligen`

`final` gets converted into `fina`

### Lemmatiziation


### Bag of Words


You can use either: 
```python
from sklearn.feature_extraction.text import CountVectorizer
```

or 

```python
from gensim import corpora
...
dictionary = corpora.Dictionary(processed_corpus)
dictionary.doc2bow(text)
```
### TFIDF

### Word2Vec

The drawbacks in BOW and TFIDF is:
* **Semantic information is not stored**, which means the context/order of a word appears in a sentence is not taken into account.

* There is definitely a chance of over fitting


The drawbacks of `Word2Vec` which we have mentioned before is:

* Is conetxt-free model, which generate static embeddings irrespective of the context.

## BERT 

`BERT` generates dynamic embeddings based on the context.

Gor example:

**Sentence A**: He got bit by Python

**Sentence B**: Python is my favorite programming language

By reading the preceding two sentences, we can understand that the meaning of the words `Python`
is different in both sentences. 

In sentence A, the word `Python` refers to a snake.

In sentence B, the word `Python` refers to a Programming language.

if we get embeddings for the word `Python` in the preceding two sentences using an
embedding model such as **word2vec**, the embedding of the word `Python` would be the
same in both sentences, and so this renders the meaning of the word `Python` the same in
both sentences. 
This is because word2vec is the **context-free** model, so it will ignore the
context and always give the same embedding for the word `Python` irrespective of the
context.


BERT, on the other hand, is a context-based model. It will understand the context and then
generate the embedding for the word based on the context. So, for the preceding two
sentences, it will give different embeddings for the word 'Python' based on the context.

