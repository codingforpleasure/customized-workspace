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
```bash
# set

```

>**set command to see the values of all variables and function definitions in the
current shell.**

>**Use the env (or export -p ) command to see only those variables that have been
exported and would be available to a subshell**
