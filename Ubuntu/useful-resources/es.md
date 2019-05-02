<!--ts-->
   * [elasticsearch](#elasticsearch)
      * [What is elasticsearch?](#what-is-elasticsearch)
      * [similar buzzwords](#similar-buzzwords)
      * [How do i start/stop Elasticsearch?](#how-do-i-startstop-elasticsearch)
      * [Elasticsearch terminology](#elasticsearch-terminology)
      * [Basic operations is Elasticsearch (CRUD):](#basic-operations-is-elasticsearch-crud)
         * [Creating an index with curl](#creating-an-index-with-curl)
         * [Mapping scheme with curl](#mapping-scheme-with-curl)
         * [Listing all indices in my cluster with curl](#listing-all-indices-in-my-cluster-with-curl)
         * [Adding a new document to the new index we just have created with curl](#adding-a-new-document-to-the-new-index-we-just-have-created-with-curl)
         * [Retrieving document by id with curl](#retrieving-document-by-id-with-curl)
         * [Check the document existence but do not give the document content with curl](#check-the-document-existence-but-do-not-give-the-document-content-with-curl)
         * [Update the document's content with curl](#update-the-documents-content-with-curl)
         * [Add a new field to an existed document with curl](#add-a-new-field-to-an-existed-document-with-curl)
         * [Deleting an index with curl](#deleting-an-index-with-curl)
         * [Search using query params](#search-using-query-params)
      * [Full Text searches](#full-text-searches)
         * [Search using the filter context](#search-using-the-filter-context)
      * [Aggregations](#aggregations)

<!-- Added by: gil_diy, at: 2018-11-08T15:58+02:00 -->

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

## Get Elasticsearch version from shell:

```bash
curl -XGET 'localhost:9200'
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

## Elasticsearch terminology
Cluster collection of nodes.
Nodes join a cluster using the cluster name.

* A whole bunch of documents that need to be indexed so they can be searched
* Documents are divided into categories or types.
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


## Basic operations is Elasticsearch (CRUD):

### Creating an index with curl

**So how do I create a new index called 'products'?**
```bash
curl -XPUT 'localhost:9200/products?&pretty'
```
reminder:

**PUT:** create and update resources.

**POST:** only to update resource.


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



Field datatypes

Each field has a data type which can be:

* a simple type like text, keyword, date, long, double, boolean or ip.
* a type which supports the hierarchical nature of JSON such as object or nested.
* a specialised type like geo_point, geo_shape, or completion.

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

Query
### Search using query params

a. Query Params
b. REquest Body

Attention: Query params options are a subset of options available in the request body.


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


## Full Text searches

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

## Elasticsearch plugins

### Installing an Elasticsearch plugin:

For hebrew plugin:

```bash
sudo ./elasticsearch-plugin install file:///home/gil_diy/Downloads/elastic-search-hebrew
/es_ik/elasticsearch-analysis-ik-6.4.2.zip
```


# Kibana

## Starting and stopping the service:
```bash
sudo systemctl status kibana.service
sudo systemctl start elasticsearch.service
sudo systemctl stop elasticsearch.service
```
## Get kibana version
```bash
sudo /usr/share/kibana/bin/kibana --version
```

