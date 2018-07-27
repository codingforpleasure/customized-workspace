<!--ts-->
   * [Text manipulation tools](#text-manipulation-tools)
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

<!-- Added by: gil_diy, at: 2018-07-27T16:40+03:00 -->

<!--te-->

# Text manipulation tools

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
