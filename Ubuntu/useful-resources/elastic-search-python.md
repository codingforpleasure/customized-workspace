<!--ts-->
   * [Elasticsearch api in python](#elasticsearch-api-in-python)
      * [Basic operations:](#basic-operations)
         * [list all indexes in a cluster](#list-all-indexes-in-a-cluster)
         * [Indexing single document](#indexing-single-document)
         * [Retrieving a single document](#retrieving-a-single-document)
         * [Deleting specific document](#deleting-specific-document)
         * [Deleting index](#deleting-index)
         * [Refresh](#refresh)
         * [mapping](#mapping)
         * [Search](#search)
      * [Bulk operations:](#bulk-operations)
   * [Elasticsearch-dsl api in python](#elasticsearch-dsl-api-in-python)
      * [Full text queries](#full-text-queries)
      * [Term level queries](#term-level-queries)
      * [Bool queries](#bool-queries)

<!-- Added by: gil_diy, at: 2019-01-28T17:51+02:00 -->

<!--te-->

# Elasticsearch api in python

[Collection of relevant videos](https://www.youtube.com/playlist?list=PLGZAAioH7ZlO7AstL9PZrqalK0fZutEXF)

```pyhton
es = Elasticsearch()
```
## Basic operations:

### list all indexes in a cluster
```python
for index in es.indices.get('*'):
  print(index)
```

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

# Elasticsearch-dsl api in python

[Link to the video](https://www.youtube.com/watch?v=poERWnPrscc)


## Full text queries

The highlevel full text query are usually **used for running full text queries on full text fields like body of an email** .

Full text search refers to
the search within text fields, where the text can be unstructured as well as structured.
The following are some examples of full text searches:

(1)    Find all the documents with search in the title or content fields, and return the
results with matches in titles with the higher score

(2)   Find all the tweets in which people are talking about terrorism and killing and
return the results sorted by the tweet creation time
While doing these kinds of searches, we not only want relevant results but also
expect that the search for a keyword matches all of its synonyms, root words, and
spelling mistakes.

For example, terrorism should match terorism and terror, while
killing should match kills, kill, and killed.


Type | Description
------------|-----
**Match** query | The standard query for performing full text queries, including fuzzy matching and phrase or proximity queries
**Match_Phrase** query | Like the match query but used for matching exact phrases or word proximity matches
**Match_Phrase_Prefix** query | Like the match_phrase query, but does a wildcard search on the final word (`search-as-you-type`)
**Multi_match** query | The multi-field version of the match query.
**query_string** query | complete this later


[Reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/full-text-queries.html)

-----------------------------------------
## Term level queries

An **exact term search** is something in which we look out for the exact terms; for example, any named entity such as the name of a person, location, or organization or date. These searches are easier to make since the search engine **simply looks out for a yes or no** and returns the documents.

Type | Description
------------|-----
 **Term** query | Find documents which contain the  **exact term specified** in the field specified.
 **Terms** query | Find documents which contain **any of the exact terms specified in the field specified**.
 **terms_set** query | Find documents which match with one or more of the specified terms. **The number of terms that must match depend on the specified minimum should match field**  or script.
 **Range** query | Find documents where the field specified contains values (dates, numbers, or strings) in the range specified.
 **exists** query  | Find documents where the field specified contains any non-null value.
 **Prefix** query | Find documents where the field specified contains **terms which begin with the exact prefix specified**.
 **Wildcard** query | element-description
 **regexp** query | Find documents where the field specified contains terms which match the regular expression specified.
 **type** query | Find documents of the specified type.

[Reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/term-level-queries.html)

--------------------------------------

## Compound queries

Type | Description
------------|-----
 **constant_score** query  | element-description
 **bool query** query  | The default query for combining multiple leaf or compound query clauses, as must, should, must_not, or filter clauses. The must and should clauses have their scores combined — the more matching clauses, the better — while the must_not and filter clauses are executed in filter context.
 **function_score** query | Modify the scores returned by the main query with functions to take into account factors like popularity, recency, distance, or custom algorithms implemented with scripting.
 **boosting** query | Return documents which match a positive query, but reduce the score of documents which also match a negative query.

## Bool queries

Type | Title2
------------|-----
 **must** | element-description
 **should** | element-description
 **must_not** | element-description
 **filter** | element-description


```python
from elasticsearch import Elasticsearch
from elasticsearch_dsl import Search


if __name__ == '__main__':

    client = Elasticsearch()

    s = Search(using=client, index="my-index") \
        .filter("term", category="search") \
        .query("match", title="python") \
        .exclude("match", description="beta")

    s.aggs.bucket('per_tag', 'terms', field='tags') \
        .metric('max_lines', 'max', field='lines')

    response = s.execute()

    for hit in response:
        print(hit.meta.score, hit.title)

    for tag in response.aggregations.per_tag.buckets:
        print(tag.key, tag.max_lines.value)
```
