<!--ts-->
   * [Parallel programming in python](#parallel-programming-in-python)
      * [Executing a process from a script](#executing-a-process-from-a-script)
      * [Threads](#threads)
         * [Defining a thread](#defining-a-thread)
         * [Determining the current thread](#determining-the-current-thread)
         * [Using thread in subclass](#using-thread-in-subclass)
         * [Thread synchronization with lock](#thread-synchronization-with-lock)
         * [Thread synchronization with Rlock](#thread-synchronization-with-rlock)
         * [Thread synchronization with semaphores](#thread-synchronization-with-semaphores)
         * [Thread synchronization with a condition](#thread-synchronization-with-a-condition)
         * [Thread synchronization with an event](#thread-synchronization-with-an-event)
         * [Using the with event](#using-the-with-event)
         * [Thread communication using a queue](#thread-communication-using-a-queue)
         * [Evaluating the performance of multithread applications](#evaluating-the-performance-of-multithread-applications)

<!-- Added by: gil_diy, at: 2019-08-12T23:47+03:00 -->

<!--te-->


# Parallel programming in python


## Executing a process from a script

**One process:** `called_process.py`:
```python
print("Hello python Parallel Cookbook!!")
closeInput = input("press Enter to exist")
```

**Second process:** `calling_process.py`:
```python
import os
import sys

program = "python"
print('Process calling')
arguments = ["called_process.py"]

## we call the called_Process.py script
os.execvp(program, (program,)+ tuple(arguments))
```

## Threads

### Defining a thread

```python

```
### Determining the current thread

### Using thread in subclass

### Thread synchronization with lock

### Thread synchronization with Rlock

### Thread synchronization with semaphores

### Thread synchronization with a condition

### Thread synchronization with an event

### Using the with event

### Thread communication using a queue

### Evaluating the performance of multithread applications


