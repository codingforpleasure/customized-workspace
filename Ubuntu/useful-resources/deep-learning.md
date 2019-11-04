<!--ts-->
   * [RNN (Recurrent Neural Networks)](#rnn-recurrent-neural-networks)
      * [LSTM (Long Short Term Memory)](#lstm-long-short-term-memory)
   * [nlp](#nlp)
      * [Why do we need embeddings?](#why-do-we-need-embeddings)

<!-- Added by: gil_diy, at: 2019-10-09T23:52+03:00 -->

<!--te-->

[DEEP LEARNING GLOSSARY](http://www.wildml.com/deep-learning-glossary/)



# RNN (Recurrent Neural Networks)

## LSTM (Long Short Term Memory)

# nlp

## Why do we need embeddings?

* What is NLP? Machine learning applied to text/speech
* Text is represented as a string inside the computer
* Deep Learning expects numbers as input (first operation is multiplication).
* Text is not a number -> problem


There are few interesting ways to find word vectors,
since they use unsuppervised learning, the features don't necessarily have to make sense to us humans.
They have to make sense **geometrically**.
The 3 popular methods are:
Word2Vec, GLoVe, FastText

* Modern algorithms are very good at relationships between words.



Can text be input in deep learning? No
Therefore we encode/convert from text to number

* One Hot Encoding doesn't have **similarity**

Word2Vec is word embedding, similarity comes from neighbor words


