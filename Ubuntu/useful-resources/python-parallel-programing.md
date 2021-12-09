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
      * [Process-Based Parallelism](#process-based-parallelism)
         * [Spawning a process](#spawning-a-process)
         * [Naming a process](#naming-a-process)
         * [Running process in the background](#running-process-in-the-background)
         * [Killing a process](#killing-a-process)
         * [Using a process in a subclass](#using-a-process-in-a-subclass)
         * [Exchanging objects between processes](#exchanging-objects-between-processes)
         * [Synchronizing processes](#synchronizing-processes)
         * [Managing a state between processes](#managing-a-state-between-processes)
         * [Using a process pool](#using-a-process-pool)
         * [Using a Thread pool](#using-a-thread-pool)

<!-- Added by: gil_diy, at: Thu 09 Dec 2021 19:35:22 IST -->

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

```python
import threading
import time
import random

semaphore = threading.Semaphore(0)

def consumer():
	print('Consumer is waiting.')
	## Acquire a semaphore
	semaphore.acquire()
	## The consumer ave access to the shared resource
	print("Consumer notify : consumed item number %s " %item)

def producer():
	global item
	time.sleep(10)
	## create a random item
	item = random.randint(0,1000)
	print("producer notify: producted item number %s" %item)

	## Release a semaphore, incrementing the internal counter by one.
	## when it was zero on entry and another thread is waitingfor it
	## to become larger than zero again, wake up that thread
	semaphore.release()
```


### Thread synchronization with a condition

```python
from threading import Thread, Condition
import time

items = []
condition  = Condition()

class consumer(Thread):
	def __init__(self):
		Thread.__init__(self)

	def consume(self):
		global condition
		global items

		condition.acquire()

		if len(items) == 0:
			condition.wait()
			print("Consumer notify: no items to consume")
		items.pop()
		print("Consumer notify : consumed 1 item")
		print("Consumer notify : items to consume are" +  str(len(items)))

		condition.notify()
		condition.release()


class producer(Thread):
	def __init__(self):
		Thread.__init__(self)

	def produce(self):
		global condition
		global items

		condition.acquire()
		if len(items) == 10:
			condition.wait()
			print("Producer notify : items produced are " + str(len(items)))
			print("Producer notify : stop the production!!")

		items.append(1)
		print("Producer notify : total items produced " + str(len(items)))
		condition.notify()
		condition.release()

```

### Thread synchronization with an event

### Using the with event

### Thread communication using a queue

### Evaluating the performance of multithread applications


## Process-Based Parallelism

### Spawning a process
```python
import multiprocessing

def my_func(i):
	print('called function in process: %s' %i)
	return

if __name__ == '__main__':
	Process_jobs = []
	for i in range(5):
		p = multiprocessing.Process(target = my_func,args=(i,))
		Process_jobs.append(p)
		p.start()
		p.join()
```

### Naming a process
```python
import multiprocessing
import time

def foo(i):
	name = multiprocessing.current_process().name
	print("Starting %s \n" %name)
	time.sleep(3)
	print("Exiting %s \n" %name)
	return

if __name__ == '__main__':
	process_with_name = multiprocessing.Process(name = 'foo_process', target = foo)
	process_with_name.daemon = True
	process_with_default_name = multiprocessing.Process(target = foo)
	process_with_name.start()
	process_with_default_name.start()
```
### Running process in the background

```python
import multiprocessing
import time

def foo(i):
	name = multiprocessing.current_process().name
	print("Starting %s \n" %name)
	time.sleep(3)
	print("Exiting %s \n" %name)
	return

if __name__ == '__main__':
	background_process = multiprocessing.Process(name = 'background_process', target = foo)
	background_process.daemon = True

	No_background_process = multiprocessing.Process(name = 'No_background_process', target = foo)
	No_background_process.daemon = False

	background_process.start()
	process_with_default_name.start()
```

### Killing a process
```python
import multiprocessing
import time

def foo():
	print('Starting function')
	time.sleep(0.1)
	print('Finished function')

if __name__=='__main__':
	p = multiprocessing.Process(target=foo)
	print('Process before execution', p, p.is_alive())

	p.start()
	print('Process running: ', p, p.is_alive())

	p.terminate()
	print('Process terminated: ', p, p.is_alive())

	p.join()
```

### Using a process in a subclass

```python

```

### Exchanging objects between processes

```python

```

### Synchronizing processes

```python

```

### Managing a state between processes

```python

```

### Using a process pool
We create a pool of four processes shown here and then we use the pool's map method
to perform a simple calculation
```python
import multiprocessing

def func_square(data):
	result = data * data
	return result


if __name__ == '__main__':
	inputs = list(range(0,100))
	pool = multiprocessing.Pool(processes=4)
	pool_outputs = pool.map(func_square, inputs)

	pool.close()
	pool.join()

	print('Pool:  ', pool_outputs)

```

### Using a Thread pool

The best practice is using the `concurrent.futures.ThreadPoolExecutor()`
and using the `concurrent.futures.as_completed()`

```python
import concurrent.futures

with concurrent.futures.ThreadPoolExecutor() as executor: 
    results = [executor.submit(map_function, element) for element in input_data]


```