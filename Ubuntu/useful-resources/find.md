<!--ts-->
   * [find command](#find-command)
      * [Examples](#examples)
         * [Find all txt files:](#find-all-txt-files)
         * [Ignoring case sensitive (-iname):](#ignoring-case-sensitive--iname)
         * [Find files based on their permissions:](#find-files-based-on-their-permissions)
         * [find file with permission 777 and change the permission to 755](#find-file-with-permission-777-and-change-the-permission-to-755)
         * [find and remove a single file](#find-and-remove-a-single-file)
         * [find all hidden files:](#find-all-hidden-files)
         * [find all the files that were MODIFIED 10 days modified back:](#find-all-the-files-that-were-modified-10-days-modified-back)
         * [find all the files that were ACCESSED 10 days modified back:](#find-all-the-files-that-were-accessed-10-days-modified-back)
         * [find all the files modified in the last 1 minute](#find-all-the-files-modified-in-the-last-1-minute)
         * [Find all the files modified in the last 1 minute and avoid checking /proc directory and /etc](#find-all-the-files-modified-in-the-last-1-minute-and-avoid-checking-proc-directory-and-etc)
         * [Find files between those boundries 1M &lt; size &lt; 2M](#find-files-between-those-boundries-1m--size--2m)
         * [Find to limit the depth of subdirectories depth](#find-to-limit-the-depth-of-subdirectories-depth)
         * [Find "Gil" text in all the text files:](#find-gil-text-in-all-the-text-files)
   * [<a href="https://stackoverflow.com/questions/14132210/use-find-command-but-exclude-files-in-two-directories" rel="nofollow">https://stackoverflow.com/questions/14132210/use-find-command-but-exclude-files-in-two-directories</a>](#httpsstackoverflowcomquestions14132210use-find-command-but-exclude-files-in-two-directories)
         * [Find all empty files:](#find-all-empty-files)
         * [Find all empty directories:](#find-all-empty-directories)

<!-- Added by: gil_diy, at: 2018-12-19T23:44+02:00 -->

<!--te-->

# find command
## Examples

### Find all txt files:
```bash
find /usr/ -type f -name '*.txt'
```
### Ignoring case sensitive (-iname):
```bash
find . -type f -iname abc.txt
```
### Find files based on their permissions:
```bash
find . -type f -perm 0777 -print
```
### find file with permission 777 and change the permission to 755
Comment: The empty brackets are placeholder for the output of the find: command.
```bash
find  . -type f -perm 0777 -exec chmod 755 {}\;
```
**Another way:**
```bash
find  . -type f -perm 0777 -print0 | xrags -0 chmod 755
```
### find and remove a single file
```bash
find . -type f -name "abc.txt" -exec rm -f {}\;
```

or

```bash
find . -type f -name "abc.txt" -delete
```

### find all hidden files:
```bash
find / -type -f -name ".*"
```
### find all the files that were MODIFIED 10 days modified back:
```bash
find / -mtime 10
```
### find all the files that were ACCESSED 10 days modified back:
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
### Find "Gil" text in all the text files:
```bash
find . -name "*.txt" -exec grep -i "GIL" {} \;
```

Simply specify whether you want the time to be greater, smaller, or equal to the time you want, using, respectively:
find . -cmin +<time>
find . -cmin -<time>
find . -cmin  <time>

# https://stackoverflow.com/questions/14132210/use-find-command-but-exclude-files-in-two-directories

find . -cmin -60 -type f -not -path "./junk*"

find . -cmin -60 -type f ! -path "*/junk2/*" ! -path "*/blabla/*"


### Find all empty files:
```bash
find /tmp -type f -empty
```
### Find all empty directories:
```bash
find /tmp -type d -empty
```
