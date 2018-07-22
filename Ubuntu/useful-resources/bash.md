
Table of Contents
=================

   * [Table of Contents](#table-of-contents)
      * [Bash tips and tricks](#bash-tips-and-tricks)
         * [Bash scripting Conventions](#bash-scripting-conventions)
      * [Basic to advance debugging techniques](#basic-to-advance-debugging-techniques)
         * [Telling Whether a Command Succeeded or Not](#telling-whether-a-command-succeeded-or-not)
         * [Seeing All Variable Values (Avoid echoing each one by hand)](#seeing-all-variable-values-avoid-echoing-each-one-by-hand)
         * [You need to know how many parameters the script was invoked with.](#you-need-to-know-how-many-parameters-the-script-was-invoked-with)
      * [Control Flow statements](#control-flow-statements)
         * [Switch case in bash](#switch-case-in-bash)
         * [Looping Over Arguments Passed to a Script](#looping-over-arguments-passed-to-a-script)
         * [Looping for a While](#looping-for-a-while)
         * [Looping with a Count](#looping-with-a-count)
         * [Using Functions: Parameters and Return Values](#using-functions-parameters-and-return-values)
         * [Using Array Variables](#using-array-variables)
      * [Operations on files](#operations-on-files)
         * [Testing for File Characteristics](#testing-for-file-characteristics)
         * [Finding All Your MP3 Files](#finding-all-your-mp3-files)
         * [Saving or Grouping Output from Several Commands](#saving-or-grouping-output-from-several-commands)



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

## Basic to advance debugging techniques

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



### Seeing All Variable Values (Avoid echoing each one by hand)
>**set command to see the values of all variables and function definitions in the
current shell.**
```bash
# set

```


### You need to know how many parameters the script was invoked with.

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



## Control Flow statements

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

## Operations on files
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

### Finding All Your MP3 Files
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

