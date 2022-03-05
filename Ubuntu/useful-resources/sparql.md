<!--ts-->
   * [SPARQL “SPARQL Protocol and RDF Query Language”](#sparql-sparql-protocol-and-rdf-query-language)
      * [Introduction](#introduction)
         * [Understanding SPO (Subject, Predicate, Object) also known as a Semantic Triple](#understanding-spo-subject-predicate-object-also-known-as-a-semantic-triple)
         * [List of prefixes](#list-of-prefixes)
            * [Internal to Wikidata](#internal-to-wikidata)
            * [External prefixes](#external-prefixes)
         * [Sentence (Period, Semicolon, Comma)](#sentence-period-semicolon-comma)
         * [Match few predicates](#match-few-predicates)
         * [Match few Objects](#match-few-objects)
         * [Optional](#optional)
         * [Select statement](#select-statement)
         * [Service - label](#service---label)
            * [Alias](#alias)
         * [Modifiers (Group by, Having, Order by, Limit, Offset)](#modifiers-group-by-having-order-by-limit-offset)
            * [Group by](#group-by)
            * [Group_concat](#group_concat)
            * [limit](#limit)
            * [offset](#offset)
      * [Aggregate functions](#aggregate-functions)
      * [Filter](#filter)
      * [List of useful queries](#list-of-useful-queries)
         * [How to get the name of a specific Wikidata item?](#how-to-get-the-name-of-a-specific-wikidata-item)
         * [Get a long list of Wikidata English properties](#get-a-long-list-of-wikidata-english-properties)
         * [Check if a label falls into a range](#check-if-a-label-falls-into-a-range)
         * [Get a list of fictional human which starts with specific sequence of characters](#get-a-list-of-fictional-human-which-starts-with-specific-sequence-of-characters)
         * [Get links to wikipedia](#get-links-to-wikipedia)
      * [Great references](#great-references)

<!-- Added by: gil_diy, at: Sat 05 Mar 2022 09:43:40 IST -->

<!--te-->


# SPARQL “SPARQL Protocol and RDF Query Language”

Enables users to query information from databases or any data source that can be mapped to RDF.

An RDF query language is a computer language,
specifically a query language for databases, able to retrieve and manipulate data stored in Resource Description Framework (RDF) format. 

## Introduction

The entire database is a set of "subject-predicate-object" triples.

### Understanding SPO (Subject, Predicate, Object) also known as a Semantic Triple

The statement "The sky has the color blue", consists of a subject ("the sky"), a predicate ("has the color"), and an object ("blue").

SPO or "subject, predicate, object" is known as a (Semantic) triple, or commonly referred to in Wikidata as a statement about data.

SPO is also used as a form of basic syntax layout for querying RDF data structures, or any graph database or triplestore, such as the Wikidata Query Service (WDQS).

Uses three tuple:
<item property value>

referred to in Wikidata as a statement about data.


### List of prefixes

#### Internal to Wikidata

Prefix | Meaning
------------|-----
wd | Wikidata entity
wds | Wikiedata statement
wdv | Wikiedata value
wdt | property direct
p | property
ps | property statement
pq | Property qualifier
rdfs | rdf-schema

[Link to all prefixes](https://en.wikibooks.org/wiki/SPARQL/Prefixes)

#### External prefixes

Symbol | Meaning
------------|-----
?my_item | query variable is marked by the use of either "?" or "$", the "?" or "$" is not part of the variable name.




Symbol | Meaning
-------|---------
P31 | Instance of

### Sentence (Period, Semicolon, Comma)

symbol | Meaning
------------|-----
`.` | Period ends a statement.
`;` | Semicolon allows you to append a predicate-object pair to a triple ( **reusing the subject** )
`,` | Period allows you to append another object to a triple ( **reusing both subject and predicate** )
`[]` | Pair of brackets act as an **anonymous variable	**


### Match few predicates

In this example below we have in the predicate part: `Instance of` and `subclass of`
```SQL
SELECT DISTINCT ?horse ?horseLabel
WHERE
{
	?horse wdt:P31/wdt:P279* wd:Q726 .     # "Instance of" and "sub-classes of"

	SERVICE wikibase:label {
		bd:serviceParam wikibase:language "en"
	}
}
ORDER BY DESC(?horse)
```

### Match few Objects

In this example below we have in the Object part: `Book` and `Literary work` and `Book series`:

```SQL
SELECT ?book ?url WHERE {

VALUES (?value){
  ( wd:Q571 )     # Book
  ( wd:Q7725634 ) # Literary work
  ( wd:Q277759 )  # Book series
}
?book wdt:P31 ?value .

OPTIONAL {
  ?url schema:about ?book .
  ?url schema:inLanguage "en" .
  ?url schema:isPartOf <https://en.wikipedia.org/> .
}}
```
### Optional

[Link](https://en.wikibooks.org/wiki/SPARQL/OPTIONAL)

In case you put your statements outside of the optional's block, you will
filter the data if the result was evaluated as false.

### Select statement

* First part:  The query result variables (These will be shown when the query is executed)

* Second part:  `WHERE` clause with the query pattern. This defines the data selection and generates the variables.

* Third part: The last part are the **optional modifiers**.


```SQL
SELECT  ... query result variables ...
WHERE {
        ... query pattern ...
}
        ... optional query modifiers ...
GROUP BY ...
HAVING ...
ORDER BY ...
LIMIT ...
```

[Example:](https://en.wikibooks.org/wiki/SPARQL/Sentences)



### Service - label
You can fetch the label, alias, or description of entities you query,
#### Alias
 A variable can be displayed with another name (Alias) by using AS, like (?child AS ?Child_of_Bach). Notice that the alias again should be a variable, and the combination should start and end with brackets.

**For aliases of Labels the label should be defined explicitly in the SERVICE. Alternatively the variable could be named as requested there as well**

```SQL
SELECT (?child AS ?Child_of_Bach) (?childLabel AS ?Name)
WHERE
{
# ?child  father   Bach
  ?child wdt:P22 wd:Q1339.
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en".
                           ?child rdfs:label ?childLabel.
                         }
}
```

### Modifiers (Group by, Having, Order by, Limit, Offset)


#### Group by

Before the group by:

```SQL
SELECT ?mother ?motherLabel ?child ?childLabel
WHERE
{
  ?child wdt:P22 wd:Q1339.# ?child has father Bach
  ?child wdt:P25 ?mother.
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
}
```

We can see each mother have few childs, so let's group by childrens of the same mother:
```SQL
SELECT ?mother ?motherLabel (COUNT(?child) AS ?children)
        (GROUP_CONCAT(DISTINCT ?childLabel; SEPARATOR=", ") AS ?names)
WHERE
{
  ?child wdt:P22 wd:Q1339.# ?child has father Bach
  ?child wdt:P25 ?mother.
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en".
                          ?mother rdfs:label ?motherLabel.
                          ?child  rdfs:label ?childLabel.
                         }
}
GROUP BY ?mother ?motherLabel
```

another example:

```SQL
SELECT ?book ?bookName (GROUP_CONCAT(DISTINCT ?characterLabel; SEPARATOR = ", ") AS ?characters) WHERE {
  VALUES ?value {
    wd:Q571
    wd:Q7725634
    wd:Q277759
  }
  ?book wdt:P31 ?value;
    wdt:P674 ?character.
  SERVICE wikibase:label {
    bd:serviceParam wikibase:language "en".
    ?book rdfs:label ?bookName.
    ?character rdfs:label ?characterLabel.

  }
}
GROUP BY ?book ?bookName
```

#### Group_concat

```SQL
SELECT ?char ?charName (GROUP_CONCAT(DISTINCT ?typeLabel;separator=", ") AS ?types) (GROUP_CONCAT(DISTINCT ?universeLabel;separator=", ") AS ?universes)
WHERE {
	?char wdt:P1080 wd:Q931597;
          wdt:P31 ?type ;
          wdt:P1080 ?universe .
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en".
                         ?char rdfs:label ?charName .
                         ?universe rdfs:label ?universeLabel .
                         ?type rdfs:label ?typeLabel .}
} GROUP BY ?char ?charName
```


#### limit

Get only the first 10 entries in the result:

```SQL
{

} limit 10
```

#### offset

Skip the first 10 entries:

```SQL
{

} offset 10
```


[Link](https://en.wikibooks.org/wiki/SPARQL/Modifiers)

## Aggregate functions

[Link](https://en.wikibooks.org/wiki/SPARQL/Aggregate_functions)


## Filter

[Filter](https://en.wikibooks.org/wiki/SPARQL/FILTER)

## List of useful queries

### How to get the name of a specific Wikidata item?

```SQL
SELECT DISTINCT * WHERE {
  wd:Q19675 rdfs:label ?label .
  FILTER (langMatches( lang(?label), "EN" ) )
}
```

Comment: `Q19675` - is the Louvre Museum!

### Get a long list of Wikidata English properties

```SQL
SELECT ?property ?propertyLabel ?propertyDescription (GROUP_CONCAT(DISTINCT(?altLabel); separator = ", ") AS ?altLabel_list) WHERE {
    ?property a wikibase:Property .
    OPTIONAL { ?property skos:altLabel ?altLabel . FILTER (lang(?altLabel) = "en") }
    SERVICE wikibase:label { bd:serviceParam wikibase:language "en" .}
 }
GROUP BY ?property ?propertyLabel ?propertyDescription
LIMIT 5000

```

### Check if a label falls into a range

Get a list of all humans **date of birth (dob)** is between Jan. 1st (inclusive), 2015 and Jan. 1st, 2016 (exclusive)

```SQL
SELECT ?person ?personLabel ?dob
WHERE
{
  ?person wdt:P31 wd:Q5;
          wdt:P569 ?dob.
  FILTER("2015-01-01"^^xsd:dateTime <= ?dob && ?dob < "2016-01-01"^^xsd:dateTime).
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
}
```

[Link](https://query.wikidata.org/#SELECT%20%3Fperson%20%3FpersonLabel%20%3Fdob%0AWHERE%0A%7B%0A%20%20%3Fperson%20wdt%3AP31%20wd%3AQ5%3B%0A%20%20%20%20%20%20%20%20%20%20wdt%3AP569%20%3Fdob.%0A%20%20FILTER%28%222015-01-01%22%5E%5Exsd%3AdateTime%20%3C%3D%20%3Fdob%20%26%26%20%3Fdob%20%3C%20%222016-01-01%22%5E%5Exsd%3AdateTime%29.%0A%20%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22en%22.%20%7D%20%0A%7D)

### Get a list of fictional human which starts with specific sequence of characters

Here in this example below the the label should start with 'Mr. ':

```SQL
SELECT ?human ?humanLabel
WHERE
{
  ?human wdt:P31 wd:Q15632617;  # fictional human
         rdfs:label ?humanLabel.
  FILTER(LANG(?humanLabel) = "en"). # we only select those labels that are in English
  FILTER(STRSTARTS(?humanLabel, "Mr. ")).
}
```

**Attention useful functions:**

* STRSTARTS is short for “string starts [with]”
* STRENDS
* CONTAINS

### Get links to wikipedia

```SQL
SELECT ?cid ?country ?article WHERE {
    ?cid wdt:P31 wd:Q3624078 .
    OPTIONAL {
      ?cid rdfs:label ?country filter (lang(?country) = "en") .
    }
    OPTIONAL {
      ?article schema:about ?cid .
      ?article schema:inLanguage "en" .
      ?article schema:isPartOf <https://en.wikipedia.org/> .
    }
}
```
[Link](https://query.wikidata.org/#%23%20PREFIX%20schema%3A%20%3Chttp%3A%2F%2Fschema.org%2F%3E%0A%23%20PREFIX%20wikibase%3A%20%3Chttp%3A%2F%2Fwikiba.se%2Fontology%23%3E%0A%23%20PREFIX%20wd%3A%20%3Chttp%3A%2F%2Fwww.wikidata.org%2Fentity%2F%3E%0A%23%20PREFIX%20wdt%3A%20%3Chttp%3A%2F%2Fwww.wikidata.org%2Fprop%2Fdirect%2F%3E%0A%0ASELECT%20%3Fcid%20%3Fcountry%20%3Furl%20WHERE%20%7B%0A%20%20%20%20%3Fcid%20wdt%3AP31%20wd%3AQ3624078%20.%0A%20%20%20%20OPTIONAL%20%7B%0A%20%20%20%20%20%20%3Fcid%20rdfs%3Alabel%20%3Fcountry%20filter%20%28lang%28%3Fcountry%29%20%3D%20%22en%22%29%20.%0A%20%20%20%20%7D%0A%20%20%20%20OPTIONAL%20%7B%0A%20%20%20%20%20%20%3Furl%20schema%3Aabout%20%3Fcid%20.%0A%20%20%20%20%20%20%3Furl%20schema%3AinLanguage%20%22en%22%20.%0A%20%20%20%20%20%20%3Furl%20schema%3AisPartOf%20%3Chttps%3A%2F%2Fen.wikipedia.org%2F%3E%20.%0A%20%20%20%20%7D%0A%7D%20)

**Attention useful functions:**

* STRSTARTS is short for “string starts [with]”
* STRENDS
* CONTAINS

## Great references
[Very useful examples](https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/queries/examples)




