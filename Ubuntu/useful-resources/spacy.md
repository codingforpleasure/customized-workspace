<!--ts-->
   * [Spacy](#spacy)
      * [Initialize the spaCy engine using the English model](#initialize-the-spacy-engine-using-the-english-model)
      * [Divide text into sentences](#divide-text-into-sentences)
      * [Get the list of tuples with words and parts of speech tags:](#get-the-list-of-tuples-with-words-and-parts-of-speech-tags)
      * [Getting dependency parse](#getting-dependency-parse)

<!-- Added by: gil_diy, at: Mon 14 Feb 2022 14:57:25 IST -->

<!--te-->


# Spacy

## Initialize the spaCy engine using the English model
```python
nlp = spacy.load("en_core_web_sm")
```

The prerequisite is to download the language model:

```bash
python -m spacy download es_core_news_sm
```

## Divide text into sentences

```python
doc = nlp(text)
```

## Get the list of tuples with words and parts of speech tags:

```python
words = [token.text for token in doc]
pos = [token.pos_ for token in doc]
word_pos_tuples = list(zip(words, pos))
```

[Part of speech tags](https://universaldependencies.org/docs/u/pos/)

## Getting dependency parse


The dependency parse can be very useful in many NLP tasks since it shows the grammatical structure of the sentence, along with the subject, the main verb, the object, and so on.


use spaCy's **explain** function, which shows the meanings of the tags.

```python
import spacy

sentence = 'I have seldom heard him mention her under any other name.'
nlp = spacy.load('en_core_web_sm')
doc = nlp(sentence)

# The dependency information will be contained in the doc object. We can see the
# dependency tags by looping through the tokens in doc :

for token in doc:
   print(token.text, "\t", token.dep_, "\t", spacy.explain(token.dep_))
```

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/nlp/" title="tool tip here">
</p>