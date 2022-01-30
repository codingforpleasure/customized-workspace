<!--ts-->
   * [Cut command](#cut-command)
      * [Examples](#examples)
         * [Cut by position](#cut-by-position)
            * [Example #1: Print the fourth character of each line:](#example-1-print-the-fourth-character-of-each-line)
            * [Example #2: Print the fourth character and the seventh character of each line:](#example-2-print-the-fourth-character-and-the-seventh-character-of-each-line)
            * [Example #3: Print the fourth character to the seventh character of each line:](#example-3-print-the-fourth-character-to-the-seventh-character-of-each-line)
            * [Example #4: Print the fourth character to the seventh character of each line:](#example-4-print-the-fourth-character-to-the-seventh-character-of-each-line)
            * [Example #5: Print the fourth character <strong>to</strong> the seventh character of each line:](#example-5-print-the-fourth-character-to-the-seventh-character-of-each-line)
            * [Example #6: Print from the fourth character <strong>to</strong> the end of each line:](#example-6-print-from-the-fourth-character-to-the-end-of-each-line)
         * [Cut by field (column)](#cut-by-field-column)
            * [Example #7: Print the second column of each line:](#example-7-print-the-second-column-of-each-line)
            * [Example #8: Print specific multiple columns (i.e: column one and column three) of each line:](#example-8-print-specific-multiple-columns-ie-column-one-and-column-three-of-each-line)
            * [Example #9: Print range of columns (i.e: column one <strong>to</strong> column three) of each line:](#example-9-print-range-of-columns-ie-column-one-to-column-three-of-each-line)
            * [Example #10: Print specific multiple columns with specified delimeter (i.e: comma):](#example-10-print-specific-multiple-columns-with-specified-delimeter-ie-comma)
            * [Example #11: Print from specific column to the end of the line:](#example-11-print-from-specific-column-to-the-end-of-the-line)
            * [Example #12: Change the delimeter to another character:](#example-12-change-the-delimeter-to-another-character)

<!-- Added by: gil_diy, at: Sun 30 Jan 2022 20:33:00 IST -->

<!--te-->

# Cut command

The cut command in UNIX is a command for cutting out the sections from each line of files and writing the result to standard output. It can be used to cut parts of a line by **byte position, character and field**.

## Examples

### Cut by position
#### Example #1: Print the fourth character of each line:

```bash
cut -c4 list1.txt
```

#### Example #2: Print the fourth character and the seventh character of each line:

```bash
cut -c4,7 list1.txt
```

#### Example #3: Print the fourth character to the seventh character of each line:

```bash
cut -c4-7 list1.txt
```

#### Example #4: Print the fourth character to the seventh character of each line:

```bash
cut -c4-7 list1.txt
```

#### Example #5: Print the fourth character **to** the seventh character of each line:

```bash
cut -c4-7 list1.txt
```

#### Example #6: Print from the fourth character **to** the end of each line:
```bash
cut -c4- list1.txt
```
### Cut by field (column)

#### Example #7: Print the second column of each line:
```bash
cut -d' ' -f2 list_columns.txt
```

#### Example #8: Print specific multiple columns (i.e: column one and column three) of each line:
```bash
cut -d' ' -f1,3 list_columns.txt
```

#### Example #9: Print range of columns (i.e: column one **to** column three) of each line:
```bash
cut -d' ' -f1-3 list_columns.txt
```

#### Example #10: Print specific multiple columns with specified delimeter (i.e: comma):
```bash
cut -d, -f1-2 list_columns.txt
```

useful for example:
```bash
cat /etc/passwd | cut -d: -f1
```
(here the delimeter was colon)


#### Example #11: Print from specific column to the end of the line:

from third column to the end of the line, therefore I wrote: `-f3-`

```bash
cut -d, -f3- list_columns.txt
```

#### Example #12: Change the delimeter to another character:

```bash
cat list_columns.txt | cut -d: -f2,3 --output-delimeter="#"
```
