<!--ts-->
   * [Bert](#bert)
      * [Preprocessing data](#preprocessing-data)
         * [Tokenizer](#tokenizer)
      * [Datasets shared in HuggingFace](#datasets-shared-in-huggingface)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Thu 24 Feb 2022 10:05:54 IST -->

<!--te-->


# Bert

## Preprocessing data

### Tokenizer
```python
    tokenizer = BertTokenizer.from_pretrained('bert-base-cased')

    example_text = 'I will watch Memento tonight'

    bert_input = tokenizer(example_text,
                           padding='max_length',
                           max_length=10,  
                           truncation=True,
                           return_tensors="pt")  
```

* The maximum length of each sequence. In this example we use 10, but for our actual dataset we will use 512, which is the maximum length of a sequence allowed for BERT.

* Since we’re using Pytorch, then we use pt. If you use Tensorflow, then you need to use tf.

* The output of the bert_input is a dictionary which consists of:

`input_ids` , `token_type_ids`, `attention_mask`

**input_ids** - mapping the tokens to uninque input IDs (Token IDs)

**token_type_ids** - Add segment IDs which are used to distinguish one sentence
from the other. All the tokens from the first sentence will be mapped to 0 and all the tokens from the second sentence will be mapped to 1.

**attention_mask** - is used to differentiate the actual tokens and [PAD] tokens. I will map all the actual tokens to 1 and the [PAD] tokens to 0.


## Datasets shared in HuggingFace

There are more than 3150 datsets in huggingface

```python
from datasets import list_datasets, load_dataset, list_metrics, load_metric

# Print all the available datasets
for idx, datset_name in enumerate(list_datasets()):
    print(idx, ') ', datset_name)
```

[github's Repo](https://github.com/huggingface/datasets)

# Reference	

[Bert's Book Github Repo](https://github.com/PacktPublishing/Getting-Started-with-Google-BERT)


