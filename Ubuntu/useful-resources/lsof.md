<!--ts-->
   * [lsof](#lsof)

<!-- Added by: gil_diy, at: Sun 20 Jun 2021 18:28:38 IDT -->

<!--te-->

# lsof

lsof is a command meaning "list open files", which is used in many Unix-like systems to report a list of all open files and the processes that opened them



Description | Command
------------|-----
 Find out process has been using this file?  |  lsof <path-to-file>
 Find out the processes which are using  specific so (shared object) file  |  lsof \<path-to-so-file>
 Get all files a specific process has been using |  lsof -p \<pid>
 Get a list of all shared libraries files a specific process has been using | lsof -p <pid>  \|  grep \.so
 Get the log files which a specific process using | lsof -p <pid>  \|  grep log
 Get all processes which are listening on port 80 (linux sockets) | lsof -i 80
 Get all processes which are listening on port 5000 (linux sockets) | lsof -i :5000




Kill all programs using port 5000,
The `-t` option retrieves the pid of each process:

```bash
sudo lsof -t -i tcp:8000 | xargs kill -9
```
