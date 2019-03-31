<!--ts-->
<!--te-->



One program may be used to construct many processes.

# Processes

## Processes

```c
#include <unistd.h>
...
printf("pid: %d\n",getpid());
...

```
* Each process has a parent - the process that created it. A process can find out the process ID of its parent using the `getppid()` system call:

```c
#include <unistd.h>
...
printf("Parent pid: %d\n",getppid());
...
```
* If a child **process becomes orphaned** because it\'s "birth" parent terminates, then the child is **adopted by the init process**, subsequent calls to getppid() in the child **return 1** .


## fork()

The `fork()` system call allows one process,the parent, to create a new process, the child. This is done by making the new child process an (almost) exact duplicate of the parent: the child obtains copies of the parent's stack, data, heap, and text segments.
For the parent, fork() returns the process Id of the newly created child.
if a new prcoess can't be created, fork() returns -1.

## exit()
The `exit(status)` library function terminates a process. The `status` arguemnt is an integer that determines the termination status for the process. using the `wait()` system call, the parent can retrieve this status.

## wait()
The `wait(status)` system call has two purposes.

* First, if a child of this process has not yet terminated by calling exit(), then wait() **suspends execution of the process until one of its children has terminated**.

* Second, the termination status of the child is returned in the status argument of wait().


## execve()
system call loads a new program (pathname, with argument list argv, and environment list envp) into a process’s memory.
The existing program text is discarded, and the stack, data, and heap segments are freshly created for the new program.


[Nice reference](https://www.geeksforgeeks.org/difference-fork-exec/)
