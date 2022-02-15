<!--ts-->
   * [NLP](#nlp)
      * [Well known libraries in NLP](#well-known-libraries-in-nlp)
      * [Topic Discovery](#topic-discovery)
         * [LDA - Latent Dirichlet Allocation](#lda---latent-dirichlet-allocation)
      * [Preprocessing](#preprocessing)
         * [Stemming](#stemming)
         * [Lemmatiziation](#lemmatiziation)
         * [Bag of Words](#bag-of-words)
            * [Drawbacks](#drawbacks)
         * [TFIDF](#tfidf)
            * [Drawbacks](#drawbacks-1)
         * [Word Embedding](#word-embedding)
            * [1. Word2Vec Embedding](#1-word2vec-embedding)
               * [Drawbacks](#drawbacks-2)
            * [2. GloVe Embedding (Global Vector)](#2-glove-embedding-global-vector)
            * [3. FastText Embedding (Brought by Facebook)](#3-fasttext-embedding-brought-by-facebook)
            * [4. ELMo - Embedding from Language Model (Brought by ALLenNLP)](#4-elmo---embedding-from-language-model-brought-by-allennlp)
            * [Limitation of word Embeddings](#limitation-of-word-embeddings)
      * [BERT (Bidirectional Encoder Representation from Transformer)](#bert-bidirectional-encoder-representation-from-transformer)
      * [Cleaning methods](#cleaning-methods)

<!-- Added by: gil_diy, at: Tue 15 Feb 2022 11:08:41 IST -->

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

#### Drawbacks

* **Semantic information is not stored**, which means the context/order of a word appears in a sentence is not taken into account.

* There is definitely a chance of over fitting

### TFIDF

#### Drawbacks

* **Semantic information is not stored**, which means the context/order of a word appears in a sentence is not taken into account.

* There is definitely a chance of over fitting


### Word Embedding 

Word embedding which is n-dimensional vector space representation of words such that semantically similar words:

* for instance, **“boat” — “ship”**

* Semantically related words (for instance, **“boat” — “water”**) 

are closer in the vector space depending on the training data.

#### 1. Word2Vec Embedding


* Word2vec is a group of related models that are used to produce word embeddings

* Word2vec takes as its input a large corpus of text and produces a vector space, typically of several hundred dimensions, with each unique word in the corpus being assigned a corresponding vector in the space


* Word2vec can utilize either of two model architectures to produce a distributed representation of words: 

      **(1)** continuous bag-of-words (CBOW) 

      **(2)** continuous skip-gram


<p style="width:500px; text-align:center " >
  <img src="images/nlp/word2vec.jpg" title="tool tip here">
</p>

```python
model = Word2Vec(sent, min_count=1,size= 50,workers=3, window =3, sg = 1) # sg = skip-gram
```


##### Drawbacks

* Is context-free model, which generate **static embeddings irrespective of the context**.


#### 2. GloVe Embedding (Global Vector)

#### 3. FastText Embedding (Brought by Facebook)

The main disadvantages of **Word2Vec** and **GloVe** embedding is that they are unable to **encode unknown or out-of-vocabulary words**.

Word2Vec which feeds whole words into the neural network, FastText first breaks the words into several sub-words (or n-grams) and then feed them into the neural network.

#### 4. ELMo - Embedding from Language Model (Brought by ALLenNLP)

Character-level tokens are taken as the inputs to a bi-directional LSTM which produces word-level embeddings. 
Like BERT (but unlike the word embeddings produced by "Bag of Words" approaches, and earlier vector approaches such as Word2Vec and GloVe)


* ELMo embeddings are **context-sensitive**

* ELMo produces different representations for words that share the same spelling but have different meanings, ie:
  such as "bank" in **"river bank"** and **"bank balance"**

#### Limitation of word Embeddings

they don’t take into consideration the order of words in which they appear which leads to loss of syntactic and semantic understanding of the sentence.



## BERT (Bidirectional Encoder Representation from Transformer)

`BERT` generates **dynamic embeddings** based on the context.

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
context and always give the same embedding for the word `Python` irrespective of the context.


**BERT**, on the other hand, is a **context-based model**. It will understand the context and then
generate the embedding for the word based on the context. So, for the preceding two
sentences, it will give different embeddings for the word 'Python' based on the context.

* The encoder of the transformer is bidirectional in nature since it can read a sentence in both directions. 


## Cleaning methods

```python
def text_cleaning(texts):
    texts_cleaning = []
    for txt in tqdm(texts):
        url = re.compile(r'https?://\S+|www\.\S+')
        html = re.compile(r'<.*?>')
        emoji_pattern = re.compile("["
                               u"\U0001F600-\U0001F64F"  # emoticons
                               u"\U0001F300-\U0001F5FF"  # symbols & pictographs
                               u"\U0001F680-\U0001F6FF"  # transport & map symbols
                               u"\U0001F1E0-\U0001F1FF"  # flags (iOS)
                               u"\U00002702-\U000027B0"
                               u"\U000024C2-\U0001F251"
                               "]+", flags=re.UNICODE)
        txt = emoji_pattern.sub(r'', txt)
        txt = html.sub(r'',txt)
        txt = url.sub(r'',txt)
        txt = re.sub('[^A-Za-z\s]', '', txt)
        
        texts_cleaning.append(txt.lower())
    return texts_cleaning
text = text_cleaning(train.text.tolist())
```