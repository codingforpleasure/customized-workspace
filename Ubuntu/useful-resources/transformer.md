<!--ts-->
* [General Language Model](#general-language-model)
* [BERT - (Bidirectional Encoder Represetation Transformer)](#bert---bidirectional-encoder-represetation-transformer)
   * [Types of Attention](#types-of-attention)
      * [Encode-Decoder Attention](#encode-decoder-attention)
      * [Encoder Self-Attention](#encoder-self-attention)
      * [Decoder Self-Attention](#decoder-self-attention)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sat 25 Mar 2023 11:42:53 AM IDT -->

<!--te-->

# General Language Model

**Goal:** Build a general, pre traind language representation model.

**Why**: This model can be adapted to various NLP tasks easily, we don't have to retrain a model from scratch every time.

RNNs are models that taken an input sequence and then go through it sequenctionally, the sequential completation makes it difficult to learn long term dependencies and also difficult to paralize too so there's an added cost of complication on top of that so the solution which was presented was the transformer.

# BERT - (Bidirectional Encoder Represetation Transformer)

On October 2018 Google research team came out with BERT a pre-trained bi-directional.
tansfomer that can be fine tune to many NLP tasks.

**BERT is:**

* **Bidirectional:** BERT is naturally bidirectional.

* **Generalizable:** Pre-trained BERT model can be fine-tuned easily for downstream NLP task. like: Question & Answering, natural lanague understanding things.

* **High-Performace:** Fine-tuned BERT models beat state-of-the-art results for many NLP tasks.

* **Universal:** BERT is trained on plain text, trained on Wikipedia + Book Corpus. No special dataset needed

naturally bi-directional it's means bi-directional in a set and this allows for the best contextual representation of the word of the sentence as you will see.

The key of success of transformer is self-attention.
as you recall RNN has the problem of sequensial processing make sit difficult to learn long term dependecies long term relationships.


**The Animal didn't cross the street because it was too tired**

Self attention does is allow words to learn relationships as all other words, so using self attention the model can learn **it** here has a very strong collection with **animal**.
That helps the model learn representation .


Now the model can output the best contextual representation of the word.

<p align="center">
  <img width="400" src="images/transformers/transformer_architecture.jpg" title="Look into the image">
</p>

**Input**: When you play the game of Thrones ...

First step to any machine learning is **input data processing**


## Types of Attention
### Encode-Decoder Attention
### Encoder Self-Attention
### Decoder Self-Attention
