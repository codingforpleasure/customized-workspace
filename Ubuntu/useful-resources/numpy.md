<!--ts-->
  * [Introduction](#introduction)
     * [Why use numpy?](#why-use-numpy)
        * [Creating](#creating)
        * [Retrieving info about an array](#retrieving-info-about-an-array)
        * [Aggregation functions](#aggregation-functions)
        * [Iterating easily over an array](#iterating-easily-over-an-array)
        * [Fancy indexing](#fancy-indexing)
           * [<strong>1. Select some rows</strong>](#1-select-some-rows)
           * [<strong>2. Select some rows and specific column</strong>](#2-select-some-rows-and-specific-column)
           * [<strong>3. Select some rows and columns</strong>](#3-select-some-rows-and-columns)
           * [<strong>4. Some simple slicing</strong>](#4-some-simple-slicing)
           * [<strong>5. argmin, argmax, argsort</strong>](#5-argmin-argmax-argsort)

<!-- Added by: gil_diy, at: 2018-08-13T23:18+03:00 -->

<!--te-->


## Introduction

Numpy uses **ndarray** which is much more efficient way of storing and manipulating "numerical data" than the built-in Python data structure.


### Why use numpy?

Numpy arrays are much faster,
let's see an example:

```python
my_list = range(10000)
my_array = np.arange(10000)

timeit [i**2 for o in my_list]
timeit my_array**2
```
**If you'll run it, you can easily see the numpy array is much much faster than the list!!**

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
Get Shape | my_mat.shape # The returned tuple will hold ndim numbers
		| i.e: for my_mat it returns: (2, 3)
Get number of elements in an array | my_mat.size
Get data type in this array | my_mat.dtype


Description | command
------------|---------
Get array's dimensions | my_mat.ndim

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


#### Iterating easily over an array

Avoid using nested loop,
numpy has a built in function `ndindex`:

```python
for i in np.ndindex(B.shape):
    print i, B[i]
```

#### Fancy indexing

Given the matrix:

```python
	my_mat = np.array([[1,8,15,16],
					   [17,58,854,11],
					   [485,78,86,33]])
```

##### **1. Select some rows**
```python
print(my_mat[[0,1,2], :])
```

##### **2. Select some rows and specific column**

```python
print(my_mat[[0,1,2], 2])
```

##### **3. Select some rows and columns**

This:

```python
print a[[0,1,2], [0,2]]
```

**Will fail miserably with:**

**"IndexError: shape mismatch: indexing arrays could not be broadcast together with shapes"**


For picking both rows and columns, should use the built-in **`np.ix_`**:

**ix_** one can quickly construct index arrays that will index the **cross product**.

So **a[np.ix_([0,1,2],[0,2])]** returns the array: **[a[0,0] a[0,2], [a[1,0], a[1,2], a[1,2], a[2,0], a[2,2]]**

```python
print(my_mat[np.ix_([0,1,2],[0,2])])
```
##### **4. Some simple slicing**
suppose one wanted to square all the negative values in an array. Short of writing a loop in python, one wants to be able to locate the negative values, extract them, square them, and put the new values where the old ones were:

```python
result=original.copy()
result[result<0] ** = 2
```
##### **5. argmin, argmax, argsort**

Those functions returns the actual indexes:

```python
my_array = np.array([[1,5,3],
					[10,1,2],
					[10,30,20]])

np.argmax(my_array, axis = 0)  # Find max in each column: array([1, 2, 2])
np.argmax(my_array, axis = 1)  # Find max in each row: array([1, 0, 1])

```

```python
my_vec = np.array([1,5,3,56,4,7,43])
indexes = np.argsort(mt_vec) # result: array([0, 2, 4, 1, 5, 6, 3])
```
