<!--ts-->
   * [Pytorch](#pytorch)
      * [Install](#install)
      * [Basics - Tensors](#basics---tensors)
         * [Converting numpy arrays into tensors](#converting-numpy-arrays-into-tensors)
         * [Converting tensors into numpy arrays](#converting-tensors-into-numpy-arrays)
      * [matrix multiplication](#matrix-multiplication)
      * [Basic functions in pytorch](#basic-functions-in-pytorch)
      * [Preprocessing](#preprocessing)
      * [Batch size](#batch-size)
      * [Load data](#load-data)
      * [Inspecting the weight and bias](#inspecting-the-weight-and-bias)
      * [Loss function](#loss-function)
         * [Negative log likelihood](#negative-log-likelihood)
      * [Useful for plotting](#useful-for-plotting)
      * [Derivatives](#derivatives)
         * [Y(x)](#yx)
      * [Partial derivatives Y(x,z)](#partial-derivatives-yxz)
      * [Generate random numbers](#generate-random-numbers)
      * [Tensor to number](#tensor-to-number)
      * [Template for Regression](#template-for-regression)
      * [References](#references)

<!-- Added by: gil_diy, at: 2020-07-02T12:53+03:00 -->

<!--te-->

# Pytorch


## Install
Install `pip install torch torchvision`


## Basics - Tensors
```python
import torch

my_vec = torch.tensor([56, 15, 13])
print(my_vec[1])

float_vector = torch.FloatTensor([1, 2, 3, 4, 5, 6])
print(float_vector.dtype)
print(float_vector.size())

# View the data differently
print(float_vector.view(6, 1))   # See with 6 rows 1 column
print(float_vector.view(3, 2))   # See with 3 rows 2 column
print(float_vector.view(3, -1))  # See with 3 rows 2 column (was calculated)

one_d = torch.arange(2, 7)

two_d = one_d.view(3,3) # reshaping
print(two_d.dim())


x = torch.arange(0, 18).view(3,3)
print(x.dim())
```

Example what would be the output of the following snippet?
```python
x = torch.arange(18).view(3, 2, 3)
print(x)
```
**Output would be:**
```python
[[[ 0,  1,  2],
 [ 3,  4,  5]],

[[ 6,  7,  8],
 [ 9, 10, 11]],

[[12, 13, 14],
 [15, 16, 17]]]
```

Example what would be the output of the following snippet?
```python
x = torch.arange(18).view(3, 2, 3)
print(x[1,0:2,1])
```

Output will be the number **10** .

### Converting numpy arrays into tensors

```python
my_array = np.array([1,2,3,4,5])
my_tensor_converted = torch.from_numpy(my_array)
print(my_tensor_converted)
print(my_tensor_converted.type())
```

### Converting tensors into numpy arrays

```python
numpy_converted = my_tensor_converted.numpy()
print(numpy_converted)
```


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

## Basic functions in pytorch

Example | Explanantion
------------|-----
torch.ones((2,3)) | return a tensor that contains ones and has a default **float datatype**.
torch.ones((2,3), dtype=torch.int8) | Tensor consisting of only integer ones.
torch.zeros((2,3), dtype=torch.int8)  | Tensor consisting of only integer zeros.
torch.full((2,3), 3.141) | Tensor with required fill value along with the shape
torch.empty((2,3)) | Create empty tensor filled with uninitialzed data
torch.rand((2,3))| Tensor from a **uniform distribution** from [0, 1]
torch.randn((2,3))| Tensor with mean 0 and variance 1 from **normal distribution**
torch.randint(10,100,(2,3))| Tensor from a given range between 10 to 100
my_tensor.shape | The shape of `my_tensor` tensor
my_tensor.dtype | The datatype of `my_tensor` tensor
torch.ones_like(my_tensor) | Create a new tensor that matches `my_tensor` attributes (shape and datatype) with all ones.


## Preprocessing
There is a module called `transforms` that helps with a lot of
image preprocessing tasks.

[Reference](https://pytorch.org/docs/stable/torchvision/transforms.html)


we first need to read from the image and convert it
into a tensor using a transforms.ToTensor() transform. We then make the mean and standard deviation of the pixel values 0.5 and 0.5 respectively so that it becomes easier for the model to train;
```python
relevant_transform = transforms.Compose([transforms.ToTensor(),
                                         transforms.Normalize(mean=(0.5,), std=(0.5,))
                                         ])
```


* We combine all of the transformations together with `transform.Compose()`

## Batch size
A higher batch size means that the model has fewer training steps and learns faster, whereas a high batch size results in high memory requirements.

## Load data

## Inspecting the weight and bias
You can access the weight and bias tensors from the model object with `<my_model>.<layer_name>.weight` and `<my_model>.<layer_name>.bias`


## Loss function
Defining the loss function A machine learning model, when being trained, may have some deviation between the predicted output and the actual output, and this difference is called the **error** of the model. The function that lets us calculate this error is called the **loss function**, or error function.
This function provides a metric to evaluate all possible solutions and choose the most optimized model. The loss function has to be able to reduce all attributes of the model down to a single number so that an improvement in that loss function value is
representative of a better model.

### Negative log likelihood

We therefore use negative log likelihood when dealing with log softmax, as softmax is not compatible. It is useful in classification between n number of classes. The log would ensure
that we are not dealing with very small values between 0 and 1, and negative values would ensure that a logarithm of probability that is less than 1 is nonzero. Our goal would be to reduce this negative log loss error function. In PyTorch, the loss function is called a
criterion, and so we named our loss function criterion.

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/neural-networks/neg_log.png" title="tool tip here">
</p>

The negative log-likelihood becomes unhappy at smaller values, where it can reach infinite unhappiness (that’s too sad), and becomes less unhappy at larger values. Because we are summing the loss function to all the correct classes, what’s actually happening is that whenever the network assigns high confidence at the correct class, the unhappiness is low, but when the network assigns low confidence at the correct class, the unhappiness is high.

In PyTorch, the loss function is called a **criterion**, and so we named our loss function criterion.

[Reference](https://ljvmiranda921.github.io/notebook/2017/08/13/softmax-and-the-negative-log-likelihood/)

## Useful for plotting
```python
torch.linespace(0,10,5) # Useful for plotting
```

## Derivatives
Let's calculate the derivative of the function **y** at x=2.0 , 
We should use the flag: `requires_grad` and set it to **True** .

### Y(x)
```python
# we will add a new key that lets
# PyTorch know that it needs to perform gradient calculations on the following
# tensor:
x = torch.tensor(2.0, requires_grad = True) # important for calculating the derivative 
y = 9*x**4 + 2*x**3 + 3*x**2+6*x+1
y.backward()
x.grad
```

The output we got is the gradient/derivative in x=2.0 ( y'(x=2) ) which is:  **tensor(330.)**

## Partial derivatives Y(x,z)
```python
x = torch.tensor(1.0, requires_grad = True) # important for calculating the derivative 
z = torch.tensor(2.0, requires_grad = True) # important for calculating the derivative 

y = x**2 + z**3
y.backward()
print("derivative_for_two_variables, result x.grad: ", x.grad)
print("derivative_for_two_variables, result z.grad: ", z.grad)
```

## Generate random numbers

Generate 100 random numbers between 0 to 10
```python
torch.randn(100, 1) * 10
```

## Tensor to number

```python
my_tensor.item()
```

```python
import torch
import torchvision
from torchvision import transforms, datasets
```


## Template for Regression 

```python
import torch.nn as nn

loss_function = nn.BCELoss()
optimizer = torch.optim.SGD(model.parameters(), lr=0.01)

epochs = 1000
losses = []

for i in range(epochs):
    y_pred = model.forward(x_data)
    loss = loss_function(y_pred, y_data)
    print("epoch: ", i, "loss", loss.item())

    losses.append(loss.item())
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()
```

## References
[Logo Detection Using PyTorch](https://medium.com/diving-in-deep/logo-detection-using-pytorch-7897d4898211)

[pytorch projects](https://github.com/bharathgs/Awesome-pytorch-list#cv)

[pytorch getting started in kaggle](https://www.kaggle.com/getting-started/123904)