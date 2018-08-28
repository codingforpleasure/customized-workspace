<!--ts-->
<!--te-->



```python
re.match(pattern, string, flags=0)
```

The re.match function returns a matc h object on success, None on failure.

Match object methods | Description
------|---------------------------
group(num = 0) |  This method returns entire match (or specific subgroup num)
groups() | This method returns all matching subgroups in a tuple (empty if there weren't any)


Flags | Description
------|---------------------------
re.I |  Performs case-insensitive matching
re.L |



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
a|b | Matches either a or b
(re) | Groups regular expressions and remembers matched text


*re = is the actual regular expression




