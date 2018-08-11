<!--ts-->
  * [<strong>sed (stream editor for filtering and transforming text)</strong>](#sed-stream-editor-for-filtering-and-transforming-text)
     * [<strong>Selective Print</strong>](#selective-print)
        * [Example #1: Warm-up - Print everything through sed:](#example-1-warm-up---print-everything-through-sed)
        * [Example #2: Print specific lines (line 6 to 8):](#example-2-print-specific-lines-line-6-to-8)
        * [Example #3: Print lines with "80/tcp" in /etc/services:](#example-3-print-lines-with-80tcp-in-etcservices)
        * [Example #4: Print only lines with ports in a script "/tcp":](#example-4-print-only-lines-with-ports-in-a-script-tcp)
     * [<strong>Selective Delete</strong>](#selective-delete)
        * [Example #5: Deletes a line which holds specific word like Lions:](#example-5-deletes-a-line-which-holds-specific-word-like-lions)
        * [Example #6: Print everything through sed but delete lines 3-5 output:](#example-6-print-everything-through-sed-but-delete-lines-3-5-output)
     * [<strong>Selective Substitute</strong>](#selective-substitute)
        * [Example #7: Substitute a specific word with other word (like Lions with Zebras):](#example-7-substitute-a-specific-word-with-other-word-like-lions-with-zebras)
        * [Example #8: Substitute a specific word with other word globally (like Lions with Zebras):](#example-8-substitute-a-specific-word-with-other-word-globally-like-lions-with-zebras)
        * [Example #9: Substitute a specific word not case sensitive globally (like Lions with Zebras):](#example-9-substitute-a-specific-word-not-case-sensitive-globally-like-lions-with-zebras)
        * [Example #10: Substitute a specific word only on lines 3-5:](#example-10-substitute-a-specific-word-only-on-lines-3-5)

<!-- Added by: gil_diy, at: 2018-08-11T14:34+03:00 -->

<!--te-->

## **sed (stream editor for filtering and transforming text)**

### **Selective Print**

#### Example #1: Warm-up - Print everything through sed:
```bash
$ cat data.txt | sed -r ''
```

#### Example #2: Print specific lines (line 6 to 8):
```bash
$ cat data.txt | sed -n -r  '6,8p'
```
** p is the command for printing specific lines**

#### Example #3: Print lines with "80/tcp" in /etc/services:

```bash
 sed -n '/\s80\/tcp/p' /etc/services
```

>**-n = suppress normal output&nbsp;**

>**p = stands for print the matching pattern&nbsp;**

>**\s  = space&nbsp;**


#### Example #4: Print only lines with ports in a script "/tcp":

```bash
port=80
sed -n "/\s${port}\/tcp/p" /etc/services
```

 > **Important to notice the double quotes will allow the variable expansion within our shell.**



### **Selective Delete**

#### Example #5: Deletes a line which holds specific word like Lions:
```bash
$ cat data.txt | sed -r '/Lions/d'
```
** d is the command for deleting lines in the output**

#### Example #6: Print everything through sed but delete lines 3-5 output:
```bash
$ cat data.txt | sed -r '3,5d' ```bash
```


** d is the command for deleting lines in the output**
### **Selective Substitute**

#### Example #7: Substitute a specific word with other word (like Lions with Zebras):
```bash
$ cat data.txt | sed -r 's/Lions/Zebras/'
```
** s is the command for substitute words in the output,
for each line it will search for the the first appearance of the word and replace it and then continue to the next line**

#### Example #8: Substitute a specific word with other word globally (like Lions with Zebras):

```bash
$ cat data.txt | sed -r 's/Lions/Zebras/g'
```

** g is for applying the substitute globally on each appearance of the word **

#### Example #9: Substitute a specific word not case sensitive globally (like Lions with Zebras):

```bash
$ cat data.txt | sed -r 's/Lions/Zebras/gi'
```

** i stands for insensitive-case **

#### Example #10: Substitute a specific word only on lines 3-5:

```bash
$ cat data.txt | sed -r '3,5 s/Lions/Zebras/gi'
```
