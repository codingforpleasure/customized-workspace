<!--ts-->
<!--te-->


### Introduction

Numpy uses **ndarray** which is much more efficient way of storing and manipulating "numerical data" than the built-in Python data structure.



Description | command
------------------------------------|-----
Create Ndarray | np.array([1,3,5])
Create Special Ndarray | np.zeros(10)  #one dimentional ndarray with 10 elements of value 0
					   | np.ones(2,3)  #two dimentional ndarray with 6 elements of value 1
Create range of numbers in an Ndarray | np.arange(10)
Rehsape arrays | np.arange(10).reshape(2, 5)
Concatenation, or joining of two arrays |  x = np.array([1, 2, 3])
| y = np.array([3, 2, 1])
| np.concatenate([x, y])


#### Aggregation functions

Description | command
------------------------------------|-----
Compute sum of elements | np.sum
Compute product of elements | np.prod
Compute median of elements | np.mean
Compute standard deviation | np.std
Compute variance | np.var
Compute minimum value | np.min
Compute maximum value | np.max
Find index of minimum value | np.argmin
Find index of maximum value | np.argmax
Compute median value | np.median
Evaluate weteher any elements are true | np.any
Evaluate wether all elements are true | np.all






