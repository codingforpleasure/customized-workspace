<p align="center"> <!-- style="width:400px;" -->
  <img src="images/bash_logo.png" title="tool tip here">
</p>

<!-- <img src="images/zsh_logo.png" title="tool tip here"> -->
Table of Contents
=================

<!--ts-->
   * [Table of Contents](#table-of-contents)
      * [Bash tips and tricks](#bash-tips-and-tricks)
         * [Bash scripting Conventions](#bash-scripting-conventions)
      * [<em><strong>Basic to Advance debugging techniques</strong></em>](#basic-to-advance-debugging-techniques)
         * [Telling Whether a Command Succeeded or Not](#telling-whether-a-command-succeeded-or-not)
         * [Displaying Error Messages When Failures Occur](#displaying-error-messages-when-failures-occur)
         * [Seeing All Variable Values (Avoid echoing each one by hand)](#seeing-all-variable-values-avoid-echoing-each-one-by-hand)
         * [Debugging on the entire script](#debugging-on-the-entire-script)
         * [Debugging on part of a shell script](#debugging-on-part-of-a-shell-script)
         * [You need to know how many arguments the script was invoked with.](#you-need-to-know-how-many-arguments-the-script-was-invoked-with)
      * [<em><strong>Array in bash</strong></em>](#array-in-bash)
         * [Delclaring array](#delclaring-array)
         * [Printing an array's contents](#printing-an-arrays-contents)
         * [Referencing a specific cell](#referencing-a-specific-cell)
         * [Casting string to array](#casting-string-to-array)
         * [Getting number of elements in array](#getting-number-of-elements-in-array)
      * [<em><strong>Control Flow statements</strong></em>](#control-flow-statements)
         * [If condition in bash](#if-condition-in-bash)
         * [Logical operators](#logical-operators)
         * [Ternary operator (short form of if condition)](#ternary-operator-short-form-of-if-condition)
         * [Switch case in bash](#switch-case-in-bash)
         * [Looping Over Arguments Passed to a Script](#looping-over-arguments-passed-to-a-script)
         * [Looping for a While](#looping-for-a-while)
         * [Looping with a Count](#looping-with-a-count)
         * [Using Functions: Parameters and Return Values](#using-functions-parameters-and-return-values)
         * [Using Array Variables](#using-array-variables)
      * [<em><strong>Operations on files</strong></em>](#operations-on-files)
         * [Testing for File Characteristics](#testing-for-file-characteristics)
         * [Finding All Your MP3 Files and move it to a specific folder](#finding-all-your-mp3-files-and-move-it-to-a-specific-folder)
         * [Saving or Grouping Output from Several Commands](#saving-or-grouping-output-from-several-commands)
         * [Compare the timestamp of two files, find the newer (latest version).](#compare-the-timestamp-of-two-files-find-the-newer-latest-version)
      * [<em><strong>Operations on Strings</strong></em>](#operations-on-strings)
         * [Replace substring with different string](#replace-substring-with-different-string)
         * [Extract substring from a String](#extract-substring-from-a-string)
         * [Trim last n characters from a String](#trim-last-n-characters-from-a-string)
      * [<em><strong>Useful snippets for daily-work</strong></em>](#useful-snippets-for-daily-work)
         * [Running All Scripts in a Directory](#running-all-scripts-in-a-directory)
         * [Running over all lines in a file](#running-over-all-lines-in-a-file)
         * [Doing arithmetic operations](#doing-arithmetic-operations)
         * [Setting Default Values for arguments](#setting-default-values-for-arguments)
         * [“Daemon-izing” Your Script](#daemon-izing-your-script)
         * [Reusing Code with Includes and Sourcing](#reusing-code-with-includes-and-sourcing)
         * [Renaming file extensions](#renaming-file-extensions)
         * [Padding list of numbers with zeros](#padding-list-of-numbers-with-zeros)
         * [Brace-Expansion](#brace-expansion)
         * [Produce range with step in bash](#produce-range-with-step-in-bash)
      * [Working with numbers in bash](#working-with-numbers-in-bash)
         * [square root of a decimal number](#square-root-of-a-decimal-number)
         * [Truncate a decimal number](#truncate-a-decimal-number)
      * [Tricks](#tricks)
      * [<em><strong>Great reference</strong></em>](#great-reference)

<!-- Added by: gil_diy, at: Mon 07 Feb 2022 12:43:53 IST -->

<!--te-->

## Bash tips and tricks


### Bash scripting Conventions
Variables in a bash script are often written as all-uppercase names, though that is not
required—just a common practice.

```bash
MYVAR="something"
echo $MYVAR
```

bash variable syntax:
First, in the assignment, the name=value syntax is straightforward enough,
but there cannot be any spaces around the equals sign.

The second aspect of shell variable syntax worth noting is the use of the dollar sign
( $ ) to get the value of the variable. some people would argue that
always using the braces is a good habit so you never have to worry about when they
are needed or not, and provides a consistent look throughout your scripts.


The exception to this is using variables inside a $(( )) expression



>**The exit status of a command is kept in the shell variable referenced with $? . Its value
can range from 0 to 255.**

```bash
somecommand
...
if (( $? == 0 )) ; then echo failed ; else echo OK; fi
```
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

## *__Basic to Advance debugging techniques__*

### Telling Whether a Command Succeeded or Not
```bash
# somecommand
it works...
echo $?
0
#badcommand
it fails...
$ echo $?
1
```

### Displaying Error Messages When Failures Occur
>There are cases that if statements tend to distract from the visual flow of statements

```bash
cmd || printf "%b" "cmd failed. You're on your own\n"
```
>or if we want to have the exit happen only on error:

```bash
cmd || { printf "%b" "FAILED.\n" ; exit 1 ; }
```

### Seeing All Variable Values (Avoid echoing each one by hand)
>set command to see the values of all variables and function definitions in the current shell,
For seeing which variables have been exported and what values they have.

>Use the `env` (or `export -p` ) command to see only those variables that have been exported and would be available to a subshell.
>In bash version 4 or newer, you can also use the `declare -p` command.

### Debugging on the entire script
>Start up the subshell with the -x option, which will run the entire script in debug mode.
>Traces of each command plus its arguments are printed to standard output after the commands have been expanded but before they are executed.

```bash
bash -x testingScript.sh
```

### Debugging on part of a shell script
>Using the `set` Bash built-in you can run in normal script ran in debug mode

```bash
set -x			# activate debugging from here
#
# Your tested block of code
#
set +x			# stop debugging from here
```
> For getting more info regarding the lines numbers enter this in the shell, before executing the script:
```bash
export PS4='+xtrace Line number:$LINENO:'
```

### You need to know how many arguments the script was invoked with.

`$# =  number of arguments`

```bash
if (( $# < 3 ))
then
	printf "%b" "Error. Not enough arguments.\n" >&2
	printf "%b" "usage: myscript file1 op file2\n" >&2
	exit 1
elif (( $# > 3 ))
then
	printf "%b" "Error. Too many arguments.\n" >&2
	printf "%b" "usage: myscript file1 op file2\n" >&2
	exit 2
else
	printf "%b" "Argument count correct. Proceeding...\n"
fi
```
or this too:
```bash
[ $result = 1 ] \
&& { echo "Result is 1; excellent." ; exit 0;   } \
|| { echo "Uh-oh, ummm, RUN AWAY! " ; exit 120; }
```

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

## *__Array in bash__*

### Delclaring array

```bash
MY_ARRAY=(1983 1999 2018)
```

### Printing an array's contents

```bash
echo ${MY_ARRAY[*]}
```

### Referencing a specific cell

```bash
echo ${MY_ARRAY[1]}
```
**Attention:** index starts from one and not zero.

### Casting string to array

```bash
INPUT='Happy Joy Accomplishment conquer'
ARR=(${INPUT})
```
### Getting number of elements in array
```bash
ARRAY_LENGTH=${#MY_ARRAY[@]}
```

## *__Control Flow statements__*

### If condition in bash
```bash
if [ -e "1.json" ]
then
	echo "1.json exist"
fi
```

### Logical operators
```bash
if [ "$varA" = 1 ] && { [ "$varB" = "t1" ] || [ "$varC" = "t2" ]; }; then
```


### Ternary operator (short form of if condition)
```bash
case "$b" in
	5) a=$c ;;
	*) a=$d ;;
esac
```
Or

```bash
 [[ $b = 5 ]] && a="$c" || a="$d"
```

### Switch case in bash
```bash
case "$answer" in
	[yY1] ) eval "$choice_yes"
		# error check
	;;
	[nN0] ) eval "$choice_no"
		# error check
	;;
	*	  ) printf "%b" "Unexpected answer '$answer'!" >&2 ;;
esac
```

### Looping Over Arguments Passed to a Script

```bash
# change permissions on a bunch of files

for FN in $*
do
	echo changing $FN
	chmod 0750 $FN
done
```
>**The $* refers to all the arguments supplied on the command line**

short summary:

syntax | result
------------|-----
 $* | $1 $2 $3 ... $\{N}
 $@ | $1 $2 $3 ... $\{N}
 "$*" | "$1c$2c$3c...c$\{N}"
 "$@" | "$1" "$2" "$3" ... "$\{N}"



### Looping for a While

>**Use the while looping construct for arithmetic conditions:**

```bash
while (( COUNT < MAX ))
do
	some stuff
	let COUNT++
done
```

>**for filesystem-related conditions:**

```bash
while [ -z "$LOCKFILE" ]
do
	some things
done
```

>**for reading input:**

```bash
while read lineoftext
do
	process $lineoftext
done
```

### Looping with a Count
```bash
for (( i=0, j=0 ; i+j < 10 ; i++, j++ ))
do
	echo $((i*j))
done
```

loop over alphabetical characters:
```bash
for char in {A..Z}; do
    mkdir $char
done
```
you can also do this: `mkdir {A..Z}`

### Using Functions: Parameters and Return Values

>You must invoke the function inside a $() , capturing the output
>and using the result, or it will be wasted on the screen.
>Attention in bash the are no return statment in function context
>so you should just echo the return value.


```bash
function max()
{
	if [ $1 -gt $2 ]
	then
		echo $1
	else
		echo $2
}

my_number1=56
my_number2=89

larger=$(max $my_number1 $my_number2) #Invoking the function

echo "$larger is a larger number"
```

### Using Array Variables

```bash
MYRA=(first second third home)

echo runners on ${MYRA[0]} and ${MYRA[2]}
```

** You need to do some simple arithmetic in your shell script. **
```bash
SUM=$((A1 + An)*n/2)
```
>**you can use all the standard operators inside of $(( )) for arithmetic expressions**

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

## *__Operations on files__*
### Testing for File Characteristics

Option | Description
------------ | -------------
-b | File is a block special device (for files like /dev/hda1)
-c | File is character special (for files like /dev/tty)
-d | File is a directory
-e | File exists
-f | File is a regular file
-L | File is a symbolic link (same as -h )
-r | File is readable
-S | File is a socket
-w | File is writable
-x | File is executable

```bash
DIRPLACE=/tmp
INFILE=/home/yucca/amazing.data
OUTFILE=/home/yucca/more.results

if [ -d "$DIRPLACE" ]
then
	cd $DIRPLACE
if [ -e "$INFILE" ]
then
	if [ -w "$OUTFILE" ]
	then
		doscience < "$INFILE" >> "$OUTFILE"
	else
		echo "cannot write to $OUTFILE"
	fi
else
	echo "cannot read from $INFILE"
fi
else
	echo "cannot cd into $DIRPLACE"
fi
```

* You can get all if switches using `man test`

### Finding All Your MP3 Files and move it to a specific folder
```bash
find . -name '*.mp3' -print -exec mv '{}' ~/songs \;
```
or even better use xargs:

```bash
find . -name '*.mp3' -print0 | xargs -i -0 mv '{}' ~/songs
```


### Saving or Grouping Output from Several Commands

>Use braces { } to group these commands together; then redirection applies to the output from all commands in the group.


>There are two very subtle catches here. The braces are actually
>reserved words, so they must be surrounded by whitespace. Also,
>the trailing semicolon is required before the closing brace.


```bash
{ pwd; ls; cd ../elsewhere; pwd; ls; } > /tmp/all.out
```

```bash
all_packages_names=$( adb shell pm list packages codingforpleasure | awk -F: '{ print $2 }' )
```

```bash
num_rows=$( echo "$all_packages_names" | wc -l )
```

### Compare the timestamp of two files, find the newer (latest version).
```bash
FILE1='/home/gil_diy/playground_for_bash/version1.txt'
FILE2='/home/gil_diy/playground_for_bash/version2.txt'
[ $FILE1 -nt $FILE2 ] && echo "FILE1 is newer then FILE2"
```

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>


## *__Operations on Strings__*

### Replace substring with different string


**Example #1:**

```bash
# Replacing Suzi with the string Sara:

firstString="I love Suzi and Marry"
secondString="Sara"
echo "${firstString/Suzi/$secondString}" 
```

**Example #2:**

```bash
message='The secret code is 12345'
echo "${message//[0-9]/X}"           
# prints 'The secret code is XXXXX'
```

### Extract substring from a String

Syntax: `${str:offset:len}`

**Example #1:**

```bash
str="apple banana cat dog deer"
animals=${str:13}
echo ${animals}
```

**Example #2:**
```bash
str="apple banana cat dog deer"
first_animal=${str:13:3}
echo ${first_animal}
```


### Trim last n characters from a String

```bash
filname="my_file.txt"
len=${#filname}
echo ${filname:0:len-4} 
```


## *__Useful snippets for daily-work__*
### Running All Scripts in a Directory

> If it is a file (the -f test) and has execute permissions set (the -x test),
> the shell will then try to run that script.

```bash
for SCRIPT in /path/to/scripts/dir/*
do
	if [ -f "$SCRIPT" -a -x "$SCRIPT" ]
	then
		$SCRIPT
	fi
done
```
### Running over all lines in a file

```bash
while read -r line
do
  echo "$line"
done < my_file.txt
```

### Doing arithmetic operations

`let` evaluates each argument, arg, as a math expression.
Arguments are evaluated left to right.

```bash
a=5
let a=a+1
echo $a
let a+=2
echo $a
```

### Setting Default Values for arguments
You have a shell script that takes arguments supplied on the command line. You’d like
to provide default values so that the most common values can be used without the
user needing to type them every time.

**Use the ${:-} syntax when referring to the parameter, and use it to supply a default value:**

```bash
PATH_TO_INSTALL=${1:-/usr/local}
```
The `:-` operator says that if the specified parameter (here, $1 ) is not set or is null,
whatever follows ( /usr/local in my example) should be used as the value. Otherwise, it will
use the value that is already set. It can be used on any shell variable,
not just the positional parameters ( $1 , $2 , $3 , etc.)

### “Daemon-izing” Your Script
Sometimes you want a script to run as a daemon, in the background and never ending. To do this properly you need to be able to detach your script from its controlling
TTY—that is, from the terminal session used to start the daemon. Simply putting an
ampersand on the command isn’t enough. If you start your daemon script on a
remote system via an SSH (or similar) session, you’ll notice that when you log out,
the SSH session doesn’t end and your window is hung until that script ends.
```bash
nohup mydaemonscript 0<&-1>/dev/null 2>&1 &
```
We use the nohup command so that the script is run without being interrupted by a
hangup signal when we log off.

### Reusing Code with Includes and Sourcing
Use the bash shell’s source command or POSIX’s single period (.) to read in the contents of that configuration file.

```bash
$ cat myprefs.cfg
SCRATCH_DIR=/var/tmp
IMG_FMT=png
SND_FMT=ogg
$
```

In the actual script write:
```bash
# use the user prefs
source $HOME/myprefs.cfg
cd ${SCRATCH_DIR:-/tmp}
echo You prefer $IMG_FMT image files
echo You prefer $SND_FMT sound files
```

### Renaming file extensions

* Rename all txt files into srt files.

```bash
for f in *.txt
do
    [ -f "$f" ] && mv "$f" "${f%txt}srt"
done
```

${f%.txt} is a parameter expansion, replaced by the value of the f variable with .txt removed from the end.


### Padding list of numbers with zeros

```bash
function leading_zero(){
    local num=$1
    local zeros=00000
    echo ${zeros:${#num}:${#zeros}}${num} 
}

my_seq=0

for JPG_FILE in ./*.jpg
do
   my_seq=$((my_seq+1))
   padded_number=$(leading_zero $my_seq)
   echo $padded_number
done
```




### Brace-Expansion

Brace expansion is a mechanism by which arbitrary strings may be generated:

```bash
$ echo a{d,c,b}e
ade ace abe
```

```bash
$ mv ~/folder/file.{txt,sh}
```

```bash
$ mkdir /usr/local/src/bash/{old,new,dist,bugs}
```
```bash
$ mkdir month-{1..12}
```

Brace expansions may be nested. The results of each expanded string are not sorted; left to right order is preserved

```bash
$ chown root /usr/{ucb/{ex,edit},lib/{ex?.?*,how_ex}}
```

```bash
$ echo {{a..c},{1..3}}  # produces this: a b c 1 2 3
```

```bash
$ echo {a..c},{1..3}    # produces this (Cartesian product): a,1 a,2 a,3 b,1 b,2 b,3 c,1 c,2 c,3
```

```bash
echo {0..10..2}    # produces range with step
```

### Produce range with step in bash

```bash
seq 0 2 10
```

Example of usage:

```bash
for i in `seq 0 2 10`; do echo $i; done
```

## Working with numbers in bash

### square root of a decimal number

```bash
number=136
square_root=`echo "scale=$number; sqrt($number)" | bc` # 11.66190379
```

### Truncate a decimal number

```bash
number=136
square_root=`echo "scale=$number; sqrt($number)" | bc` # 11.66190379

square_root=`echo ${square_root%.*}` # output would be 11
```

## Tricks

Description | demonstration
------------|-----
 Will always return your PID | $$
 Will give a random number each time | $RANDOM

## *__Great reference__*

(1) [Bash-hackers](http://wiki.bash-hackers.org/start)

(2) [Improve productivity with zsh](https://opensource.com/article/18/9/tips-productivity-zsh)
