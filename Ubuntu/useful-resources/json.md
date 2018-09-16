<!--ts-->
   * [json and jq](#json-and-jq)
      * [json short intro](#json-short-intro)
      * [jq ( Command-line JSON processor)](#jq--command-line-json-processor)
         * [<strong>Collection of jq tips</strong>:](#collection-of-jq-tips)
            * [Useful Tip #1: Apply identity operator (Colorise and pretty print it)](#useful-tip-1-apply-identity-operator-colorise-and-pretty-print-it)
            * [Useful Tip #2: Get property value](#useful-tip-2-get-property-value)
            * [Useful Tip #3: Get nested property value](#useful-tip-3-get-nested-property-value)
            * [Useful Tip #4: Flatting](#useful-tip-4-flatting)
            * [Useful Tip #5: Piping in jq itself](#useful-tip-5-piping-in-jq-itself)
            * [Useful Tip #6: Check for field existence:](#useful-tip-6-check-for-field-existence)
            * [Useful Tip #7: map on list of elements (Apply function on each element)](#useful-tip-7-map-on-list-of-elements-apply-function-on-each-element)
            * [Useful Tip #8: map on dict of elements (Apply function on each element)](#useful-tip-8-map-on-dict-of-elements-apply-function-on-each-element)
         * [<strong>Avoid common pitfalls:</strong>](#avoid-common-pitfalls)
            * [Useful Tip for pitfall #1: use single quotes](#useful-tip-for-pitfall-1-use-single-quotes)
         * [<strong>Great resources on the web</strong>](#great-resources-on-the-web)

<!-- Added by: gil_diy, at: 2018-09-16T18:31+03:00 -->

<!--te-->
# json and jq

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


#### Useful Tip #6: Check for field existence:

```bash
echo '{"boy": "Ed"}' | jq '.girl == null'
```

#### Useful Tip #7: map on list of elements (Apply function on each element)
```bash
echo 'map(.+1)'
[1,2,3]
```
output:
```bash
[2,3,4]
```


#### Useful Tip #8: map on dict of elements (Apply function on each element)

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


### **Avoid common pitfalls:**

#### Useful Tip for pitfall #1: use single quotes
jq '||||'


### **Great resources on the web**

**jq table:** http://hyperpolyglot.org/json

**jq kickass manual **: https://www.systutorials.com/docs/linux/man/1-jq/
