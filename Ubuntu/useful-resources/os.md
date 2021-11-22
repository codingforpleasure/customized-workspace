<!--ts-->
   * [Processes](#processes)
      * [fork](#fork)
      * [execv](#execv)
      * [execvp](#execvp)
      * [pipe](#pipe)
      * [wait](#wait)
      * [waitpid](#waitpid)
      * [dup2](#dup2)
      * [getpid](#getpid)
      * [Great reference](#great-reference)

<!-- Added by: gil_diy, at: Mon 22 Nov 2021 08:52:45 IST -->

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



## execvp
```c
char *cmd = "ls";
char *argv[3];
argv[0] = "ls";
argv[1] = "-la";
argv[2] = NULL;

execvp(cmd, argv); //This will run "ls -la" as if it were a command
```


[Link](http://www.cs.ecu.edu/karl/4630/sum01/example1.html)
## pipe

Parent and child sharing a pipe 
```c
// C program to illustrate
// pipe system call in C
// shared by Parent and Child
#include <stdio.h>
#include <unistd.h>
#define MSGSIZE 16
char* msg1 = "hello, world #1";
char* msg2 = "hello, world #2";
char* msg3 = "hello, world #3";
  
int main()
{
    char inbuf[MSGSIZE];
    int p[2], pid, nbytes;
  
    if (pipe(p) < 0)
        exit(1);
  
    /* continued */
    if ((pid = fork()) > 0) {
        write(p[1], msg1, MSGSIZE);
        write(p[1], msg2, MSGSIZE);
        write(p[1], msg3, MSGSIZE);
  
        // Adding this line will
        // not hang the program
        // close(p[1]);
        wait(NULL);
    }
  
    else {
        // Adding this line will
        // not hang the program
        // close(p[1]);
        while ((nbytes = read(p[0], inbuf, MSGSIZE)) > 0)
            printf("% s\n", inbuf);
        if (nbytes != 0)
            exit(2);
        printf("Finished reading\n");
    }
    return 0;
}
```

## wait

## waitpid
The waitpid() system call suspends execution of the calling process until a child specified by pid argument has changed state. By default, waitpid() waits only for terminated children, but this behavior is modifiable via the options argument, as described below. 



## dup2
allocates a new file descriptor that refer
to the same open file description as the descriptor oldfd

[Link](http://www.cs.loyola.edu/~jglenn/702/S2005/Examples/dup2.html)

## getpid


## Great reference

[tlpi-dist](https://github.com/bradfa/tlpi-dist)