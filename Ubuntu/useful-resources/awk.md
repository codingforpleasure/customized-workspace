## **awk (text processing and used as a data extraction tool)**
### Example #1: as a warm up print all lines with awk:
```bash
awk '{ print }' my_data.txt
```
### Example #2: Prints the second column in every line
```bash
awk '{ print $2 }' my_data.txt
```
 > **important to notice by default awk seperates (delimeter) by white space.**

### Example #3: Prints the concatenat second column with third column in every line

```bash
awk '{ print $2.$3 }' my_data.txt
```

### Example #4: Grabs every line that contains numbers

```bash
awk '/[0-9]/ { print }' my_data.txt
```

### Example #5: Grabs every line that starts with a number

```bash
awk '/^[0-9]/ { print }' my_data.txt
```

### Example #6: Grabs every line that ends with a number

```bash
awk '/[0-9]$/ { print }' my_data.txt
```
### Example #7: Prints the second column when the delimeter is now colon

```bash
awk -F: '{ print $2 }' my_data.txt
```
> ** important to notice I have used the -F for declaring a new field sperator.**

### Example #8: Prints the second column from line 4 (skips the first 3 lines).

```bash
awk  'NR>3 { print $2 }' my_data.txt
```
