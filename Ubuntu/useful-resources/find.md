<!--ts-->
  * [Examples](#examples)
     * [Find all txt files:](#find-all-txt-files)
     * [Ignoring case sensitive (-iname):](#ignoring-case-sensitive--iname)
     * [Find files based on their permissions:](#find-files-based-on-their-permissions)
     * [find file with permission 777 and change the permission to 755](#find-file-with-permission-777-and-change-the-permission-to-755)
     * [find files between those boundries 1M &lt; size &lt; 2M](#find-files-between-those-boundries-1m--size--2m)
     * [find to limit the depth of subdirectories depth](#find-to-limit-the-depth-of-subdirectories-depth)
     * [find "Gil" text in all the text files:](#find-gil-text-in-all-the-text-files)

<!-- Added by: gil_diy, at: 2018-09-02T17:08+03:00 -->

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
###find and remove a single file
```bash
find . -type f -name "abc.txt" -exec rm -f {}\;
```
###find all hidden files:
```bash
find / -type -f -name ".*"
```
###find all the files that were MODIFIED 10 days modified back:
```bash
find / -mtime 10
```
###find all the files that were ACCESSED 10 days modified back:
```bash
find / -atime 10
```
###find all the files modified in the last 1 minute
```bash
find / -mmin 1
```
### find files between those boundries 1M < size < 2M
```bash
find / -size +1M -size -2M
```
### find to limit the depth of subdirectories depth
```bash
find / -maxdepth 3 -name "*log"
```
### find "Gil" text in all the text files:
```bash
find . -name "*.txt" -exec grep -i "GIL" {} \;
```
