<!--ts-->
   * [Pytorch](#pytorch)
      * [Install](#install)
      * [Basics - Tensors](#basics---tensors)
         * [Converting numpy arrays into tensors](#converting-numpy-arrays-into-tensors)
         * [Converting tensors into numpy arrays](#converting-tensors-into-numpy-arrays)
      * [matrix multiplication](#matrix-multiplication)
      * [Derivatives](#derivatives)

<!-- Added by: gil_diy, at: 2020-05-08T15:01+03:00 -->

<!--te-->

# Pytorch


## Install
Install `pip install torch torchvision`


## Basics - Tensors
```python
import torch


my_vec = torch.tensor([56,15,13])
print(my_vec[1])

float_vector = torch.FloatTensor([1,2,3,4,5,6])
print(float_vector.dtype)
print(float_vector.size())

# Reshaping in torch 
my_vec.view(6,1) # Converting to 6 rows 1 column
my_vec.view(3,2) # Converting to 3 rows 2 column
my_vec.view(3,-1) # Will figure out how much columns need for given 3 rows.
```


### Converting numpy arrays into tensors
```python
my_array = np.array([1,2,3,4,5])
tensor_converted = torch.from_numpy(my_array)
print(tensor_converted)
print(tensor_converted.type())
```

### Converting tensors into numpy arrays

```python
numpy_converted = torch.numpy()
print(numpy_converted)
```


##

```python
t_one = torch.tensor([1,2,3])
t_two = torch.tensor([5,10,15])

print(t_one*t_two)

print(5*t_one)

dot_product = torch.product(t_two, t_two) # 1+5+2*10+3*15
print(dot_product)
```

## matrix multiplication 
```python
mat_a = torch.tensor([0,3,5,5,5,2]).view(2,3)
mat_a = torch.tensor([3,4,3,-2,4,-2]).view(3,2)

torch.matmul(mat_a,mat_b) # Equivalent to mat_a @ mat_b

```

```python
torch.linespace(0,10,5) # Useful for plotting
```


```python
one_d = torch.arange(2, 7)

two_d = torch.view(3,3) # reshaping
print(two_d.dim())


x = torch.arange(0, 18).view(3,3)
print(x.dim())
```


## Derivatives
```python

```

```python
import torch
import torchvision
from torchvision import transforms, datasets
```
