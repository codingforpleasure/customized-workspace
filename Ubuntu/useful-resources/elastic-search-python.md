<!--ts-->
   * [Elasticsearch api in python](#elasticsearch-api-in-python)
      * [Basic operations:](#basic-operations)
         * [Indexing single document](#indexing-single-document)
         * [Retrieving a single document](#retrieving-a-single-document)
         * [Deleting specific document](#deleting-specific-document)
         * [Deleting index](#deleting-index)
         * [Refresh](#refresh)
         * [mapping](#mapping)
         * [Search](#search)
      * [Bulk operations:](#bulk-operations)
         * [Search using query params](#search-using-query-params)
         * [Search using query params](#search-using-query-params-1)

<!-- Added by: gil_diy, at: 2018-11-07T14:24+02:00 -->

<!--te-->

# Elasticsearch api in python

```pyhton
es = Elasticsearch()
```
## Basic operations:

### Indexing single document
```python
res = es.index(index="test-index", doc_type='tweet', id=1, body=doc)
print(res['result'])
```

### Retrieving a single document

```python
res = es.get(index="test-index", doc_type='tweet', id=1)
print(res['_source'])
```

### Deleting specific document

```python
res = es.delete(index="test-index", doc_type="tweet", id=1)
```

### Deleting index

```python
es.indices.delete(index="test-index")
```

### Refresh

```python
es.indices.refresh(index="test-index")
```

### mapping
```python
const schema = {
    'title': { 'type': 'keyword' },
    'author': { 'type': 'keyword' },
    'location': { 'type': 'integer' },
    'text': { 'type': 'text' }
  }

es.indices.put_mapping(
    index="books",
    doc_type="logs_june",
    body = schema
)
```


### Search

```python
res = es.search(index="test-index", body={"query": {"match_all": {}}})
```

## Bulk operations:

Perform either many index or delete operations in a single API call

(`_op_type` can be one of the values: `update` or `delete` or `index`):

```python
from elasticsearch import helpers
```

```python
actions = []
for row in raw_data:
    actions.append({
        "_op_type": "index",
        "_index": "customers",
        "_type": "cust_type",
        "_source": row
    })


helpers.bulk(es, actions)

```

### Search using query params


### Search using query params

a. Query Params
b. Request Body

Attention: Query params options are a subset of options available in the request body.


Exact match in the :
```
curl -XGET 'localhost:9200/customers/_search?pretty' -d'
{
	"query" : {
			"term" : { "name" : "gates"}
	}
}
