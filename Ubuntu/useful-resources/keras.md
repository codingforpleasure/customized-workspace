<!--ts-->
<!--te-->


## How Neural Networks are built with Keras?

1. Initialize the model
2. Add the input layer (Specify number of neurons and activation function for each layer)
3. Add the hidden layers (Specify number of neurons and activation function for each layer)
4. Add the output layer (Specify number of neurons and activation function for each layer)
5. Choose loss function and optimizer
6. Train model
7. Test model
8. Try to improve model


## Possible Model improvements
* Try adding more hidden layers
* Try changing the kernel initializer
* Try increasing the number of neurons
* Try using one of the improved gradient descent optimizers

## Activation functions

### sigmoid

<p align="center">
  <img src="images/sigmoid_example.png" title="sigmoid">
</p>


* The sigmoid outputs always a value of zero to one
* Usually used on output layer, not on the hidden layer.

### Hyperbolic tangent

<p align="center">
  <img src="images/tangh_example.png" title="Hyperbolic tangent">
</p>


* The Hyperbolic tangent outputs always a value between -1 to 1,
* Better for back propogation.


### Relu (Rectified Linear Unit)

<p align="center">
  <img src="images/Relu_example.png" title="Rectified Linear Unit">
</p>


* it is less expensive (computer power)
* It leads to sparse neural networks which redice complexity
* It doesn't have vanishing gradient problem


### Loss functions

<p align="center">
  <img src="images/Loss_functions.png" title="Rectified Linear Unit">
</p>

network = models.Sequential()
network.summary()


## Keras implementation
*  Choose a loss function: MAE, MSE
*  Choose an optimizer: RMSprop, Adam



## Convolutional neural networks (*convents*)
A type of deep-learning model almost universally used in comuter vision applications.

**Ho does convent look like?**
It's a stack of Conv2D and MaxPooling2D layers.

```python
from keras import layers
from keras import models

model = models.Sequential() # Linear stack of layers

model.add(layers.Conv2D(32, (3, 3), activation='relu', input_shape=(28, 28, 1)))
model.add(layers.MaxPooling2D((2, 2)))
model.add(layers.Conv2D(64, (3, 3), activation='relu'))
model.add(layers.MaxPooling2D((2, 2)))
model.add(layers.Conv2D(64, (3, 3), activation='relu'))
```
I can I easily the by entering `model.summary()`, the output of every Conv2D and MaxPooling2D layer is a 3D tensor of shape (height, width, channels). The width and height dimensions tend to shrink as you go deeper in the network.

