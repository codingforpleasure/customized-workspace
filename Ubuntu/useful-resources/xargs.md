
## **xargs (Execute the same command on bunch of items)**

<!--ts-->
 * [<strong>xargs (Execute the same command on bunch of items)</strong>](#xargs-execute-the-same-command-on-bunch-of-items)
    * [Example #1: Applys the xargs command to each single item which comes through](#example-1-applys-the-xargs-command-to-each-single-item-which-comes-through)
    * [Example #2: Changes mode for all files which end with .sh to be executable:](#example-2-changes-mode-for-all-files-which-end-with-sh-to-be-executable)
    * [Example #3: Finds all .tmp files in or below the current directory and delete them.](#example-3-finds-all-tmp-files-in-or-below-the-current-directory-and-delete-them)
    * [Example #4: Moves all jpeg files in or below the current directory to directory ~/Pictures](#example-4-moves-all-jpeg-files-in-or-below-the-current-directory-to-directory-pictures)
    * [Example #5: Finds all .md files which holds the string CodingForePleasure](#example-5-finds-all-md-files-which-holds-the-string-codingforepleasure)
    * [Example #6: Renames all files in the current directory by adding .old to the end of each name](#example-6-renames-all-files-in-the-current-directory-by-adding-old-to-the-end-of-each-name)
    * [Example #7: Create directory for each month with month's abbreviation](#example-7-create-directory-for-each-month-with-months-abbreviation)
    * [Example #8: Create directories for each fruit with  given a fruit.txt](#example-8-create-directories-for-each-fruit-with--given-a-fruittxt)
    * [Example #9: Given a text file which holds on each line a file name, find all files and remove them.](#example-9-given-a-text-file-which-holds-on-each-line-a-file-name-find-all-files-and-remove-them)

<!-- Added by: gil_diy, at: 2018-08-20T09:35+03:00 -->

<!--te-->




#### Example #1: Applys the xargs command to each single item which comes through
```bash
$ seq 5 | xargs -n 1 echo "CodingForePleasure"
```

echo is the default command for xargs if we don't specify what to do.

#### Example #2: Changes mode for all files which end with .sh to be executable:
```bash
$ ls *.sh | xargs chmod +x
```
the same result with specify it to apply xargs on each single item

```bash
$ ls *.sh | xargs -n 1 chmod +x
```

#### Example #3: Finds all .tmp files in or below the current directory and delete them.

```bash
$ find . -name "*.tmp" -type f -print | xargs rm
```

#### Example #4: Moves all jpeg files in or below the current directory to directory ~/Pictures

```bash
$ find . -name '*.jpeg' | xargs -0 -I {} mv {}  ~/Pictures
```
> _**Explanations:**_

 >-0 If there are blank spaces or characters (including newlines) many commands will not work. This option take cares of file names with blank space.

 -I Replace occurrences of replace-str in the initial-arguments with names read from standard input

Or

A more **readble approach** would be to rename {} as myfile. This is more readable:

```bash
$ find . -name '*.bak' -print0 | xargs -0 -I myfile mv myfile ~/old.files
```


#### Example #5: Finds all .md files which holds the string CodingForePleasure

```bash
$ find . -name '.md' | xargs grep CodingForPleasure
```

#### Example #6: Renames all files in the current directory by adding .old to the end of each name

```bash
$ ls | xargs  -t  -I  {} mv {} {}.old
```

 -I Replace occurrences of replace-str in the initial-arguments with names read from standard input



#### Example #7: Create directory for each month with month's abbreviation
```bash
$ printf '%s\n' {1..12}/01 | xargs -I {} date -d {} +%b | xargs mkdir --
```

#### Example #8: Create directories for each fruit with  given a fruit.txt
```bash
$ cat fruit.txt | sort | uniq | xargs -I {} mkdir -p ~/Dekstop/fruits/{}
```

#### Example #9: Given a text file which holds on each line a file name, find all files and remove them.
```bash
$ xargs -a list-files.txt -L 1 -I {} find . -name {} -type f -delete
```

-a will read the filename a line at a time.

-L 1 option makes xargs pass one newline-separated argument to find.

[Good reference](http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html)
