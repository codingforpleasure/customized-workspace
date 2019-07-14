<!--ts-->
   * [SPARQL](#sparql)
      * [Introduction](#introduction)
         * [Understanding SPO (Subject, Predicate, Object) also known as a Semantic Triple](#understanding-spo-subject-predicate-object-also-known-as-a-semantic-triple)
         * [List of prefixes](#list-of-prefixes)
         * [Sentence (Period, Semicolon, Comma)](#sentence-period-semicolon-comma)
      * [List of useful queries](#list-of-useful-queries)
         * [Get a long list of Wikidata English properties](#get-a-long-list-of-wikidata-english-properties)
         * [Check if a label falls into a range](#check-if-a-label-falls-into-a-range)
         * [Get a list of fictional human which starts with specific sequence of characters](#get-a-list-of-fictional-human-which-starts-with-specific-sequence-of-characters)
      * [Great references](#great-references)

<!-- Added by: gil_diy, at: 2019-07-14T12:04+03:00 -->

<!--te-->


# SPARQL

## Introduction

The entire database is a set of "subject-predicate-object" triples.

### Understanding SPO (Subject, Predicate, Object) also known as a Semantic Triple

Uses three tuple:
<item property value>

referred to in Wikidata as a statement about data.


### List of prefixes

Symbol | Meaning
------------|-----
?item | variable item

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



Symbol | Meaning
-------|---------
P31 | Instance of

### Sentence (Period, Semicolon, Comma)

symbol | Meaning
------------|-----
`.` | Perioda end a simple statement.
`;` | Semicolon allows you to append a predicate-object pair to a triple ( **reusing the subject** )
`,` | Period allows you to append another object to a triple ( **reusing both subject and predicate** )


## List of useful queries

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

## Great references

[Filter](https://en.wikibooks.org/wiki/SPARQL/FILTER)

