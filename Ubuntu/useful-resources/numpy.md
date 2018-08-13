<!--ts-->
<!--te-->


### Introduction

Numpy uses **ndarray** which is much more efficient way of storing and manipulating "numerical data" than the built-in Python data structure.




#### Creating

Description | command
------------------------------------|-----
Create Ndarray | np.array([1,3,5])
 | np.array([[1,3,5],[11,31,215]])
Create Special Ndarray | np.zeros(10)  #one dimentional ndarray with 10 elements of value 0
					   | np.ones(2,3)  #two dimentional ndarray with 6 elements of value 1
Create range of numbers in an Ndarray | np.arange(10)
Rehsape arrays | np.arange(10).reshape(2, 5)
Concatenation, or joining of two arrays |  x = np.array([1, 2, 3])
| y = np.array([3, 2, 1])
| np.concatenate([x, y])


#### Retrieving info about an array

```python
my_mat = np.array([[1,3,5],[6,16,2]])
m2 = np.arange(8)
```

Description | command
------------|---------
Get array's dimensions | my_mat.ndim
Get Shape | rows, columns = my_mat.shape
Get number of elements in array | my_mat.size
Get data type in this array | my_mat.dtype

Numpy arrays are much faster,
let's see an example:

```python
my_list = range(10000)
my_array = np.arange(10000)

timeit [i**2 for o in my_list]
timeit my_array**2
```
**If you'll run it, you can easily see the numpy array is much much faster than the list!!**


#### Aggregation functions

let's assume we have an array:
```python
	vec = np.arange(10) # So vec holds: [0 1 2 3 4 5 6 7 8 9]
```

Description | command   | result
------------------------------------|-----|
Compute sum of elements | np.sum(vec) | 45
Compute product of elements | np.prod(vec) | 362,880
Compute median of elements | np.mean(vec) | 4.5
Compute standard deviation | np.std(vec)
Compute variance | np.var(vec)
Compute minimum value | np.min(vec) | 0
Compute maximum value | np.max(vec) | 9
Find index of minimum value | np.argmin(vec) | 0
Find index of maximum value | np.argmax(vec) | 9
Compute median value | np.median(vec) | 5
Evaluate whether any elements are true | np.any(vec > 5) True
Evaluate whether all elements are true | np.allnp.any(vec > -1) | True






