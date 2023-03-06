<!--ts-->
* [Python Regular expressions](#python-regular-expressions)
   * [re.match (Find something at the beginning of the string and return a match object)](#rematch-find-something-at-the-beginning-of-the-string-and-return-a-match-object)
   * [re.search (Find something anywhere in the string and return a match object)](#research-find-something-anywhere-in-the-string-and-return-a-match-object)
   * [re.findall](#refindall)
   * [re.split](#resplit)
   * [re.sub](#resub)
   * [Matching](#matching)
   * [flags](#flags)
   * [Search and replace](#search-and-replace)
      * [Simple substitute](#simple-substitute)
      * [Advance replace](#advance-replace)
   * [Regular-expression patterns:](#regular-expression-patterns)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Mon 06 Mar 2023 10:22:01 AM IST -->

<!--te-->

# Python Regular expressions

##  re.match (Find something at the beginning of the string and return a match object)

```python
str1 = "I am IP Guy"
print(re.match(r'am', str1)) # we will get "am" 

```


## re.search (Find something anywhere in the string and return a match object)

## re.findall

## re.split

## re.sub




## Matching
```python
re.match(pattern, string, flags=0)
```

The re.match function returns a match object on success, None on failure.

Match object methods | Description
------|---------------------------
group(num = 0) |  This method returns entire match (or specific subgroup num)
groups() | This method returns all matching subgroups in a tuple (empty if there weren't any)


```python
#!/usr/bin/python
import re
line = "Cats are smarter than dogs"
matchObj = re.match( r'(.*) are (.*?) .*', line, re.M|re.I)
if matchObj:
	print("matchObj.group() : " +  matchObj.group())
	print("matchObj.group(1) : " +  matchObj.group(1))
	print("matchObj.group(2) : " + matchObj.group(2))
else:
	print("No match!!")
```

**Attnetion:** There are few more useful Python functions: findall, search

(https://howchoo.com/g/zdvmogrlngz/python-regexes-findall-search-and-match)


## flags

Flags | Description
------|---------------------------
re.I |  Performs case-insensitive matching
re.M | Makes $ match the end of a line (not just the end of the string ) and makes ^ match the start of any line (not just the start of the string ).


## Search and replace

### Simple substitute
re.sub(pattern, repl, string, max=0)

```python
#!/usr/bin/python
import re
phone = "2004-959-559" # This is Phone Number"
# Remove anything other than digits
num = re.sub(r'\D', "", phone)
print("Phone Num : "  + str(num))
```

### Advance replace
```python
#!/usr/bin/python
import re
small_image_url = "https://images.gr-assets.com/books/1553383690s/2657.jpg"

# Replace the s (stands for small) which appears after the digits to l (stands for Large)
large_image_url = re.sub(r'(.+\d+)(s)(\/\d+.jpg)', r'\1l\3', small_image_url)


# So the output would be: "https://images.gr-assets.com/books/1553383690l/2657.jpg"
print("The new url is : "  + large_image_url)
```

## Regular-expression patterns:

pattern | Description
------|---------------------------
^ | Matches beginning if line
$ | Matches end of line
. | Matches any single character except new line
re* | Matches 0 or more occurrences of preceding expression
re+ | Matches 1 or more occurrences of preceding expression
re? | Matches 0 or 1 occurrence of preceding expression
re{n} | Matches exactly n number of occurrences of preceding expression
re{n,} | Matches n or more occurrences of preceding expression
re{n,m} | Matches at least n and at most m occurrences of preceding expression
`a|b` | Matches either a or b
(re) | Groups regular expressions and remembers matched text
\w  | Matches word characters.
\W | Matches non-word characters.
\s | Matches whitespace. Equivalent to [\t\n\r\f].
\S | Matches non-whitespace.
\d | Matches digits. Equivalent to [0-9].
\D | Matches non-digits.
\A |Matches beg inning of string .
\Z | Matches end of string . If a newline exists, it matches just before newline.
\z | Matches end of string .
\G | Matches point where last match finished.
\b | Matches word boundaries
[A-Z]| Match any uppercase ASCII letter
[0-9] | Match any dig it; same as [0123456789]


*re = is the actual regular expression




