<!--ts-->
   * [elasticsearch](#elasticsearch)
      * [What is elasticsearch?](#what-is-elasticsearch)
      * [similar buzzwords](#similar-buzzwords)
      * [How do i start/stop Elasticsearch?](#how-do-i-startstop-elasticsearch)
      * [Setting up the heap size for JVM?](#setting-up-the-heap-size-for-jvm)
      * [Elasticsearch terminology](#elasticsearch-terminology)
      * [Basic operations is Elasticsearch (CRUD):](#basic-operations-is-elasticsearch-crud)
         * [Creating an index with curl](#creating-an-index-with-curl)
         * [Get mapping for index](#get-mapping-for-index)
         * [Mapping scheme with curl](#mapping-scheme-with-curl)
            * [Field datatypes](#field-datatypes)
         * [Listing all indices in my cluster with curl](#listing-all-indices-in-my-cluster-with-curl)
         * [Adding a new document to the new index we just have created with curl](#adding-a-new-document-to-the-new-index-we-just-have-created-with-curl)
         * [Retrieving document by id with curl](#retrieving-document-by-id-with-curl)
         * [Check the document existence but do not give the document content with curl](#check-the-document-existence-but-do-not-give-the-document-content-with-curl)
         * [Update the document's content with curl](#update-the-documents-content-with-curl)
         * [Add a new field to an existed document with curl](#add-a-new-field-to-an-existed-document-with-curl)
         * [Deleting an index with curl](#deleting-an-index-with-curl)
      * [Basic operations](#basic-operations)
         * [Get list of indices and their details](#get-list-of-indices-and-their-details)
         * [Get number of documents in an index](#get-number-of-documents-in-an-index)
         * [Debugging (using <strong>_explain api</strong>)](#debugging-using-_explain-api)
      * [Term Level queries](#term-level-queries)
         * [Example #1:  Searching all documents with the field 'is_active' set to true.](#example-1--searching-all-documents-with-the-field-is_active-set-to-true)
         * [Example #2:  Multiple terms](#example-2--multiple-terms)
         * [Example #3:  Retrieve documents based on Documents' IDs](#example-3--retrieve-documents-based-on-documents-ids)
         * [Example #4:  Matching documents with range values](#example-4--matching-documents-with-range-values)
         * [Example #5:  Look for terms to begin with a given prefix](#example-5--look-for-terms-to-begin-with-a-given-prefix)
         * [Example #6:  Look for terms with a given wildcard](#example-6--look-for-terms-with-a-given-wildcard)
         * [Example #7:  Look for terms with regex](#example-7--look-for-terms-with-regex)
         * [Example of query and filter contexts](#example-of-query-and-filter-contexts)
         * [Example](#example)
      * [Full text queries](#full-text-queries)
         * [Example #1:  Flexible matching with the match query](#example-1--flexible-matching-with-the-match-query)
         * [Example #2:  Matching phrases](#example-2--matching-phrases)
         * [Example #2: Searching multiple fields](#example-2-searching-multiple-fields)
      * [Improving search results](#improving-search-results)
         * [Example #1: Proximity searches](#example-1-proximity-searches)
         * [Example #2: Fuzzy match query (handling typos)](#example-2-fuzzy-match-query-handling-typos)
         * [Example #3: Adding synonyms from a file](#example-3-adding-synonyms-from-a-file)
         * [Example #4: Highlight matches in fields](#example-4-highlight-matches-in-fields)
         * [Example #5: Stemming](#example-5-stemming)
      * [Profiling (Debugging tool)](#profiling-debugging-tool)
      * [Suggesters](#suggesters)
         * [Completion suggester](#completion-suggester)
         * [Term suggester](#term-suggester)
         * [Function score query](#function-score-query)
         * [Phrase suggester](#phrase-suggester)
      * [Search using query params](#search-using-query-params)
      * [Full Text queries](#full-text-queries-1)
         * [Search using the filter context](#search-using-the-filter-context)
      * [Aggregations](#aggregations)

<!-- Added by: gil_diy, at: 2019-09-25T10:37+03:00 -->

<!--te-->

# elasticsearch

## What is elasticsearch?

Elasticsearch is a distributed search and analytics engine (you can run complex queries and aggregation on your search results) which runs on Lucene.
An open source, search and analytics engine, written in java build on Apache Lucene

## similar buzzwords

Apache Lucene
The indexing and search library for a high performance, full text search engine.
open source, free to use.
written in Java, ported to other languages.

Apache Solr
A search server with: distributed indexing load balancing, replication, automated recover, centralied configuration.

Nutch
Web crawling and index parsing


## How do i start/stop Elasticsearch?

To configure Elasticsearch to start automatically when the system boots up (on systemd), run the following commands:

```bash
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
```
Starting and stopping the service:
```
sudo systemctl start elasticsearch.service
sudo systemctl stop elasticsearch.service
```


You can easily assure the server runs on your browser with:
```bash
localhost:9200
```

log files located:
```bash
/var/log/elasticsearch/
```

Specify node name and cluster name on bringup:
```shell
/bin/elasticsearch -Ecluster.name=gil_es -Enode.name=my_first_node
```

## Setting up the heap size for JVM?

If you run elasticsearch instance, then you should edit the file `/etc/elasticsearch/jvm.options`

If you are working with docker-compose then the configuration should reside in `docker-compose.yml`,

if you see this:
```yaml
environment:
  - "ES_JAVA_OPTS=-Xms2900m -Xmx2900m"
```
you should see in the log `cgroups.hierarchy.override=/, -Xms2900m, -Xmx2900m`
moreover look for `heap size` in the log.

## Elasticsearch terminology
Cluster collection of nodes.
Nodes join a cluster using the cluster name.

* A whole bunch of documents that need to be indexed so they can be searched
* Documents are divided into categories or types (types has been removed in elasticsearch 7.0).
* All of these different of types documents make up an index
 A blog post will be one type of document
 A comment of a post will be another type of document.
So index is a Collection of similiar documents identified by name.
* Documents with the same fields belong to one type
* Document is the basic unit of information to be indexed (expressed in JSON)
   Resides within an index. assigned to a type within an index.
 * Too slow to serve all search requests from one node.
 * Shards means to split the idex across multiple nodes in the cluster.
  So Sharding an index means that every node will have a subset of your index data, so the search willl be executed in parallel on multiple nodes.
* Sharding makes your application much faster by scaling search volume/throughput by searching multiple replicas at the same time.


* Each index has Analyzers, each analyzer has:
  zero or more character filters
  one and only one tokenizer
  zero or more token filters

* You can also define analyzer gloabally instead of at the index level.


## Basic operations is Elasticsearch (CRUD):

### Creating an index with curl

**So how do I create a new index called 'products'?**
```bash
curl -XPUT 'localhost:9200/products?&pretty'
```
reminder:

**PUT:** create and update resources.

**POST:** only to update resource.


### Get mapping for index


Run this in kibana:
```bash
GET /<INDEX_NAME>/_mapping
```
By default when you index documents Elasticsearch does the dynamic mapping for you which means it auto configures the types.

### Mapping scheme with curl

Mapping is the process of defining how a document, and the fields it contains, are stored and indexed.
For instance, use mappings to define:

```bash
curl -XPUT 'localhost:9200/products?&pretty' -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "properties": {
                "id": { "type": "text" },
                "title":  { "type": "text"},
                "abstract": { "type": "text"},
                "author": {
                    "properties": {
                        "id": { "type": "text" },
                        "name": { "type": "text" }
                    }
                }
            }
        }
    }
}
'
```

Another example:

```bash
curl -XPUT 'localhost:9200/products?&pretty' -H 'Content-Type: application/json' -d'
{
    "mappings": {
	 "_doc": {
	      "properties": {
	        "title":    { "type": "text"  },
	        "name":     { "type": "text"  },
	        "age":      { "type": "integer" },
	        "created":  {
	          "type":   "date",
	          "format": "strict_date_optional_time||epoch_millis"
	        }
	      }
	    }
    }
}
'
```



#### Field datatypes

Each field has a data type which can be:

* a simple type like text, keyword, date, long, double, boolean or ip.
* a type which supports the hierarchical nature of JSON such as object or nested.
* a specialised type like geo_point, geo_shape, or completion.


Type | Es-Type | Description
-----|---------|------------
String, VarChar | keyword | This is a text field that is not tokenizable
String, VarChar, Text | text | This is a text field to be tokenizated
Integer | integer | This is an integer (32 bit)
long | long | This is a long value (64 bit)
float | float | This is a floating-point number (32 bit)
double | double | This is a floating-point number (64 bit)
boolean | boolean | This is a boolean value: true or false
date/datetime | date | This is a date or datetime value:`2013-12-25`, `2013-12-25T22:21:20`
bytes/binary | binary | This includes some bytes that we are used for binary data, such as file or stream of bytes

### Listing all indices in my cluster with curl

**How do i list the indices in my cluster?**

```bash
curl -XGET 'localhost:9200/_cat/indices?v&pretty'
```

### Adding a new document to the new index we just have created with curl

**How to add new document to the new index we just created?**

```bash
curl -XPUT  -H 'Content-Type: application/json' 'localhost:9200/books/drama/1?pretty' -d'
{
      "title": "The Fault In Our Stars",
      "author": "John Green",
      "pages": "313",
      "publisher": "Dutton Books",
      "year": "2012",
      "average_age": "23"
    }
'
```

### Retrieving document by id with curl
**How to retrieve documents from elasticsearch by id?**

```bash
curl -XGET 'localhost:9200/test-index/tweet/1?pretty'
```

### Check the document existence but do not give the document content with curl

**How to check the document existence but do not gives the document content?**
```bash
curl -XGET 'localhost:9200/test-index/tweet/1?pretty&_source=false'
```
**In case you are only intrested in a certain fields in the json document, we can specify the name of the fields**
```bash
curl -XGET 'localhost:9200/test-index/tweet/1?pretty&_source=author,timestamp'
```
The other fields are not sent from the server to the client.

### Update the document's content with curl
**Update the document by id:**
```bash
curl -XPUT  -H 'Content-Type: application/json' 'localhost:9200/books/drama/1?pretty' -d'
{
"name" : "The Perks of Being a wallflower",
"author" : "CodingForPleaure",
"pages" : "454"
}
'
```
Since the id already exist, elasticsearch understand it's an update command,
 now the version number of the document will be 2 (indicating an update was performed).

### Add a new field to an existed document with curl
**Add new field to an existed document:**

```bash
curl -XPOST  -H 'Content-Type: application/json' 'localhost:9200/books/drama/1/_update?pretty' -d'
{
	"doc":{
 		 "color" : "Blue"
	}
}
'
```
Pay attention to the "_update" in the query.

**Deleting a document in an index**

```bash
curl -XDELETE 'localhost:9200/books/drama/1?pretty'
```

### Deleting an index with curl

**Deleting an index**

```bash
curl -XDELETE 'localhost:9200/books?pretty'
```

**Deleting all indices in a node:
```bash
curl -X DELETE "localhost:9200/*.*"
curl -X DELETE "localhost:9200/*"
```

Bulk operations on documents:
**retrieve multiple documents:**
One request to elasticsearch and I'll be getting multiple documents:

```bash
curl -XGET 'localhost:9200/books/_mget/indices?v&pretty' -d'
{
	"docs" : [
	{
		"_type" : "drama",
		"_id" : "1"
	},
	{
		"_type" : "drama",
		"_id" : "2"
	}
	]
}
```

```bash
curl -XPOST  -H 'Content-Type: application/json' 'localhost:9200/_bulk?pretty' -d'
{"index" : {""}}
'
```

**index multiple documents**

**Retrieve documents using a Query DSL**
Query DSL is a flexible, expressive search language that Easticsearch uses to expose most of the power of Lucene through a simple JSON interface. It is power of Lucene through a simple JSON interface. It is what you should be using to write your queries in production. It makes your queries more flexible, more precise, easier to read, and easier to debug.



** For generating a dummy data of json: **

1. I have used: https://www.json-generator.com/
2. I have wrote a template.
3. Downloaded the compact json format.

Only for inserting json via curl follow the steps below:

4. Removed the outer array notation.
5. Find `},{` and replace with: }\n{
6. Add {"index":{}}, by finding: {"name" and replacing with {"index": {}}\n{"name"
7. Let's save the file as `generated_for_elasticsearch.json`


How to insert all document from file into elasticsearch:
```bash
curl -XPOST  -H 'Content-Type: application/json' 'localhost:9200/_bulk?pretty&refresh' --data-binary @"generated_for_elasticsearch.json"
'
```

## Basic operations

### Get list of indices and their details
```bash
  GET /_cat/indices?v
```

### Get number of documents in an index
```bash
GET /authors/author_doc/_count
{
  "query": {
    "match_all": {}
  }
}
```


### Debugging (using **_explain api**)

```bash
GET /authors/1/_explain
{
  "query":{
    "term":{
        "name":"johni"
    }
  }
}
```

## Term Level queries
Basic Usage: for well data structured such as:

a. dates

b. numbers

c. keywords fields.

Term level queries find **exact matches** like on enums fields and are not analysed.

**Reminder:** Something important to remember is that Term Level queries are not analysed (Term Level queries with synonyms would not work).

### Example #1:  Searching all documents with the field 'is_active' set to `true`.

```bash
GET /product/default/_search
{
	"query" : {
		"term" : {
		 "is_active" : true
		}
	}
}
```

### Example #2:  Multiple terms
The documents will match if it contains any of the supplied values within the field that we specify. we supply an array of terms
```bash
GET /product/default/_search
{
	"query" : {
		"terms" : {
		 "tags.keyword":[ "Soup", "Cake", "Wine" ]
		}
	}
}
```

### Example #3:  Retrieve documents based on Documents' IDs
We will specify array of Document ID's we would like to fetch.
this is useful if you want to fetch a number of documents whose IDs you already know.
```bash
GET /product/default/_search
{
	"query" : {
		"ids" : {
		 "values":[ 17385, 31520, 15974 ]
		}
	}
}
```

### Example #4:  Matching documents with range values

Movies which have scored rating of higher then 3 stars and less then 5 stars
```bash
GET /movies/default/_search
{
	"query" : {
		"range" : {
		 "movie_rating":{
		 	"gte": 3,
		 	"lte": 5
		 }
		}
	}
}
```
Another example with dates:
```bash
GET /movies/default/_search
{
	"query" : {
		"range" : {
		 "filmed":{
		 	"gte": "01-01-2010",
		 	"lte": "31-12-2010",
		 	"format":"dd-MM-yyyy"
		 }
		}
	}
}
```

### Example #5:  Look for terms to begin with a given prefix
```bash
GET /movies/default/_search
{
    "query": {
      "prefix":{
            "name.keyword": "Super"
      }
    }
}
```

### Example #6:  Look for terms with a given wildcard
```bash
GET /movies/default/_search
{
    "query": {
      "prefix":{
            "name.keyword": "Su*man"
      }
    }
}
```
You can also use `?` for any single character.

**Attention**: Something you should be careful with is placing wildcards at the begining of a term. if you place an asterisk or a question mark at the beginning , This can lead to extremely slow queries so you should avoid doing this.


### Example #7:  Look for terms with regex
```bash
GET /movies/default/_search
{
    "query": {
      "regexp":{
            "name.keyword": "Su[a-zA-Z]+r"
      }
    }
}
```
Attention: Elasticsearch uses Lucene's regular expression engine which **is not perl compatible**.


### Example of query and filter contexts

```bash
GET /goodreads_index/_search
{
  "query": {
    "bool": {
      "must": { "match": { "title": "harry" }},
      "filter": { "term":  { "language_code": "eng" }}
    }
  }
}
```

[Great reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-filter-context.html)

### Example
Search for 'harry' filtered by english language only and order them by ratings count.
```bash
GET /goodreads_index/_search
{
  "query": {
    "function_score": {
      "query": {
        "bool": {
          "must": {
            "match": {
              "title": "harry"
            }
          },
          "filter": {
            "term": {
              "language_code": "eng"
            }
          }
        }
      },
      "script_score": {
        "script": "doc['ratings_count'].value"
      }
    }
  }
```


## Full text queries

**Full text queries** is suitable for:
* blog posts
* articles
* description

Unlike term queries, **full text queries** are analysed, the same analyzer has been used during the indexing
process and the search phase.

### Example #1:  Flexible matching with the match query
```bash
GET /recipe/default/_search
{
    "query": {
      "match":{
            "title": "Recepies with pasta or spaghetti"
      }
    }
}
```

Comments:
* You should notice in the results for the title only includes the term pasta and none of the other terms. The reason for that is that the match query is a Boolean query, what happens internally is that the terms are used boolean query with the **default operator of** **OR**.
Since the default operator is **OR** all terms do not need to appear in the field they were searching, but the more terms that appear the higher the relevance.



The default operator can be changed to **AND** operator for example:
```bash
GET /recipe/default/_search
{
    "query": {
      "match":{
            "title": {
            	"query":"pasta spaghetti",
            	"operator":"and"
      		}
    }
}
```
So now **all terms** in the query must be present within a document's title field to match (The order of the terms appear doesn't matter) .
Important to notice is that we still searching for terms and **not an entire sentence** so that's why some documents match, Remember the query that we entered matches query is analyzed by using the analyzer.
This is of course different then the term level queries which are not analyzed.

* In a match query the order of the words is not relevant each word is search seperately and eventually we calculate the final score.

### Example #2:  Matching phrases

```bash
GET /recipe/default/_search
{
    "query": {
		"match_phrase":{
			"title": "spaghetti puttanesca"
		}
 	}
}
```
**Comments:**
1. Here The order of the terms matters unlike the match query we saw before.
2. Both the terms `spaghetti puttanesca` must appear in the title field in that order and with no other terms in between for this query to match.

### Example #2: Searching multiple fields
Here an example how we can search multiple fields within the same query.
```bash
GET /recipe/default/_search
{
    "query": {
		"multi_match":{
			"query":"pasta",
			"fields":["title","description"]
		}
 	}
}
```

## Improving search results

### Example #1: Proximity searches

### Example #2: Fuzzy match query (handling typos)

For example look for lobster, when we had a typo: `l0bster`
```bash
GET /product/default/_search
{
    "query": {
		"match":{
			"name":{
				"query":"l0bster",
				"fuzzines":"auto"
		}
 	}
}
```
We can see in the result is we get 5 matches since we're now allowing a number of characters to be inserted, deleted or substituted this way we make a query match a given document.
Fuzziness is implemented by calculating [Levenstein distance](https://en.wikipedia.org/wiki/Levenshtein_distance#Example) (edit distance).

Comments: by default `fuzzy_transpositions` is set to `true`.


### Example #3: Adding synonyms from a file
```bash
PUT /synonyms
{
    "settings": {
		"analysis":{
			"filter":{
				"synonym_test":{
					"type": "synonym",
					"synonyms_path" : "analysis/synonyms.txt"
				}
		},
		"analyzer":{
			"my_analyzer":{
				"tokenizer":"standard",
				"filter":{
					"lowercase",
					"synonym_test"
				}
			}
		}
 	}
}
```
The file `synonyms.txt` contains:
```txt
# This is a comment
awful => terrible
elasticsearch, logstash, kibana => elk
weird, strange    <--------THIS LINE IS UNCLEAR FOR ME YET
```

You can easily check it by executing this and see the result:
```bash
POST /synonyms/_analyze
{
	"analyzer":"my_analyzer",
	"text": "Elasticsearch"
}
```

maybe should use:
```bash
POST /synonyms/_update_by_query
```

[Intresting resource](https://www.peterbe.com/plog/synonyms-with-elasticsearch-dsl)

### Example #4: Highlight matches in fields

```bash
GET /product/default/_search
{
    "query": {
		"match":{
			"name":"Elasticsearch story"
 	},
 	"highlight":{
		"fields":{
			"name":{}
		}
 	}
}
```
if you would like to wrap the matching words with different tags,
you should write it in the query, for example:

```bash
GET /product/default/_search
{
    "query": {
		"match":{
			"name":"Elasticsearch story"
 	},
 	"highlight":{
		"pre_tags" : ["<strong>"],
		"post_tags" : ["</strong>"],
		"fields":{
			"name":{}
		}
 	}
}
```



### Example #5: Stemming
```bash
PUT /product
{
	"Settings":{
		"analysis":{
			"filter":{
				"synonym_test":{
					"type":"synonym",
					"synonyms":[
						"firm => company",
						"love, enjoy"
					]
				},
				"stemmer_test":{
					"type":"stemmer",
					"name":"english"
				}
			},
			"analyzer":{
				"my_analyzer":{
					"tokenizer":"standard",
					"filter":[
						"lowercase",
	 					"synonym_test",
						"stemmer_test"
					]
				}
			}
		}
	}
}
```

## Profiling (Debugging tool)

The Profile API provides detailed timing information about the execution of individual components in a search request.
It gives the user insight into how search requests are executed at a low level so that the user can understand why certain requests are slow,
and take steps to improve them.

Profile API, **Doesn’t measure**:

* Network latency
* Time spent in the search fetch phase
* Time spent while the requests spends in queues
* Time while merging shard responses on the coordinating node


## Suggesters

Suggest similar looking terms, what it that means depends on suggester.

### Completion suggester
**properties:**

* Provide autocomplete

* Only works based on prefix

* Stored as special data structure for speed [Finite-state_transducer](https://en.wikipedia.org/wiki/Finite-state_transducer) (Costly to build, Stored in memory)

```bash
GET /product/default/_search
{
  "suggester":{
    "my_autocomplete":{
      "prefix":"fo",
      "completion":{
      "field":"field_to_use"
      }
    }
  }
}
```

For avoiding duplicates, we should add: `"skip_duplicates": true`
For Adding fuzziness, we should add: `"fuzzy": { "fuzziness": "auto" }`

### Term suggester

**properties:**
* Correct a user's spelling
* Suggestions are based on edit distance (How many characters need to be changed for a term to match)

I stopped here:
https://youtu.be/PQGlhbf7o7c?list=PLIuTyKmG6V7OAqTYZL_vkkxAo8JK6eGb8&t=1389

```bash
GET /product/default/_search
{

}
```


### Function score query
```bash
GET /goodreads_index/_search
{
  "query": {
    "function_score": {
      "query": {
        "match": {
          "title": "harry"
        }
      },
      "script_score": {
        "script": "doc['ratings_count'].value"
      }
    }
  }
}
```


### Phrase suggester
**properties:**
* Like term suggester, only fancier.
* based on N-GRAM language model:

1. i.e if we using a gram size of 2 for the string "domain", then we will get these tokens: do, om, ma, ai, in

2. When we want groups of words instead of groups of characters they're reffered to as **shingles**. i.e:
 "Domain Driven Design" (minimum shingle size of 2, and maximum shingle size of 3)

## Search using query params

a. Query Params
b. REquest Body

Attention: Query params options are a subset of options available in the request body.

**Pay attention:** By default, all queries executed by the Search Profiler are sent to GET /_search. It searches across your entire cluster (all indices, all types).
therefore in the query you can mention the index and the document type, such as:
'localhost:9200/books/basic_book_type/_search?pretty'


The term "gates" in the name field has to have an exact match:
```bash
curl -XGET 'localhost:9200/customers/_search?pretty' -d'
{
	"query" : {
			"term" : { "name" : "gates"}
	}
}
'
```


If you would not want the documents to be returned in the final results, so it would only return the id of the matching documents and their score (efficient way to reduce the data transfer and increase reponse time):
```bash
curl -XGET 'localhost:9200/customers/_search?pretty' -d'
{
	"_source" : false,
	"query" : {
			"term" : { "name" : "gates"}
	}
}
'
```

If you would like to see the retrieved data for some fields, for example retrieve only fields
which start with the consecutive letters: "st*" (i.e: state, street)

```bash
curl -XGET 'localhost:9200/customers/_search?pretty' -d'
{
	"_source" : "st*",
	"query" : {
			"term" : { "state" : "washington"}
	}
}
'
```

* you can specify any kind of regular expression in the \_source field


You can easily specify in the includes the relevant fields which match the regex,
and exclude the fields which the other regex match, see below:

```bash
curl -XGET 'localhost:9200/customers/_search?pretty' -d'
{
	"_source" : {
		"includes" : ["st*", "*n*"],
		"excludes" : [ "*der" ],
	}
	"query" : {
			"term" : { "state" : "washington"}
	}
}
'
```


## Full Text queries

1. Not an exact term match

    Tweak other parameters to specify how the match is to be performed

```bash
curl -XGET 'localhost:9200/customers/_search?pretty' -d'
{
	"query" : {
		"match" : {
			"name" : "webster"
		}
	}
}
'
```


2. All documents with "frank" OR "norris" in the "name" field will be matched:

Attention:  When no operator is specified it defaults to OR

```bash
curl -XGET 'localhost:9200/customers/_search?pretty' -d'
{
	"query" : {
		"match" : {
			"name" : {
				"query" : "frank norris".
				"operator" : "or"
			}
		}
	}
}
'
```
3. You want to find an entire phrase match you have specified in the query:

```bash
curl -XGET 'localhost:9200/customers/_search?pretty' -d'
{
	"query" : {
		"match_phrase" : {
				"street" : "tompkins place"
			}
		}
	}
}
'
```

4. Specify only the prefix you're searching for:

	(This is one of the ways to implement autocomplete with elasticsearch)

```bash
curl -XGET 'localhost:9200/customers/_search?pretty' -d'
{
	"query" : {
		"match_phrase_prefix" : {
				"name" : "ma"
			}
		}
	}
}
'
```

5. Using a boolean compound query with must:

```bash
curl -XGET 'localhost:9200/customers/_search?pretty' -d'
{
	"query" : {
		"bool":{
			"must":[
			{ "match" : { "street" : "ditmas" } },
			{ "match" : { "street" : "avenue" } }
			]
		}
	}
}
'
```
Both "ditmas" and "avenue" should appear in the street field.

* You can use other boolean compound keywords: "must", "must_not", "should"

### Search using the filter context
Filters (The documents in the result are not scored, each document responds yes/no to wheter it should be included in the result)


## Aggregations

Four types of aggregations:

1. Metric (Aggregations over a set of documents, statistics we would like to extract)

2. Bucketing (Logically group documents based on search query, a document falls into a bucket if the criteria matches)
Each bucket associated with a key.

3. Matrix (Operates in multiple fields and produces a matrix result)

4. Pipeline (Aggregations that work on the output of other aggregations)

