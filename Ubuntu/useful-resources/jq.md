<!--ts-->
   * [jq (json processor)](#jq-json-processor)
      * [json short intro](#json-short-intro)
      * [jq ( Command-line JSON processor)](#jq--command-line-json-processor)
         * [<strong>Collection of jq tips</strong>:](#collection-of-jq-tips)
            * [Useful Tip #1: Apply identity operator (Colorise and pretty print it)](#useful-tip-1-apply-identity-operator-colorise-and-pretty-print-it)
            * [Useful Tip #2: Get property value](#useful-tip-2-get-property-value)
            * [Useful Tip #3: Get nested property value](#useful-tip-3-get-nested-property-value)
            * [Useful Tip #4: Flatting](#useful-tip-4-flatting)
            * [Useful Tip #5: Piping in jq itself](#useful-tip-5-piping-in-jq-itself)
            * [Useful Tip #6: Check for field value existence:](#useful-tip-6-check-for-field-value-existence)
            * [Useful Tip #7: Map on list of elements (Apply function on each element)](#useful-tip-7-map-on-list-of-elements-apply-function-on-each-element)
            * [Useful Tip #8: Count number of elements in single JSON String](#useful-tip-8-count-number-of-elements-in-single-json-string)
            * [Useful Tip #9: Counting Array Elements in single JSON String](#useful-tip-9-counting-array-elements-in-single-json-string)
            * [Useful Tip #10: Counting Array Elements from File](#useful-tip-10-counting-array-elements-from-file)
            * [Useful Tip #11: Split an array of elements into chuncks](#useful-tip-11-split-an-array-of-elements-into-chuncks)
            * [Useful Tip #12: Map a dict of elements (Apply function on each element)](#useful-tip-12-map-a-dict-of-elements-apply-function-on-each-element)
            * [Useful Tip #13: Prettify a json file:](#useful-tip-13-prettify-a-json-file)
         * [Set operations](#set-operations)
            * [Union operation](#union-operation)
            * [Intersection operation](#intersection-operation)
            * [Subtract operation](#subtract-operation)
         * [<strong>Avoid common pitfalls:</strong>](#avoid-common-pitfalls)
            * [Useful Tip for pitfall #1: use single quotes](#useful-tip-for-pitfall-1-use-single-quotes)
         * [Converting files from CSV to JSON and many more](#converting-files-from-csv-to-json-and-many-more)
         * [<strong>Great resources on the web</strong>](#great-resources-on-the-web)

<!-- Added by: gil_diy, at: 2019-09-16T16:02+03:00 -->

<!--te-->
# jq (json processor)

## json short intro
JSON is a language-independent data format. It was derived from JavaScript, but as of 2017 many programming languages include code to generate and parse JSON-format data. The official Internet media type for JSON is application/json. JSON filenames use the extension .json


sublime text useful package for json: **`Pretty JSON`**, hotkey: `Ctrl+shift+P` enter the plugin's name.

plugin capabilties:

Task | Exist feature
------------------------------------|-----
**Pretty JSON : Format (Pretty Print) JSON** |  Yes
**Pretty JSON : JSON query with jq** | Yes
**Pretty JSON : Validate** | Yes

----

## jq ( Command-line JSON processor)

### **Collection of jq tips**:

#### Useful Tip #1: Apply identity operator (Colorise and pretty print it)

```bash
echo '{"word1":"Coding","word2":"For", "word3":"Pleasure"}' | jq .
```

output:
```bash
{
  "word1": "Coding",
  "word2": "For",
  "word3": "Pleasure"
}
```
#### Useful Tip #2: Get property value

```bash
echo '{"word1":"Coding","word2":"For", "word3":"Pleasure"}' | jq .word1
```
output:
```bash
"Coding"
```
#### Useful Tip #3: Get nested property value

```bash
echo '{"Family":{"child1":"Ron", "child2":"Jason","child3":"Bob" }}' | jq .Family.child2
```

output:
```bash
"Jason"
```

#### Useful Tip #4: Flatting

```bash
echo '[{"word1":"Coding"},{"word2":"For"},{"word3":"Pleasure"}]' | jq .[]
```

#### Useful Tip #5: Piping in jq itself
```bash
echo '{"Family":{"child1":"Ron", "child2":"Jason","child3":"Bob"} }' | jq '.Family | .child1'
```
output:
```bash
"Ron"
```


#### Useful Tip #6: Check for field value existence:

```bash
echo '{"boy": "Ed"}' | jq '.girl == null'
```

#### Useful Tip #7: Map on list of elements (Apply function on each element)
```bash
echo 'map(.+1)'
[1,2,3]
```
output:
```bash
[2,3,4]
```
#### Useful Tip #8: Count number of elements in single JSON String
```bash
echo '{"a": 1, "b": 2, "c": 3}' | jq length
```
#### Useful Tip #9: Counting Array Elements in single JSON String

```bash
echo '[{"username":"user1"},{"username":"user2"}]' | jq '. | length'
```

#### Useful Tip #10: Counting Array Elements from File

```bash
jq '. | length' test_file.json
```
#### Useful Tip #11: Split an array of elements into chuncks

let's say the group size is of size 3 (each group excpet the last one is holds 3 elements), therefore we write:

```bash
jq -nc '[1,2,3,4,5,6,7,8,9,10] | _nwise(3)'
```

#### Useful Tip #12: Map a dict of elements (Apply function on each element)

```bash
echo 'map_values(.+1)'
{"a": 1, "b": 2, "c": 3}
```
output:
```bash
{
  "a": 2,
  "b": 3,
  "c": 4
}
```

#### Useful Tip #13: Prettify a json file:

```bash
jq . file.json > file_prettified.json
```


### Set operations


#### Union operation

```bash
echo '{"group_a":["A","B","C","ABC"],"group_b":["B","D"]}' | jq .group_a+.group_b | jq 'unique'
```

#### Intersection operation


```bash
res_addition=`echo '{"group_a":["A","B","C","ABC"],"group_b":["B","D"]}' | jq .group_a+.group_b `
res_union=`echo '{"group_a":["A","B","C","ABC"],"group_b":["B","D"]}' | jq .group_a+.group_b | jq 'unique' `

echo '{"all":["A","B","C","ABC"],"some":["B","C"]}' | jq .all-.some
```


if the groups are unique use:
```bash
jq -cn '["a","b","e","c"] as $A | ["g","a","t","c"] as $B | $A - ($A - $B)'
```

```bash
echo '{ "group_a" : ["a","b","e","c"], "group_b" : ["g","a","t","c"] }' | jq -c '.group_a - (.group_a - .group_b)'
```
#### Subtract operation
```bash
echo '{"all":["A","B","C","ABC"],"some":["B","C"]}' | jq .all-.some
```
pay attention: avoid spaces

### **Avoid common pitfalls:**

#### Useful Tip for pitfall #1: use single quotes
jq '||||'



### Converting files from CSV to JSON and many more

Install this:
`sudo npm install -g d3-dsv`
it will install bunch of tools one of them is: `csv2json`

Afterwards you can use this tool easily:

`csv2json input.csv > output.json`


### **Great resources on the web**

**jq cookbook resource on github:** [Link](https://github.com/stedolan/jq/wiki/Cookbook#)

**jq table:** [Link](http://hyperpolyglot.org/json)

**jq kickass manual **: [Link](https://www.systutorials.com/docs/linux/man/1-jq/)


