# Tips for Ubuntu's Advanced Packaging Tool (APT)

Over the years I have been using some Linux' distributions,

one of them is Ubuntu so here I have wrote down some tips & tricks
for using apt and debian package manager:


## Useful commands:

Purpose | command example
------------ | -------------
Installing package | apt-get install &lt;pkg name&gt;
Uninstalling package | apt-get remove &lt;pkg name&gt;
Get rid of left overs (config files) |  sudo apt-get --purge remove &lt;pkg name&gt;
Search for a package |  apt-cache search &lt;pkg name&gt;
Get more info about the package | apt-cache show &lt;pkg name&gt;
Add new personal package archive | add-apt-repository ppa:&lt;ppa-name&gt;
List all packages on the system |  sudo dpkg --get-selections
List all files regarding a package |   dpkg -L &lt;pkg name&gt;
Find the a missing file to which package it belongs to | apt-file &lt;file-name&gt;
Get package dependencies | apt-cache rdepends &lt;pkg name&gt;


# Debugging makefiles

use:
```bash
make -p > myMakefle.log
```
>**Prints the data base (rules and variable values) that results from reading the makefiles; then execute as usual or as  otherwise  specified.**

# Text manipulation tools (cut, awk, sed, tr)

## sed (stream editor for filtering and transforming text)



**Example #1: Looking for port "80/tcp" in /etc/services:**
```bash
 sed -n '/\s80\/tcp/p' /etc/services
```

>**-n = suppress normal output&nbsp;**

>**p = stands for print the matching pattern&nbsp;**

>**\s  = space&nbsp;**


**Example #2: Looking for multiply ports in a script "/tcp":**

```bash
port=80
sed -n "/\s${port}\/tcp/p" /etc/services
```

 > **Important to notice the double quotes will allow the variable expansion within our shell.**


## awk (text processing and used as a data extraction tool)
**Example #1: as a warm up print all lines with awk:**
```bash
awk '{ print }' my_data.txt
```
**Example #2: Prints the second column in every line**
```bash
awk '{ print $2 }' my_data.txt
```
 > **important to notice by default awk seperates (delimeter) by white space.**

**Example #3: Prints the concatenat second column with third column in every line**
```bash
awk '{ print $2.$3 }' my_data.txt
```

**Example #4: Grabs every line that contains numbers**
```bash
awk '/[0-9]/ { print }' my_data.txt
```

**Example #5: Grabs every line that starts with a number**
```bash
awk '/^[0-9]/ { print }' my_data.txt
```

**Example #6: Grabs every line that ends with a number**
```bash
awk '/[0-9]$/ { print }' my_data.txt
```
**Example #6: Prints the second column when the delimeter is now colon**
```bash
awk -F: '{ print $2 }' my_data.txt
```
> **important to notice I have used the -F for declaring a new field sperator.**

**Example #7: Prints the second column from line 4 (skips the first 3 lines).**
```bash
awk  'NR>3 { print $2 }' my_data.txt
```
# Tips for Sublime



Purpose | command example
------------ | -------------
 Get markdown options | Alt+shift+p



 All list of packages for sublime resides in:
```bash
~/.config/sublime-text-3/Installed Packages
```

## Authors

* **Gil Cohen** - *Initial work* - [CodingForPleasure](https://github.com/CodingForpleasure)
