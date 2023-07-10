# sed (stream editor for filtering and transforming text)

<!--ts-->
- [sed (stream editor for filtering and transforming text)](#sed-stream-editor-for-filtering-and-transforming-text)
  - [**Selective Print**](#selective-print)
    - [Example #1: Warm-up - Print everything through sed:](#example-1-warm-up---print-everything-through-sed)
    - [Example #2: Print specific lines (line 6 to 8):](#example-2-print-specific-lines-line-6-to-8)
    - [Example #3: Print lines with "80/tcp" in /etc/services:](#example-3-print-lines-with-80tcp-in-etcservices)
    - [Example #4: Print only lines with ports in a script "/tcp":](#example-4-print-only-lines-with-ports-in-a-script-tcp)
    - [Example #5: Prints only the last line:](#example-5-prints-only-the-last-line)
    - [**Selective Delete**](#selective-delete)
    - [Deleting lines with specific criteria](#deleting-lines-with-specific-criteria)
    - [Deleting specific lines according to their position](#deleting-specific-lines-according-to-their-position)
    - [Example #5: Deletes a line which holds specific word like Lions:](#example-5-deletes-a-line-which-holds-specific-word-like-lions)
    - [Example #6: Print everything through sed but delete lines 3-5 output:](#example-6-print-everything-through-sed-but-delete-lines-3-5-output)
    - [**Selective Substitute**](#selective-substitute)
    - [Example #7: Substitute a specific word with other word (like Lions with Zebras):](#example-7-substitute-a-specific-word-with-other-word-like-lions-with-zebras)
    - [Example #8: Substitute a specific word with other word globally (like Lions with Zebras):](#example-8-substitute-a-specific-word-with-other-word-globally-like-lions-with-zebras)
    - [Example #9: Substitute a specific word not case sensitive globally (like Lions with Zebras):](#example-9-substitute-a-specific-word-not-case-sensitive-globally-like-lions-with-zebras)
    - [Example #10: Substitute a specific word only on lines 3-5:](#example-10-substitute-a-specific-word-only-on-lines-3-5)
    - [Example #11: Iterate over files substitutes string foo with bar](#example-11-iterate-over-files-substitutes-string-foo-with-bar)
    - [Example #12: Append a spcific string to each line in a file:](#example-12-append-a-spcific-string-to-each-line-in-a-file)
    - [Example #13: Remove empty lines in a file](#example-13-remove-empty-lines-in-a-file)
    - [Example #14: Prepend characters to the beginning of a file](#example-14-prepend-characters-to-the-beginning-of-a-file)
    - [Example #15: replace groups with sed](#example-15-replace-groups-with-sed)
    - [Example #16: replace text in multiple files in current directory](#example-16-replace-text-in-multiple-files-in-current-directory)
    - [Remove CRLF line terminators in linux](#remove-crlf-line-terminators-in-linux)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sun 13 Nov 2022 00:30:18 IST -->

<!--te-->



## **Selective Print**

### Example #1: Warm-up - Print everything through sed:
```bash
$ cat data.txt | sed -r ''
```

### Example #2: Print specific lines (line 6 to 8):
```bash
$ cat data.txt | sed -n -r  '6,8p'
```
** p is the command for printing specific lines**

### Example #3: Print lines with "80/tcp" in /etc/services:

```bash
 sed -n '/\s80\/tcp/p' /etc/services
```

>**-n = suppress normal output&nbsp;**

>**p = stands for print the matching pattern&nbsp;**

>**\s  = space&nbsp;**


### Example #4: Print only lines with ports in a script "/tcp":

```bash
port=80
sed -n "/\s${port}\/tcp/p" /etc/services
```

 > **Important to notice the double quotes will allow the variable expansion within our shell.**



### Example #5: Prints only the last line:
```bash
sed -n ’$p’ example.txt
```

### **Selective Delete**

### Deleting lines with specific criteria

```bash
$ sed ’/^Eagplant/d’ input.txt > output.txt
```

### Deleting specific lines according to their position

This will back the file up to file.bak, and delete the given lines (line numbers 5-10,12).

```bash
sed -i.bak -e '5,10d;12d' file
```

Note: Line numbers start at 1. The first line of the file is 1, not 0.

### Example #5: Deletes a line which holds specific word like Lions:
```bash
$ cat data.txt | sed -r '/Lions/d'
```
** d is the command for deleting lines in the output**

### Example #6: Print everything through sed but delete lines 3-5 output:
```bash
$ cat data.txt | sed -r '3,5d' ```bash
```


**d is the command for deleting lines in the output**
### **Selective Substitute**


The syntax of the s command is ‘s/regexp/replacement/flags’.
It's basic concept is simple: the s command attempts to match the pattern space against the supplied regular expression regexp; if the match is successful, then that portion of the    pattern space which was matched is replaced with replacement.


### Example #7: Substitute a specific word with other word (like Lions with Zebras):
```bash
$ cat data.txt | sed -r 's/Lions/Zebras/'
```
** s is the command for substitute words in the output,
for each line it will search for the the first appearance of the word and replace it and then continue to the next line**

### Example #8: Substitute a specific word with other word globally (like Lions with Zebras):

```bash
$ cat data.txt | sed -r 's/Lions/Zebras/g'
```

**g is for applying the substitute globally on each appearance of the word**

### Example #9: Substitute a specific word not case sensitive globally (like Lions with Zebras):

```bash
$ cat data.txt | sed -r 's/Lions/Zebras/gi'
```

**i stands for insensitive-case**


### Example #10: Substitute a specific word only on lines 3-5:

```bash
$ cat data.txt | sed -r '3,5 s/Lions/Zebras/gi'
```

### Example #11: Iterate over files substitutes string foo with bar

```bash
find . -type f -exec sed -i 's/foo/bar/g' {} +
```

### Example #12: Append a spcific string to each line in a file:

```bash
$ sed -e 's/$/my specific string/' -i my_file.txt
```

**Reminder: With regular expressions end of the line is symboled by `$` (dollar sign) and the beginning of line by `^` (caret sign)   .**


**Use -i to edit files in-place instead of printing to standard output**

### Example #13: Remove empty lines in a file

```bash
$ cat data.txt | sed '/^[[:space:]]*$/d'
```
### Example #14: Prepend characters to the beginning of a file

```bash
sed -i '1s/^/my new charcters goes here\n/' ./my-file.json
```

* Using the `-i` flag for in-place editing
* 1s/^ means the beginning of the first line

### Example #15: replace groups with sed

```bash
echo "eat it works" | sed -
```

### Example #16: replace text in multiple files in current directory

```bash
find ./ -type f -exec sed -i 's/example/assets/g' {} \;
```

in case we would like to replace paths you can replace the `/` of the sed with other symbol,
so the sed command will be able to  distinguish between the actual pattern and the symbol of the command:
i.e:
```bash
find . -type f -name "*.md" -exec sed -i 's#assets/images#assets/imgs/for_posts#g' {} \;
```

### Remove CRLF line terminators in linux

```bash
sed 's/\r//' log_00000.csv > log_00000_new.csv
```

You can see the difference before and after using the following command:
way to find file encoding is to use **enca**:

```bash
# Before:
enca -L none log_00000.csv 
# After:
enca -L none log_00000_new.csv
```