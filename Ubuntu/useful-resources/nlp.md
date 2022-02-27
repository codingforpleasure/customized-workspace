<!--ts-->
   * [NLP](#nlp)
      * [Well known libraries in NLP](#well-known-libraries-in-nlp)
      * [NLP Tasks](#nlp-tasks)
      * [Topic Discovery](#topic-discovery)
         * [LDA - Latent Dirichlet Allocation](#lda---latent-dirichlet-allocation)
      * [Preprocessing](#preprocessing)
         * [Basics](#basics)
         * [Stemming](#stemming)
         * [Lemmatiziation](#lemmatiziation)
         * [Bag of Words](#bag-of-words)
            * [Drawbacks](#drawbacks)
         * [TFIDF](#tfidf)
            * [Drawbacks](#drawbacks-1)
         * [Word Embedding](#word-embedding)
            * [1. Word2Vec Embedding](#1-word2vec-embedding)
               * [Drawbacks](#drawbacks-2)
            * [2. GloVe Embedding (Global Vector for Word Representation)](#2-glove-embedding-global-vector-for-word-representation)
            * [3. FastText Embedding (Brought by Facebook)](#3-fasttext-embedding-brought-by-facebook)
            * [Limitation of word Embeddings until here](#limitation-of-word-embeddings-until-here)
            * [4. ELMo - Embedding from Language Model (Brought by ALLenNLP)](#4-elmo---embedding-from-language-model-brought-by-allennlp)
      * [Transformer](#transformer)
         * [Positional encoding (position embeddings)](#positional-encoding-position-embeddings)
         * [Position-wise Feed-Forward Network](#position-wise-feed-forward-network)
      * [BERT (Bidirectional Encoder Representation from Transformer)](#bert-bidirectional-encoder-representation-from-transformer)
         * [Finetuning BERT to downstream tasks](#finetuning-bert-to-downstream-tasks)
            * [Text classification](#text-classification)
            * [Natural language inference](#natural-language-inference)
         * [NER (Named Entity Recognition)](#ner-named-entity-recognition)
         * [Question-answering](#question-answering)
      * [BERT Varients](#bert-varients)
         * [ALBERT (A Lite version of BERT)](#albert-a-lite-version-of-bert)
         * [RoBERT](#robert)
         * [ELECTRA](#electra)
         * [SpanBERT](#spanbert)
         * [Sentence-BERT](#sentence-bert)
            * [Sentence-BERT with a triplet network](#sentence-bert-with-a-triplet-network)
         * [Bert with pytorch](#bert-with-pytorch)
         * [Drawbacks](#drawbacks-3)
      * [Cleaning methods](#cleaning-methods)
      * [Word Cloud](#word-cloud)
      * [Data Augmentation for NLP](#data-augmentation-for-nlp)
      * [10 Leading Language Models For NLP In 2021](#10-leading-language-models-for-nlp-in-2021)

<!-- Added by: gil_diy, at: Sun 27 Feb 2022 17:56:19 IST -->

<!--te-->

# NLP 

## Well known libraries in NLP

* NLTK
* Spacy
* [Gensim](https://github.com/RaRe-Technologies/gensim)


[look into it](https://youtu.be/m20_dfn6tsU)

## NLP Tasks

* Text classification

* Next sentence prediction

* Named-Entity-Recognition (NER)

* Question-Answering



## Topic Discovery

Is to discover topics in a collection of documents, and then automatically **classify** any individual document within the collection in terms of how "relevant" it is to each of the discovered topics.


**For example:**

* In a document collection related to pet animals, the terms dog, spaniel, beagle, golden retriever, puppy, bark, and woof would suggest a DOG_related theme.

* Terms cat, siamese, main coon, tabby, manx, meow, purr, and kitten would suggest a CAT_related theme.

### LDA - Latent Dirichlet Allocation

[Link1](https://youtu.be/T05t-SqKArY)


[Training Latent Dirichlet Allocation: Gibbs Sampling](https://youtu.be/BaM1uiCpj_E)


## Preprocessing

### Basics

1. Lowercase

2. Remove emails

3. Remove html tags

4. Remove emojis

5. Remove stopwords


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

Is a numerical statistic that is intended to reflect how important a word is to a document in a collection or corpus:

1) The tf–idf is the product of two statistics, term frequency and inverse document frequency.
   There are various ways for determining the exact values of both statistics.

2) A formula that aims to define the importance of a keyword or phrase within a document or a web page.

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

* Word2vec takes as its input a large corpus of text and produces a vector space, typically of several hundred dimensions, with each unique word in the corpus being assigned a corresponding vector in the space.

* When you train such a model over billions of tokens over a large dataset containing web articles and so forth,
what you get is a very potent representation of each word in the vocabulary in the form of a vector. These vectors can be 300 dimensions long, i.e. each word is represented by 300 real numbers.


* Word2vec can utilize either of two model architectures to produce a distributed representation of words: 

      **(1)** continuous bag-of-words (CBOW) 

      **(2)** continuous skip-gram


<p style="width:500px; text-align:center " >
  <img src="images/nlp/word2vec.jpg" title="tool tip here">
</p>

```python
model = Word2Vec(sent, min_count=1,size= 50,workers=3, window =3, sg = 1) # sg = skip-gram
```

[Word2Vec in Gensim](https://radimrehurek.com/gensim/models/word2vec.html)

##### Drawbacks

* Is context-free model, which generate **static embeddings irrespective of the context**.


#### 2. GloVe Embedding (Global Vector for Word Representation)

Belongs to Stanford (2016), training is **performed on aggregated global word-word co-occurrence statistics from a corpus**, and the resulting representations showcase interesting linear substructures of **the word vector space**. 


[Github](https://github.com/stanfordnlp/GloVe)


[Link](https://nlp.stanford.edu/projects/glove/)

#### 3. FastText Embedding (Brought by Facebook)

The main disadvantages of **Word2Vec** and **GloVe** embedding is that they are unable to **encode unknown or out-of-vocabulary words**.

Word2Vec which feeds whole words into the neural network, FastText first breaks the words into several sub-words (or n-grams) and then feed them into the neural network.

* Starts with word representations that are averaged into text representation and feed them to a linear classifier (multinomial logistic regression).

* Hierarchial Softmax: Based on Huffman Coding Tree Used to reduce computational complexity O(kh) to O(hlog(k)), where k is the number of classes and h is dimension of text representation.

* Uses a bag of n-grams to maintain efficiency without losing accuracy. No explicit use of word order.

* Uses hashing trick to maintain fast and memory efficient mapping of the n-grams.

#### Limitation of word Embeddings until here

They don’t take into consideration the order of words in which they appear which leads to loss of syntactic and semantic understanding of the sentence.


#### 4. ELMo - Embedding from Language Model (Brought by ALLenNLP)

Character-level tokens are taken as the inputs to a **bi-directional LSTM which produces word-level embeddings**. 
Like BERT (but unlike the word embeddings produced by "Bag of Words" approaches, and earlier vector approaches such as Word2Vec and GloVe)


* ELMo embeddings are **context-sensitive**

* ELMo produces **different representations for words that share the same spelling** but have different meanings, ie:
  such as "bank" in **"river bank"** and **"bank balance"**

* As the ELMo **uses bidirectional LSTM** it can get understanding of both **next and previous word** in the sentence.


## Transformer

* Transformer replaces the **recurrent layers** in seq2seq with **attention layers**.

<p align="center">
  <img width="400" src="images/transformers/transformer_architecture.jpg" title="tool tip here">
</p>

### Positional encoding (position embeddings)

What we see as a sentence is : `"he hit me with a pie"`

What naive self-attention sees is just a bag of words:

<p align="center">
  <img width="150" src="images/transformers/bag_of_words_sees_naive_self_attention.jpg" title="Look into the image">
</p>


so for the self-attention model:

`a pie hit me with he`

`a hit with me pie`

`he pie me with a hit`

1) all permutations of those words look the same.
**most** alternative orderings are nonsense, but some change the meaning.

* This is very **different from recurent model** cause recurent models looks on the word one at a time, and remembers which words he saw before and therefore **remember their order**.

2) **in general** the position of words in sentence carries information!


3) **idea is** to add some information to the representation at the beginning that indicates **where it is in the sequence** !

This embedding are then added to the initial vector representation of the input.

<p align="center">
  <img width="150" src="images/transformers/start_function_positional_encoding_and_embedding.jpg" title="Look into the image">
</p>

4) We want to represent **position** in a way that tokens with similar **relative** position have similar **positional encoding**

### Position-wise Feed-Forward Network

Position wise just means each position is multiplied by a matrix. 
Usually a layer of a neural network is (batch_size, hidden_size)
which is multiplied by (hidden_size, hidden_size) to get the next layer

## BERT (Bidirectional Encoder Representation from Transformer)

[Attention is all you need](https://arxiv.org/pdf/1706.03762.pdf)


`BERT` generates **dynamic embeddings** based on the context.

For example:

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


* It is **pre-trained on unlabeled data** extracted from **BooksCorpus**, which has 800M words, and from Wikipedia, which has 2,500M words.

* The encoder of the transformer is bidirectional in nature since it can read a sentence in both directions. This means that BERT learns information from a sequence of words not only from left to right, but also from right to left.

* BERT uses `Positional Encoding`

* The embedding dimension is 512 (**maximum size of tokens that can be fed into BERT model is 512**) - If the tokens in a sequence are less than 512, we can use padding to fill the unused token slots with [PAD] token. If the tokens in a sequence are longer than 512, then we need to do a truncation.

* BERT model then will output an **embedding vector of size 768 (256*3=768) in each of the tokens**.


### Finetuning BERT to downstream tasks 

#### Text classification

For example sentiment analysis task, our goal is to classify whether a sentence is positive or negative,

During fine-tuning, we feed the embedding of R[cls] (Representation of the sentence) to a classifier and train the classifier to perform classification.

During the fine-tuning we update only the weights of the classification layer and not the pre-trained BERT model. When we do this, it becomes the same as using the pre-trained BERT model as a feature extractor.

#### Natural language inference

The goal of our model is to determine whether a hypothesis is True of False given a premise
The goal of our model is to determine whether a sentence pair (premise-hypothesis pair) is either:
an enltailment, contradiction, Neutral.

```python

```

* We take the representation of the [CLS] token, which is R_[CLS], and feed it to a classifier (feedforward + softmax), which returns the probabilty of the sentence being a contradiction, enltailment, Neutral.

<p align="center">
  <img width="400" src="images/transformers/pre_trained_bert_NLI.jpg" title="Look into the image">
</p>

### NER (Named Entity Recognition)

<p align="center">
  <img width="400" src="images/transformers/" title="Look into the image">
</p>

### Question-answering

## BERT Varients

### ALBERT (A Lite version of BERT)



### RoBERT

### ELECTRA

### SpanBERT

### Sentence-BERT

* Sentence-BERT  drastically reduces the inference time of BERT, Sentence-BERT is popularity used in tasks such as:

**sentence pair classification**,  **computing similarity between two sentences**

* Sentence-BERT is modification of the BERT model which uses **siamese** and **triplet network structures** and adds a pooling operation to the output of BERT to obtain fix-sized semantically meaningful sentence embeddings.

* Sentence BERT uses a Siamese network architecture for tasks that involve a sentence pair as input.

**(0)** - Dissimiliar

**(1)** - Similiar


<p align="center">
  <img width="400" src="images/transformers/sentence-bert_dataset_example.jpg" title="Look into the image">
</p>


We know that the siamese network consists of two identical networks that share the **same weights** . So here we use two identical pre-trained BERT models. We feed the tokens from sentence 1 to one BERT and the tokens from sentence 2 to another BERT and compute the representation of the given two sentences.

#### Sentence-BERT with a triplet network




* [Please Read in Depth](https://classic.d2l.ai/chapter_attention-mechanism/transformer.html)
* [Implementation](https://github.com/UKPLab/sentence-transformers)

* [Research paper](https://arxiv.org/pdf/1908.10084.pdf)


### Bert with pytorch


```python
tokenizer = BertTokenizer.from_pretrained('bert-base-cased')

example_text = 'I will watch Memento tonight'

bert_input = tokenizer(example_text,
                       padding='max_length',
                       max_length = 10, 
                       truncation=True,
                       return_tensors="pt")
```

[Link](https://towardsdatascience.com/text-classification-with-bert-in-pytorch-887965e5820f)


[Link](https://neptune.ai/blog/how-to-code-bert-using-pytorch-tutorial)

### Drawbacks

* BERT is state-of-the-art  at the Semantic Textual Similarity tasks but the problem with is it would take very long time for a huge corpus
( 65 hours!! for 10,000 sentences)


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

## Word Cloud

```python
disaster_tweets = train_data[train_data.target == 1]
disaster_string = []
for t in disaster_tweets.text:
    disaster_string.append(t)
disaster_string = pd.Series(disaster_string).str.cat(sep=' ')
wordcloud = WordCloud(width=1600, height=800,max_font_size=100, background_color='white').generate(disaster_string)
plt.figure(figsize=(12,10))
plt.imshow(wordcloud, interpolation="bilinear")
plt.axis("off")
plt.show()
```

## Data Augmentation for NLP

[Link](https://neptune.ai/blog/data-augmentation-nlp)

## 10 Leading Language Models For NLP In 2021

[Link](https://www.topbots.com/leading-nlp-language-models-2020/)