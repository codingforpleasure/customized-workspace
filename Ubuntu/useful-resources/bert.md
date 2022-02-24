<!--ts-->
   * [Bert](#bert)
      * [Preprocessing data](#preprocessing-data)
         * [Tokenizer](#tokenizer)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Thu 24 Feb 2022 09:32:27 IST -->

<!--te-->


# Bert

## Preprocessing data

### Tokenizer
```python
    tokenizer = BertTokenizer.from_pretrained('bert-base-cased')

    example_text = 'I will watch Memento tonight'

    bert_input = tokenizer(example_text,
                           padding='max_length',
                           max_length=10,  # the maximum length of each sequence. In this example we use 10,
                           # but for our actual dataset we will use 512,
                           # which is the maximum length of a sequence allowed for BERT.
                           truncation=True,
                           return_tensors="pt")  # Since we’re using Pytorch, then we use pt.
    # If you use Tensorflow, then you need to use tf .
```



# Reference	

[Bert's Book Github Repo](https://github.com/PacktPublishing/Getting-Started-with-Google-BERT)
