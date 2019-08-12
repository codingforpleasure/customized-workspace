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
import threading

def my_func(i):
	print("function called by thread %i\n" %i)
	return


threads = []
for i in range(5):
	t = threading.Thread(target = my_func, args=(i,))
	threads.append(t)
	t.start() # The thread doesn;t start running until the start method is called.

	t.join()  # The join method makes the calling thread wait until the thread has
			  # finished the execution

```
### Determining the current thread

```python
import threading
import time

def first_func():
	print(threading.currentThread().getName() + str('is Starting \n'))
	time.sleep(2)
	print(threading.currentThread().getName() + str('is Exiting \n'))
	return

def second_func():
	print(threading.currentThread().getName() + str('is Starting \n'))
	time.sleep(2)
	print(threading.currentThread().getName() + str('is Exiting \n'))
	return

if __name__ == "__main__":

	t1 = threading.Thread(name = 'first_function', target = first_func)

	t2 = threading.Thread(name = 'second_function', target = second_func)

	t1.start()
	t2.start()

	# The join method makes the calling thread wait until the thread has
	# has finished the execution

	t1.join()
	t2.join()

```


### Using thread in subclass

```python

```


### Thread synchronization with lock

```python
import threading

shared_resource_with_lock = 0
shared_resource_with_no_lock = 0
COUNT = 1000000
shared_resource_lock = threading.Lock()


### With locking mechanism
def increment_with_lock():
	global shared_resource_with_lock
	for i in range(COUNT):
		shared_resource_lock.acquire()
		shared_resource_with_lock+=1
		shared_resource_lock.release()

def decrement_with_lock():
	global shared_resource_with_lock
	for i in range(COUNT):
		shared_resource_lock.acquire()
		shared_resource_with_lock-=1
		shared_resource_lock.release()


### Without using locking mechanism
def increment_without_lock():
	global shared_resource_with_lock
	for i in range(COUNT):
		shared_resource_with_lock+=1


def decrement_without_lock():
	global shared_resource_with_lock
	for i in range(COUNT):
		shared_resource_with_no_lock-=1

if __name__ == "__main__":
	t1 = threading.Thread(target = increment_with_lock)
	t2 = threading.Thread(target = decrement_with_lock)
	t3 = threading.Thread(target = increment_without_lock)
	t4 = threading.Thread(target = decrement_without_lock)
	t1.start()
	t2.start()
	t3.start()
	t4.start()

	t1.join()
	t2.join()
	t3.join()
	t4.join()

	print("The value of shared variable with lock managment is %s" %shared_resource_with_lock )

	print("The value of shared variable with race condition is %s" %shared_resource_with_no_lock )
```

### Thread synchronization with Rlock

### Thread synchronization with semaphores

### Thread synchronization with a condition

### Thread synchronization with an event

### Using the with event

### Thread communication using a queue

### Evaluating the performance of multithread applications


