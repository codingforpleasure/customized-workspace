<!--ts-->
   * [Text manipulation tools](#text-manipulation-tools)
      * [<strong>The difference between tr, sed, awk</strong>:](#the-difference-between-tr-sed-awk)
      * [<strong>tr (translate or delete characters)</strong>](#tr-translate-or-delete-characters)
         * [Example #1: maps character b to character <code>d</code>:](#example-1-maps-character-b-to-character-d)
         * [Example #2: maps each character to it's uppercase form:](#example-2-maps-each-character-to-its-uppercase-form)
         * [Example #3: maps each character in the set abcdefghi to character <code>_</code>:](#example-3-maps-each-character-in-the-set-abcdefghi-to-character-_)
         * [Example #4: maps each character in the set [a-z] to character <code>x</code> (it's case sensitive of-course):](#example-4-maps-each-character-in-the-set-a-z-to-character-x-its-case-sensitive-of-course)
         * [Example #5: deleting specific characters:](#example-5-deleting-specific-characters)
         * [Example #6: sqeezing repeated characters:](#example-6-sqeezing-repeated-characters)
      * [<strong>sed (stream editor for filtering and transforming text)</strong>](#sed-stream-editor-for-filtering-and-transforming-text)
         * [Example #1: Looking for port "80/tcp" in /etc/services:](#example-1-looking-for-port-80tcp-in-etcservices)
         * [Example #2: Looking for multiply ports in a script "/tcp":](#example-2-looking-for-multiply-ports-in-a-script-tcp)
      * [<strong>awk (text processing and used as a data extraction tool)</strong>](#awk-text-processing-and-used-as-a-data-extraction-tool)
         * [Example #1: as a warm up print all lines with awk:](#example-1-as-a-warm-up-print-all-lines-with-awk)
         * [Example #2: Prints the second column in every line](#example-2-prints-the-second-column-in-every-line)
         * [Example #3: Prints the concatenat second column with third column in every line](#example-3-prints-the-concatenat-second-column-with-third-column-in-every-line)
         * [Example #4: Grabs every line that contains numbers](#example-4-grabs-every-line-that-contains-numbers)
         * [Example #5: Grabs every line that starts with a number](#example-5-grabs-every-line-that-starts-with-a-number)
         * [Example #6: Grabs every line that ends with a number](#example-6-grabs-every-line-that-ends-with-a-number)
         * [Example #7: Prints the second column when the delimeter is now colon](#example-7-prints-the-second-column-when-the-delimeter-is-now-colon)
         * [Example #8: Prints the second column from line 4 (skips the first 3 lines).](#example-8-prints-the-second-column-from-line-4-skips-the-first-3-lines)

<!-- Added by: gil_diy, at: 2018-07-27T18:27+03:00 -->

<!--te-->

# Text manipulation tools

## **The difference between tr, sed, awk**:
To characterize the three tools crudely:

- [x] _**tr**_ works on characters (changes or deletes them).
- [x] _**sed**_ works on lines (modifies words or other parts of lines, or inserts or deletes lines).
- [x] _**awk**_ work on records with fields(by default whitespace separated fields on a line, but may be changed see examples).

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

## **tr (translate or delete characters)**
### Example #1: maps character `b` to character `d`:
```bash
 > echo big | tr b d
 > dig
```
> **Great purpose is for renaming files with spaces so you can covert them to dash**

### Example #2: maps each character to it's uppercase form:
```bash
 > echo welcome | tr [:lower:] [:upper:]
 > WELCOME
```
> **In zsh you should add quote parameters containing [], looks like this: "[:lower:]"**

### Example #3: maps each character in the set `abcdefghi` to character `_`:
```bash
 > echo welcome | tr abcdefghijkl _
 > w_l_om_
```

### Example #4: maps each character in the set `[a-z]` to character `x` (it's case sensitive of-course):
```bash
 > echo WelCome | tr [a-z] x
 > WxxCxxx
```
> **In zsh you should add quote parameters containing [], looks like this: "[a-z]"**

### Example #5: deleting specific characters:
```bash
 > echo shirt | tr --delete r
 > shit
```
> **Would be great for deleting all spaces**

### Example #6: sqeezing repeated characters:
```bash
 > echo "nice    works.        looks great" | tr --squeeze-repeats " "
 > nice works. looks great
```
> **Would be great for deleting unnecessary spaces**

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

## **sed (stream editor for filtering and transforming text)**

### Example #1: Looking for port "80/tcp" in /etc/services:

```bash
 sed -n '/\s80\/tcp/p' /etc/services
```

>**-n = suppress normal output&nbsp;**

>**p = stands for print the matching pattern&nbsp;**

>**\s  = space&nbsp;**


### Example #2: Looking for multiply ports in a script "/tcp":

```bash
port=80
sed -n "/\s${port}\/tcp/p" /etc/services
```

 > **Important to notice the double quotes will allow the variable expansion within our shell.**

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

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
