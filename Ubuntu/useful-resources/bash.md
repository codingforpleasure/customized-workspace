# Bash tips and tricks


**(1) Telling Whether a Command Succeeded or Not**
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
>**The exit status of a command is kept in the shell variable referenced with $? . Its value
can range from 0 to 255.**

```bash
somecommand
...
if (( $? == 0 )) ; then echo failed ; else echo OK; fi
```

**(2) Seeing All Variable Values (Avoid echoing each one by hand)**
>**set command to see the values of all variables and function definitions in the
current shell.**
```bash
# set

```

>**Use the env (or export -p ) command to see only those variables that have been
exported and would be available to a subshell**
```bash
# env
```

**(3) Looping Over Arguments Passed to a Script**

```bash
# change permissions on a bunch of files

for FN in $*
do
	echo changing $FN
	chmod 0750 $FN
done
```
>**The $* refers to all the arguments supplied on the command line**


**(4) You need to know how many parameters the script was invoked with.**

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

**(5) Using Array Variables**

```bash
MYRA=(first second third home)

echo runners on ${MYRA[0]} and ${MYRA[2]}
```

**(6) You need to do some simple arithmetic in your shell script. **
```bash
SUM=$((A1 + An)*n/2)
```
>**you can use all the standard operators inside of $(( )) for arithmetic expressions**


**(7) Testing for File Characteristics**

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
**(8) Looping for a While**

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


**(9) Looping with a Count**
```bash
for (( i=0, j=0 ; i+j < 10 ; i++, j++ ))
do
	echo $((i*j))
done
```


**(10) Finding All Your MP3 Files**
```bash
find . -name '*.mp3' -print -exec mv '{}' ~/songs \;
```
or even better use xargs:

```bash
find . -name '*.mp3' -print0 | xargs -i -0 mv '{}' ~/songs
```

**(11) Using Functions: Parameters and Return Values**

```bash
# define the function:
function max ()
{
	local HIDN
	if [ $1 -gt $2 ]
	then
		BIGR=$1
	else
		BIGR=$2
	fi
	HIDN=5
}

# call the function:
max 128 $SIM
# use the result:
echo $BIGR
```
