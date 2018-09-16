<!--ts-->
   * [json and jq](#json-and-jq)
      * [json short intro](#json-short-intro)
      * [jq ( Command-line JSON processor)](#jq--command-line-json-processor)
         * [<strong>Collection of jq tips</strong>:](#collection-of-jq-tips)
            * [Useful Tip #1: Apply Identity operator (Colorise and pretty print it)](#useful-tip-1-apply-identity-operator-colorise-and-pretty-print-it)
            * [Useful Tip #2: Get property value](#useful-tip-2-get-property-value)
            * [Useful Tip #3: Get nested property value](#useful-tip-3-get-nested-property-value)
            * [Useful Tip #4: Flatting](#useful-tip-4-flatting)
         * [<strong>Avoid common pitfalls:</strong>](#avoid-common-pitfalls)
            * [Useful Tip for pitfall #1: use single quotes](#useful-tip-for-pitfall-1-use-single-quotes)

<!-- Added by: gil_diy, at: 2018-09-16T16:31+03:00 -->

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

#### Useful Tip #1: Apply Identity operator (Colorise and pretty print it)

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
echo '{"Family":{"child1":"Ron", "child2":"Jason","child3":"Bob" }' | jq .Family.child2
```

output:
```bash
"Jason"
```

#### Useful Tip #4: Flatting

```bash
echo '[{"word1":"Coding"},{"word2":"For"},{"word3":"Pleasure"}]' | jq .[]
```

**Tip #5: Flatting** didn't work


### **Avoid common pitfalls:**

#### Useful Tip for pitfall #1: use single quotes
jq '||||'
