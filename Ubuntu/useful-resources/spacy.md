<!--ts-->
   * [Spacy](#spacy)
      * [Initialize the spaCy engine using the English model](#initialize-the-spacy-engine-using-the-english-model)
      * [Divide text into sentences](#divide-text-into-sentences)
      * [Get the list of tuples with words and parts of speech tags:](#get-the-list-of-tuples-with-words-and-parts-of-speech-tags)

<!-- Added by: gil_diy, at: Mon 14 Feb 2022 10:08:42 IST -->

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