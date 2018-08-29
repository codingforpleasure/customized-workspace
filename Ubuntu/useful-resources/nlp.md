<!--ts-->
<!--te-->
# **nltk**
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.corpus import state_union
from nltk.tokenize import PunktSentenceTokenizer
import nltk

nltk.download()

## Teminology
* tokenizing - word tokenizers... sentence tokenizers
* lexicon and corporas
* corpora - body of text. ex: medical journals,
* lexicon - words and their means
* stop words -
* stemming -
* Tagging -

## **Tokenizing words**

```python
example_text = "Hello there Mr. Smith, how are you are doing today? The weather is great  and the python is awesome, The sky is "

print(sent_tokenize(example_text))
print("Word tockenizer result:")
print(word_tokenize(example_text))

for word in word_tokenize(example_text):
    print(word)
```

## **Stop words**
```python
example_sentence = "This is an example of showing off stop word filteration"
stop_words = set(stopwords.words('english'))
# print(stop_words)
words = word_tokenize(example_sentence)

filtered_sentece = []

for word in words:
    if word not in stop_words:
        filtered_sentece.append(word)

print(filtered_sentece)
```

## **Stemming**
I was taking a ride in the car
I was riding in the car

```python
ps = PorterStemmer()
example_words = ["riding", "rides", "sings", "singing", "sang", "song"]

for word in example_words:
    print(ps.stem(word))
```


## **Tagging**
```python
train_text = state_union.raw("2005-GWBush.txt")
sample_text = state_union.raw("2006-GWBush.txt")

custom_sent_tokenizer = PunktSentenceTokenizer(train_text)
tokenized = custom_sent_tokenizer.tokenize(sample_text)
```
