<!--ts-->
   * [Pytorch](#pytorch)
      * [Install](#install)
      * [Check version](#check-version)
      * [Basics - Tensors](#basics---tensors)
         * [Converting numpy arrays into tensors](#converting-numpy-arrays-into-tensors)
         * [Converting tensors into numpy arrays](#converting-tensors-into-numpy-arrays)
      * [matrix multiplication](#matrix-multiplication)
      * [Basic functions in pytorch](#basic-functions-in-pytorch)
      * [Concanting torches:](#concanting-torches)
      * [Batch normalization](#batch-normalization)
      * [Preprocessing](#preprocessing)
      * [Batch size](#batch-size)
      * [Load data](#load-data)
      * [Inspecting the weight and bias](#inspecting-the-weight-and-bias)
      * [Loss function](#loss-function)
         * [Negative log likelihood](#negative-log-likelihood)
      * [Optimizers](#optimizers)
         * [Check default values of an optimizer](#check-default-values-of-an-optimizer)
         * [The type of optimizers](#the-type-of-optimizers)
      * [Dropouts](#dropouts)
      * [preprocessing with transforms](#preprocessing-with-transforms)
      * [Augmentations](#augmentations)
      * [Transfer learning](#transfer-learning)
         * [Freezing the model](#freezing-the-model)
         * [Replacing the last two layers](#replacing-the-last-two-layers)
      * [Saving the model](#saving-the-model)
      * [Useful for plotting](#useful-for-plotting)
      * [Derivatives](#derivatives)
         * [Y(x)](#yx)
      * [Partial derivatives Y(x,z)](#partial-derivatives-yxz)
      * [Generate random numbers](#generate-random-numbers)
      * [Tensor to number](#tensor-to-number)
      * [Template for Regression](#template-for-regression)
      * [Integrating TensorBoard with pytorch](#integrating-tensorboard-with-pytorch)
      * [Segmentation with U-net  (Encoder-Decoder)](#segmentation-with-u-net--encoder-decoder)
      * [References](#references)

<!-- Added by: gil_diy, at: 2020-07-07T10:26+03:00 -->

<!--te-->

# Pytorch


## Install
Install `pip install torch torchvision`

## Check version
```python
print(torch.__version__)
print(torchvision.__version__)
```

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
torch.flatten(torch.arange(18).view(2,-1)) | Flattening a torch to 1 dimentional

## Concanting torches:

```python
tensor1 = torch.arange(6).view(2,-1)
tensor2 = torch.arange(30,36).view(2,-1)

print(torch.cat((tensor1,tensor2),0))
print(torch.cat((tensor1,tensor2),1))
```

`tensor([[0, 1, 2],
        [3, 4, 5]])`

`tensor([[30, 31, 32],
        [33, 34, 35]])`

Output of: **print(torch.cat((tensor1,tensor2),0))**

`tensor([[ 0,  1,  2],
        [ 3,  4,  5],
        [30, 31, 32],
        [33, 34, 35]])`

Output of: **print(torch.cat((tensor1,tensor2),1))**

`tensor([[ 0,  1,  2, 30, 31, 32],
        [ 3,  4,  5, 33, 34, 35]])`

## Batch normalization

We know a neural network learns the weights in our model become updated over each
epoch during training via the process of stochastic gradient descent or SGD so
what if during training one of the weights ends up becoming drastically
larger than the other weights well this large weight will then cause
the output from its corresponding neuron to be extremely large and this **imbalance**
will again continue to cascade through the neural network causing **instability**
this is where batch normalization comes into play batch norm is applied to
layers that you choose to apply it to within your network when applying batch
norm to a layer the first thing the **batch norm does is normalize the output
from the activation function**, as you recall activation functions that
the output from a layer is passed to an activation function which transforms the
output in some way depending on the function itself before being passed to
the next layer.

```python
nn.BatchNorm1d(4096) # 4096 number of features
```

[Explained well](https://www.youtube.com/watch?v=dXB-KQYkzNU)

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


## Optimizers

learned that, for us to get a good model, we need to minimize the errors that are calculated. Backpropagation is a method by which the neural networks learn from errors; the errors are used to modify weights in such a way that the errors are minimized. Optimization functions are responsible for modifying weights to reduce the error. Optimization functions calculate the partial derivative of errors
with respect to weights. The derivative shows the direction of a positive slope, and so we need to reverse the direction of the gradient. The optimizer function combines the model parameters and loss function to iteratively modify the model parameters to reduce the model error. Optimizers can be thought of as fiddling with the model weights to get the best possible model based on the difference in prediction from the model and the actual output, and the loss function acts as a guide by indicating when the optimizer is going right or wrong.


The learning rate is a hyperparameter of the optimizer, which controls the amount by which the weights are updated. The learning rate ensures that the weights are not updated by a huge amount so that the algorithm fails to converge at all and the error gets bigger and bigger; however at the same time, the updating of the weight should not be so low that it takes forever to reach the minimum of the cost function/error function.

### Check default values of an optimizer
```python
print(optimizer.defaults)
```

### The type of optimizers

* Adadelta
* Adagrad
* SGD

[Reference](https://pytorch.org/docs/stable/optim.html#torch.optim.Optimizer)


## Dropouts

Using a dropout is one of the most popular regularization techniques in neural networks, in which randomly selected neurons are turned off while training—that is, the contribution of neurons is temporarily removed from the forward pass and the backward pass doesn't affect the weights, so that no single neuron or subset of neurons gets all the decisive power of the model; rather, all the neurons are forced to make active contributions to predictions.

It should be remembered that dropouts are to be applied only while training; however, when testing and during the actual prediction, we want all of the neurons to make contributions.

We have to keep in mind that dropouts **must be applied only on
hidden layers** in order to prevent us from losing the input data and missing outputs.

```python
nn.Dropout(p=0.25)
```

## preprocessing with transforms

* Example of chaining multiple transforms:

```python
transforms.Compose([
  transforms.CenterCrop(10),
  transforms.Pad(1, 0),
  transforms.CenterCrop((10, 10))
  transforms.ToTensor(),
])
```

## Augmentations

Few exaples of transforms on the data to create more data from existing data:

```python
import torchvision

transforms.Compose([
  transforms.RandomCrop(10)
  transforms.RandomCrop((10,20))
  transforms.RandomHorizontalFlip(p=0.3)
  transforms.RandomVerticalFlip(p=0.3)
  
  # Adding brightness, contrast, saturation, and hue variations
  transforms.ColorJitter(0.25, 0.25, 0.25, 0.25)
  transforms.RandomRotation(10)
])
```

## Transfer learning
Transfer learning is an important concept in deep learning that has made it possible for us to use deep learning for various day-to-day tasks. It is a machine learning technique where a model trained for a task is reused to create a new model for a similar task. We take a
model trained on a large dataset and transfer its knowledge to a smaller dataset. For computer vision tasks with a convolutional neural network (CNN), we freeze the early convolutional layers of the network and only train the last few layers.

The early convolutional layers extract general, low-level features that are applicable across images for detecting edges, patterns, and gradients, while the later layers identify specific features within an image, and are specific to the dataset.


### Freezing the model

```python
my_model = models.resnet50(pretrained=True)

# freezes the weights of the model. By freezing the
# weights, the lower convolutional layers are not updated
for param in my_model.parameters():
  param.requires_grad = False
```

### Replacing the last two layers

We will apply transfer learning on Resnet50, the actual architecture can be seen easily with:
`print(my_model)`

The last two layers:

```
 (avgpool): AdaptiveAvgPool2d(output_size=(1, 1))
  (fc): Linear(in_features=2048, out_features=1000, bias=True)
```
we replaced the average pooling layer,
with our AdaptiveConcatPool2d layer and added a fully connected classifier with two output units for the two classes available.

```python
# Performs concatenation between Average 2D pooling and Max 2D pooling
class AdaptiveConcatPool2d(nn.Module):
    def __init__(self, sz=None):
        super().__init__()
        sz = sz or (1, 1)
        self.ap = nn.AdaptiveAvgPool2d(sz)
        self.mp = nn.AdaptiveMaxPool2d(sz)

    def forward(self, x):
        return torch.cat([self.mp(x), self.ap(x)], 1)
```


```python
my_model.avgpool = AdaptiveConcatPool2d()
my_model.fc = nn.Sequential(
  nn.Flatten(),
  nn.BatchNorm1d(4096),
  nn.Dropout(0.5),
  nn.Linear(4096, 512),
  nn.Relu(),
  nn.BatchNorm1d(512),
  nn.Dropout(p = 0.5),
  nn.Linear(512, 2),
  nn.LogSoftMax(dim=1)
)

```

## Saving the model
```python
torch.save(my_model.state_dict(), model_path)
```
[Reference](https://pytorch.org/tutorials/beginner/saving_loading_models.html)

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

## Integrating TensorBoard with pytorch

[Part1 : TensorBoard with PyTorch - Visualize Deep Learning Metrics](https://youtu.be/pSexXMdruFM)

[Part2 : Hyperparameter Tuning and Experimenting - Training Deep Neural Networks](https://youtu.be/ycxulUVoNbk?list=PLZbbT5o_s2xrfNyHZsM6ufI0iZENK9xgG)


## Segmentation with U-net  (Encoder-Decoder)

the popular model architecture for segmentation tasks is the so-called **encoder-decoder** model.
In the first half of the encoder-decoder model, the input image is downsized to a feature map using a few layers of convolution neural network and pooling layers.
In the second half of the model, the feature map is up-sampled to the input size to produce a binary mask.

## References

[Logo Detection Using PyTorch](https://medium.com/diving-in-deep/logo-detection-using-pytorch-7897d4898211)

[pytorch projects](https://github.com/bharathgs/Awesome-pytorch-list#cv)

[pytorch getting started in kaggle](https://www.kaggle.com/getting-started/123904)

[PyTorch-Computer-Vision-Cookbook - Github](https://github.com/PacktPublishing/PyTorch-Computer-Vision-Cookbook)

[PyTorch-Artificial-Intelligence-Fundamentals - Github](https://github.com/PacktPublishing/PyTorch-Artificial-Intelligence-Fundamentals)