# Join

##Join lines of two files


### Example 1: demonstrating join command:

**File1.txt**
```text
1 Tall
2 Black
3 Rude
4 Heavy
```
**file2.txt**
```text
1 Short
2 White
3 Polite
4 Light
```


```bash
join file1.txt file2.txt
```

**Output: **
```text
1 Tall Short
2 Black White
3 Rude Polite
4 Heavy Light
```

For each pair of input lines with identical join fields.
in our case the the join is done by the numbers which appears in the beginning of each line.
**by default the join fields are the first field**
