<!--ts-->
   * [Python Regular expressions](#python-regular-expressions)
      * [Matching](#matching)
      * [flags](#flags)
      * [Search and replace](#search-and-replace)
      * [Regular-expression patterns:](#regular-expression-patterns)

<!-- Added by: gil_diy, at: 2018-08-29T00:28+03:00 -->

<!--te-->

# Python Regular expressions

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
re.sub(pattern, repl, string, max=0)

```python
#!/usr/bin/python
import re
phone = "2004-959-559 # This is Phone Number"
# Remove anything other than digits
num = re.sub(r'\D', "", phone)
print("Phone Num : "  + str(num))
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
a\|b | Matches either a or b
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




