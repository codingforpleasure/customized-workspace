<!--ts-->
   * [Numpy Introduction](#numpy-introduction)
      * [Why use numpy?](#why-use-numpy)
         * [Data representation](#data-representation)
            * [Key attributes](#key-attributes)
         * [Creating](#creating)
         * [Forming](#forming)
            * [Stack 1-D arrays as columns into a 2-D array.](#stack-1-d-arrays-as-columns-into-a-2-d-array)
         * [Retrieving info about an array](#retrieving-info-about-an-array)
         * [Transpose a matrix/array](#transpose-a-matrixarray)
         * [Aggregation functions](#aggregation-functions)
         * [Aggregation functions exmaple on matrix:](#aggregation-functions-exmaple-on-matrix)
         * [Unique and Other Set Logic](#unique-and-other-set-logic)
            * [sorted unique values in an array](#sorted-unique-values-in-an-array)
         * [Iterating easily over an array](#iterating-easily-over-an-array)
         * [Fancy indexing](#fancy-indexing)
            * [<strong>1. Select some rows</strong>](#1-select-some-rows)
            * [<strong>2. Select some rows and specific column</strong>](#2-select-some-rows-and-specific-column)
            * [<strong>3. Select some rows and columns</strong>](#3-select-some-rows-and-columns)
            * [<strong>4. Some simple slicing</strong>](#4-some-simple-slicing)
            * [<strong>5. argmin, argmax, argsort</strong>](#5-argmin-argmax-argsort)
      * [reshape](#reshape)
      * [Multiplication:](#multiplication)
         * [Vectorized dot product of vectors](#vectorized-dot-product-of-vectors)
         * [Vectorized outer product](#vectorized-outer-product)
         * [Vectorized elementwise multiplication](#vectorized-elementwise-multiplication)
         * [Vectorized general dot product](#vectorized-general-dot-product)
      * [Vector Math](#vector-math)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: 2019-11-04T21:11+02:00 -->

<!--te-->


# Numpy Introduction

Numpy uses **ndarray** which is much more efficient way of storing and manipulating "numerical data" than the built-in Python data structure.


## Why use numpy?

Numpy arrays are much faster,
let's see an example:

```python
my_list = range(10000)
my_array = np.arange(10000)

timeit [i**2 for o in my_list]
timeit my_array**2
```
**If you'll run it, you can easily see the numpy array is much much faster than the list!!**


### Data representation

Data is stored in multidimensional Numy arrays, also called **tensors** .
tensor is a container for data and a generalization of matrices to an arbitrary number of dimensions.


**(note that in the context of tensors, a dimension is often called an axis)**

Description | result | x.ndim
-----------|------------|-----
Scalars (0D tensors) | x = np.array(12) | 0
Vectors (1D tensors) | x = np.array([12,3,6,14]) |  1
Matrices (2D tensors) | x = np.array([[12,3,6,14],[5,16,18,79]]) | 2
Cubes (3D tensors) | x = np.array([ [[12,3,6,14],[5,16,18,79]] ,  [[1,3,0,1],[0,16,3,79]] , [[3,3,3,7],[0,0,18,9]] ]) | 3


Type | Real world example
-----|-------------------
Vector (2D tensors)| (samples, features)
Timeseries (3D tensors)| (samples, timestamps, features)
Images (4D tensors) | (samples, height, width, channels)
Video (5D tensors)| (samples, frames, height, width, channels)


#### Key attributes

1. **Number of axes (rank)** - Number of dimensions
2. **Shape** - A tuple of integers that describes how many dimensions the tensor **has along each axis**
3. **Data type (usually called **dtype**)** - This is the type of the data contianed in the tensor,
float32, uint8, float64 etc..

### Creating

Description | command
------------------------------------|-----
Create Ndarray | np.array([1,3,5])
 | np.array([[1,3,5],[11,31,215]])
 |
Create Special Ndarray | np.zeros(10)  #one dimentional ndarray with 10 elements of value 0
| np.ones((2,3))  #two dimentional ndarray with 6 elements of value 1, **please notice** i'm passing tuple.
|
Create range of numbers in an Ndarray | np.arange(10)
Create a **column** vector with **random** numbers | a = np.random.randn(5, 1)
Create a **row** vector with **random** numbers | a = np.random.randn(1, 5)
Create a matrix with **random** numbers | a = np.random.randn(5, 3) # 5 Rows, 3 columns
Rehsape array to matrix 2x5 | np.arange(10).reshape(2, 5)
							| np.arange(10).reshape(2, -1)      (**Read tip #2**)
|
Concatenation, or joining of two arrays |  x = np.array([1, 2, 3])
| y = np.array([3, 2, 1])
| np.concatenate([x, y])


**Tip #1** : A greate way to make sure is by using assert:

```python
assert(a.shape == (5,1))
```

*** **Tip #2**: When you are dealing with many dimensions and you would like to reshape it to you can enter the dimension size either rows or columns and the other will be -1, numpy will figure out what the value should be for rehsaping properly (well explained [here](https://stackoverflow.com/questions/18691084/what-does-1-mean-in-numpy-reshape))

```python
# data.shape = (963,64,64,3)
# for rehsaping it to 963 columns of length (64*64*3)
data.reshape((-1,data.shape[0])

```

### Forming

```python
a = np.array((1, 2, 3))
b = np.array((2, 3, 4))
c = np.array((5, 6, 7))
np.stack((a, b, c))
```

The output would be:
```python
array([[1, 2, 3],
       [2, 3, 4],
       [5, 6, 7]])
```
* by default the command stack uses: axis = 0

```python
np.stack((a, b,c), axis = 1)
```
with axis = 1 (stacking as columns), will get:

```python
array([[1, 2, 5],
       [2, 3, 6],
       [3, 4, 7]])
```

#### Stack 1-D arrays as columns into a 2-D array.
```python
a = np.array((1, 2, 3))
b = np.array((2, 3, 4))
np.column_stack((a, b))
```

The output would be:
```python
array([[1, 2],
       [2, 3],
       [3, 4]])
```
### Retrieving info about an array

```python
my_mat = np.array([[1,3,5],[6,16,2]])
m2 = np.arange(8)
```
```python
my_array = np.array([[-5, -6, 3], [1, 3, -9], [2, -9, -23]])

my_array > 0
```
The output would be:

```python
array([[False, False,  True],
       [ True,  True, False],
       [ True, False, False]])
```

To find the coordinates (row number, column number) just use `np.where(mat > 0)`:

```python
(array([0, 1, 1, 2]), array([2, 0, 1, 0]))
```

### Transpose a matrix/array



```python
array1 = np.array([[1.],[2.]])
array1_transpose = array1.T
```


Description | command
------------|---------
Get array's dimensions | my_mat.ndim
Get Shape | my_mat.shape # The returned tuple will hold ndim numbers
| i.e: for my_mat it returns: (2, 3)
|
Get number of elements in an array | my_mat.size
Get data type in this array | my_mat.dtype

* Note: If image is grayscale, tuple returned contains only number of rows and columns. So it is a good method to check if loaded image is grayscale or color image.

Description | command
------------|---------
Get array's dimensions | my_mat.ndim

### Aggregation functions

let's assume we have an array:
```python
vec = np.arange(10) # So vec holds: [0 1 2 3 4 5 6 7 8 9]
```

Description | command   | result
-----------|------------|-----
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

### Aggregation functions exmaple on matrix:

For example:

<p align="center" style="width:400px;" >
  <img src="images/numpy/fruits.png" title="tool tip here">
</p>

```python
# Each column presents a fruit
data = np.array([56.0, 0.0, 4.4, 68.0],
				[1.2, 104.0, 52.0, 8.0],
				[1.8, 135.0, 99.0, 0.9])

print(data)

# Let's sum up the colories for each fruit:
cal = data.sum(axis=0)
print(cal)

precentage = 100*data/cal # Using broadcasting
print(precentage)
```


### Unique and Other Set Logic

#### sorted unique values in an array

```python
names = np.array(['Bob', 'Joe', 'Will', 'Bob', 'Will', 'Joe', 'Joe'])
np.unique(names)
```
The output would be:

```python
array(['Bob', 'Joe', 'Will'], dtype='<U4')
```

Here are few more operations on sets:

Description | command
-----------|------------
unique(x) | Compute the sorted, unique elements in x
intersect1d(x,y) | Compute the sorted, common elements in x and y
union1d(x,y) | Compute the sorted union of elements
in1d(x,y) | Compute a boolean array indicating whether each element of x is contained in y
setdiff1d(x, y) | Set difference, elements in x that are not in y


### Iterating easily over an array

Avoid using nested loop,
numpy has a built in function `ndindex`:

```python
for i in np.ndindex(B.shape):
    print i, B[i]
```

### Fancy indexing

Given the matrix:

```python
my_mat = np.array([[1,8,15,16],[17,58,854,11],[485,78,86,33]])
```

#### **1. Select some rows**
```python
print(my_mat[[0,1,2], :])
```

#### **2. Select some rows and specific column**

```python
print(my_mat[[0,1,2], 2])
```

#### **3. Select some rows and columns**

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
#### **4. Some simple slicing**
suppose one wanted to square all the negative values in an array. Short of writing a loop in python, one wants to be able to locate the negative values, extract them, square them, and put the new values where the old ones were:

```python
result=original.copy()
result[result<0] ** = 2
```
#### **5. argmin, argmax, argsort**

Those functions returns the actual indexes:

```python
my_array = np.array([[1,5,3], [10,1,2], [10,30,20]])

np.argmax(my_array, axis = 0)  # Find max in each column: array([1, 2, 2])
np.argmax(my_array, axis = 1)  # Find max in each row: array([1, 0, 1])

```

```python
my_vec = np.array([1,5,3,56,4,7,43])
indexes = np.argsort(mt_vec) # result: array([0, 2, 4, 1, 5, 6, 3])
```

###random

```python
seed = 1
np.random.seed = seed
np.random.shuffle(messages)
```

## reshape

Make sure your matrices are the size you want it to be

```python
# Argument: image - a numpy array of shape (length, height, depth)
# Returns:   v -  a vector of shape (length*height*depth, 1)
def image2vector(image):
    v = image.reshape((np.prod(image.shape),1))
    return v

image = np.array([[[ 0.67826139,  0.29380381],
        [ 0.90714982,  0.52835647],
        [ 0.4215251 ,  0.45017551]],

       [[ 0.92814219,  0.96677647],
        [ 0.85304703,  0.52351845],
        [ 0.19981397,  0.27417313]],

       [[ 0.60659855,  0.00533165],
        [ 0.10820313,  0.49978937],
        [ 0.34144279,  0.94630077]]])

print ("image2vector(image) = " + str(image2vector(image)))
```

A trick when you want to flatten a matrix X of shape (a,b,c,d) to a matrix
X_flatten of shape (b ∗∗ c ∗∗ d, a) is to use:
```python
X_flatten = X.reshape(X.shape[0], -1).T      # X.T is the transpose of X
```

## Multiplication:

### Vectorized dot product of vectors
The dot product or **scalar product** is an algebraic operation that takes two equal-length sequences of numbers (usually coordinate vectors) and returns a single number.
```python
x1 = np.array([5,6,7,8])
x2 = np.array([0,2,4,2])
dot_res = np.dot(x1,x2)

# Therefore the result would be: dot_res = 5*0+6*2+7*8+8*2=> 84
```

<p align="center" style="width:400px;" >
  <img src="images/numpy/dot_product.png" title="tool tip here">
</p>


Another example:

```python
mat1 = np.array([[1, 2, 3],[4,5,6]],[1,6,2]) # mat1.shape => (2,3)
mat2 = np.array([[7, 8],[9,10],[11,12]]) # mat2.shape => (3,2)

dot_res = np.dot(mat1,mat2)

# dot_res = array([[ 58,  64],
#                  [139, 154],
#                  [ 83,  92]])

# dot_res.shape => (3,2)
```
### Vectorized outer product

The outer product of two coordinate vectors is a matrix. If the two vectors have dimensions n and m, then their outer product is an **n × m matrix**

<p align="center" style="width:900px;" >
  <img src="images/numpy/outer_product.png" title="tool tip here">
</p>


```python
x1 = np.array([5, 6, 7])
x2 = np.array([0, 2, 4, 2])
outer_res = np.outer(x1,x2)

# outer_res = array([[ 0, 10, 20, 10],
#                    [ 0, 12, 24, 12],
#                    [ 0, 14, 28, 14]])
```

it's equivalent to this:
```python
outer = np.zeros((len(x1),len(x2))) # we create a len(x1)*len(x2) matrix with only zeros
for i in range(len(x1)):
    for j in range(len(x2)):
        outer[i,j] = x1[i]*x2[j]
```

### Vectorized elementwise multiplication
The same as "a*b" which performs an element-wise multiplication.

```python
x1 = np.array([11, 3, 9])
x2 = np.array([7, 5, 3])
elementwise_res = np.multiply(x1,x2)

# elementwise_res = array([77, 15, 27])
```

it's equivalent to this:
```python
for i in range(len(x1)):
    mul[i] = x1[i]*x2[i]
```


### Vectorized general dot product
```python
x1 = [9, 2, 5, 0, 0, 7, 5, 0, 0, 0, 9, 2, 5, 0, 0]
W = np.random.rand(3,len(x1)) # Random 3*len(x1) numpy array
dot = np.dot(W,x1)
```

it's equivalent to this:
```python
gdot = np.zeros(W.shape[0])
for i in range(W.shape[0]):
    for j in range(len(x1)):
        gdot[i] += W[i,j]*x1[j]
```



**The difference** : np.dot(a,b) performs a matrix multiplication on a and b, whereas "a*b" performs an element-wise multiplication.


```python
a = np.random.randn(4, 3) # a.shape = (4, 3)
b = np.random.randn(3, 2) # b.shape = (3, 2)
c = a*b
```

This **would fail** since **broadcast can't be done** .

## Vector Math



## Reference

**Very useful:**

[NumPy Cheat Sheet](https://www.dataquest.io/blog/numpy-cheat-sheet/)
