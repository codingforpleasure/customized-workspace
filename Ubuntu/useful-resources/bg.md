<!--ts-->
<!--te-->

# bg and fg commands

Job control is nothing but the ability to stop/suspend the execution of processes (command) and continue/resume their execution as per your requirements. This is done using your operating system and shell such as bash/zsh or POSIX shell


*  It resumes execution of a suspended process as if they had been started with &. Use bg command to restart a stopped background process.


## How do I find status of jobs in the current session?
```bash
$ jobs -l
```

## How do I suspend or stop jobs in the current session?
A job is suspended simply by using the Ctrl–Z short cut key sequence

```bash
kill -s stop PID
kill -s stop jobID
pkill -stop PID
```
## How Do I resume the job and send it to the background?
```bash
bg %<jobID>
```

## How Do I resume the job and send it to the foreground?
To bring the program to foreground to interact with it (using keyboard) use command fg:

```bash
fg %<jobID>
```
