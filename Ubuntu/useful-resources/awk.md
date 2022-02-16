<!--ts-->
   * [<strong>awk (text processing and used as a data extraction tool)</strong>](#awk-text-processing-and-used-as-a-data-extraction-tool)
      * [Example #1: as a warm up print all lines with awk:](#example-1-as-a-warm-up-print-all-lines-with-awk)
      * [Example #2: Prints the second column in every line](#example-2-prints-the-second-column-in-every-line)
      * [Example #3: Prints the concatenat second column with third column in every line](#example-3-prints-the-concatenat-second-column-with-third-column-in-every-line)
      * [Example #4: Grabs every line that contains numbers](#example-4-grabs-every-line-that-contains-numbers)
      * [Example #5: Grabs every line that starts with a number](#example-5-grabs-every-line-that-starts-with-a-number)
      * [Example #6: Grabs every line that ends with a number](#example-6-grabs-every-line-that-ends-with-a-number)
      * [Example #7: Prints the second column when the delimeter is now colon](#example-7-prints-the-second-column-when-the-delimeter-is-now-colon)
      * [Example #8: Prints the second column from line 4 (skips the first 3 lines).](#example-8-prints-the-second-column-from-line-4-skips-the-first-3-lines)

<!-- Added by: gil_diy, at: Wed 16 Feb 2022 19:13:19 IST -->

<!--te-->


# **awk (text processing and used as a data extraction tool)**

## Example #1: as a warm up print all lines with awk:
```bash
awk '{ print }' my_data.txt
```
## Example #2: Prints the second column in every line
```bash
awk '{ print $2 }' my_data.txt
```
 > **important to notice by default awk seperates (delimeter) by white space.**

## Example #3: Prints the concatenat second column with third column in every line

```bash
awk '{ print $2.$3 }' my_data.txt
```

## Example #4: Grabs every line that contains numbers

```bash
awk '/[0-9]/ { print }' my_data.txt
```

## Example #5: Grabs every line that starts with a number

```bash
awk '/^[0-9]/ { print }' my_data.txt
```

## Example #6: Grabs every line that ends with a number

```bash
awk '/[0-9]$/ { print }' my_data.txt
```
## Example #7: Prints the second column when the delimeter is now colon

```bash
awk -F: '{ print $2 }' my_data.txt
```
> ** important to notice I have used the -F for declaring a new field sperator.**

## Example #8: Prints the second column from line 4 (skips the first 3 lines).

```bash
awk  'NR>3 { print $2 }' my_data.txt
```
