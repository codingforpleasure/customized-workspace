<!--ts-->
* [find command](#find-command)
   * [Examples](#examples)
      * [Find all txt files:](#find-all-txt-files)
      * [Find all txt files and avoid Permission Denied Messages](#find-all-txt-files-and-avoid-permission-denied-messages)
      * [Ignoring case sensitive (-iname)](#ignoring-case-sensitive--iname)
      * [Find files based on their permissions](#find-files-based-on-their-permissions)
      * [find file with permission 777 and change the permission to 755](#find-file-with-permission-777-and-change-the-permission-to-755)
      * [find and remove a single file](#find-and-remove-a-single-file)
      * [find files with either extension c or cpp or h](#find-files-with-either-extension-c-or-cpp-or-h)
      * [find all hidden files](#find-all-hidden-files)
      * [find all the files that were MODIFIED 10 days modified back](#find-all-the-files-that-were-modified-10-days-modified-back)
      * [find all the files that were ACCESSED 10 days modified back](#find-all-the-files-that-were-accessed-10-days-modified-back)
      * [find all the files modified in the last 1 minute](#find-all-the-files-modified-in-the-last-1-minute)
      * [Find all the files modified in the last 1 minute and avoid checking /proc directory and /etc](#find-all-the-files-modified-in-the-last-1-minute-and-avoid-checking-proc-directory-and-etc)
      * [Find files between those boundries 1M &lt; size &lt; 2M](#find-files-between-those-boundries-1m--size--2m)
      * [Find to limit the depth of subdirectories depth](#find-to-limit-the-depth-of-subdirectories-depth)
      * [Find all directories within a <strong>specific</strong> depth level](#find-all-directories-within-a-specific-depth-level)
      * [Find "Gil" text in all the text files](#find-gil-text-in-all-the-text-files)
      * [Find all files match to a pattern and move them to a destination folder](#find-all-files-match-to-a-pattern-and-move-them-to-a-destination-folder)
      * [Find all files match to a pattern and copy them to a destination folder](#find-all-files-match-to-a-pattern-and-copy-them-to-a-destination-folder)
      * [Find all empty files:](#find-all-empty-files)
      * [Find all only leaf directories:](#find-all-only-leaf-directories)
      * [Find all files named sample.txt which are larger then 4 Bytes:](#find-all-files-named-sampletxt-which-are-larger-then-4-bytes)
      * [Find all :](#find-all-)
* [<a href="https://stackoverflow.com/questions/14132210/use-find-command-but-exclude-files-in-two-directories" rel="nofollow">https://stackoverflow.com/questions/14132210/use-find-command-but-exclude-files-in-two-directories</a>](#httpsstackoverflowcomquestions14132210use-find-command-but-exclude-files-in-two-directories)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sun 04 Dec 2022 01:54:08 IST -->

<!--te-->

# find command
## Examples

### Find all txt files:
```bash
find /usr/ -type f -name '*.txt'
```

### Find all txt files and avoid Permission Denied Messages
```bash
find / -type f -iname abc.txt 2>/dev/null
```

### Ignoring case sensitive (-iname)
```bash
find . -type f -iname abc.txt
```
### Find files based on their permissions
```bash
find . -type f -perm 0777 -print
```
### find file with permission 777 and change the permission to 755
Comment: The empty brackets are placeholder for the output of the find: command.
```bash
find  . -type f -perm 0777 -exec chmod 755 {} \;
```
**Another way:**
```bash
find  . -type f -perm 0777 -print0 | xrags -0 chmod 755
```
### find and remove a single file
```bash
find . -type f -name "abc.txt" -delete
```
or

```bash
find . -type f -name "abc.txt" -exec rm -f {} \;
```


### find files with either extension c or cpp or h
```bash
find . -name \*.cpp -o -name \*.c -o -name \*.h
```

### find all hidden files
```bash
find / -type -f -name ".*"
```
### find all the files that were MODIFIED 10 days modified back
```bash
find / -mtime 10
```
### find all the files that were ACCESSED 10 days modified back
```bash
find / -atime 10
```
### find all the files modified in the last 1 minute
```bash
find / -mmin 1
```

### Find all the files modified in the last 1 minute and avoid checking /proc directory and /etc
```bash
find / -type f  -path "/proc" -o -path /etc -prune -o -cmin -1
```
### Find files between those boundries 1M < size < 2M
```bash
find / -size +1M -size -2M
```
### Find to limit the depth of subdirectories depth
```bash
find / -maxdepth 3 -name "*log"
```

### Find all directories within a **specific** depth level
```bash
find . -maxdepth 2 -mindepth 2 -type d -exec basename {} \;
```

### Find "Gil" text in all the text files

```bash
find . -name "*.txt" -exec grep --color -Hi "GIL" {} \;
```

**A better approach**:
```bash
find . -name "*.txt" -print | xargs ag -in "GIL"
```

### Find all files match to a pattern and move them to a destination folder

```bash
find . -name "*myregex*" -exec mv -t <dst_directory> {} +
```

### Find all files match to a pattern and copy them to a destination folder

```bash
find . -name "*.json" -exec cp {} /home/gil_diy/Downloads/ \;
```


Simply specify whether you want the time to be greater, smaller, or equal to the time you want, using, respectively:
```bash
find . -cmin +<time>
find . -cmin -<time>
find . -cmin  <time>

find . -cmin -60 -type f -not -path "./junk*"
find . -cmin -60 -type f ! -path "*/junk2/*" ! -path "*/blabla/*"
```

### Find all empty files:
```bash
find /tmp -type f -empty
```

### Find all only leaf directories:
```bash
find dir -type d -links 2
```

### Find all files named sample.txt which are larger then 4 Bytes:

```bash
find dir -name sample.txt -size +4c
```

 Symbol | Unit measurment
------------|-----
 c | For Bytes
 k | For Kilobytes (units of 1024 Bytes)
 M | For Megabytes
 G | For Gigabytes



### Find all :


# https://stackoverflow.com/questions/14132210/use-find-command-but-exclude-files-in-two-directories
