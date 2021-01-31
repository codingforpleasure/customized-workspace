<!--ts-->
   * [Processes](#processes)
      * [fork](#fork)
      * [execv](#execv)
      * [pipe](#pipe)
      * [waitpid](#waitpid)
      * [Great reference](#great-reference)

<!-- Added by: gil_diy, at: Thu Dec 17 17:32:24 IST 2020 -->

<!--te-->
# Processes


## fork
Fork system call is used for creating a new process, which is called child process, which runs concurrently with the process that makes the fork() call (parent process). After a new child process is created, both processes will execute the next instruction following the fork() system call.

## execv

provide an array of pointers to null-terminated strings that represent the argument list available to the new program.

The first argument is the path as a string to the program you want to execute. The second is an array of string that will be used as the arguments of the program you want to execute. It is the kind of array you get if you get the argv array in your main function.


The exec() call replaces the entire current contents of the process with a new program. It loads the program into the current process space and runs it from the entry point.

similar functions | Title2
------------|-----
 exec |
 execl | element-description
 execle | element-description
 execlp | element-description
 execlpe | element-description
 execv | element-description
 execve | element-description
 execvp | element-description
 execvpe | element-description



## pipe

Parent and child sharing a pipe 

## waitpid



## Great reference

[tlpi-dist](https://github.com/bradfa/tlpi-dist)