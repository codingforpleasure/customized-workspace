<!--ts-->
   * [Spacy](#spacy)
      * [Initialize the spaCy engine using the English model](#initialize-the-spacy-engine-using-the-english-model)
      * [Divide text into sentences](#divide-text-into-sentences)

<!-- Added by: gil_diy, at: Mon 14 Feb 2022 10:03:56 IST -->

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