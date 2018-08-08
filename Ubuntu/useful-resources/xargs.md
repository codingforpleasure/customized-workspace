## **xargs (Execute the same command on bunch of items)**


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


[Good reference](http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html)
