
<!--ts-->
   * [CNN](#cnn)
      * [What are the effects of the kernel?](#what-are-the-effects-of-the-kernel)
      * [Features/Activation maps and image features](#featuresactivation-maps-and-image-features)
      * [Designing feature maps](#designing-feature-maps)
         * [Depth](#depth)
         * [Stride](#stride)
         * [Zero-Padding](#zero-padding)
         * [Calculating our Convolution Output](#calculating-our-convolution-output)
      * [ReLU the Activation layer of choice for CNNs](#relu-the-activation-layer-of-choice-for-cnns)
      * [Pooling](#pooling)
      * [Recap](#recap)
      * [The Fully connected (FC) Layer (final Layer)](#the-fully-connected-fc-layer-final-layer)
      * [Training CNNs](#training-cnns)
      * [Basic CNN Design Rules](#basic-cnn-design-rules)
      * [Building a CNN in Keras](#building-a-cnn-in-keras)
         * [Loading out data](#loading-out-data)
         * [Hot One Encoding](#hot-one-encoding)
         * [building &amp; compiling our model](#building--compiling-our-model)
            * [Demo](#demo)
         * [Training our classifier](#training-our-classifier)
         * [Plotting loss and accuracy Charts](#plotting-loss-and-accuracy-charts)
         * [Saving and loading your model](#saving-and-loading-your-model)
         * [Displaying your model visually](#displaying-your-model-visually)

<!-- Added by: gil_diy, at: 2020-03-31T00:55+03:00 -->

<!--te-->
# CNN

## What are the effects of the kernel?

- Depending on the values on the kernel,
we produce different maps. Applying our kernel produces scalar ourput as we just saw.

- Concolcing with different kernels produces intresting feature maps that can be used to detect different features.

- Convolution keeps rhe spatial relationships between pixels by learning image features over the small segments we pass ofwe rhe input image

[Types of kernels](https://en.wikipedia.org/wiki/Kernel_(image_processing))



## Features/Activation maps and image features

* Each cell in our activation matrix can be considered a feature extractor or neuron that looks at specific region of the image.

* In the first few layers, our neurons activation when edges or other.
 low level features are detected in Deeper layers, our neurons will be able to detect high level or big picture features or patterns such as bicycle, face. cat etc


 ## Designing feature maps

  - Remember feature or activation maps were output of applying convolution operator.
  - We applied a 3x3 filter or kernel in our example
  - But, does the filter have to be 3x3? How many filters to we need? Do we need to pass over pixel by 
    pixel?
  - By tweaking the following **parameters** to control the size of our **feature maps**.

### Depth

- Depth describes the number of filters used it does not relate the image depth (2 channels) nor does it describe the number of hidden layers in our CNN.

- Each filter learns different feature maps that are activated in the presence of different image  features (edges, patterns, colots layouts)

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/cnn/depth.jpeg" title="tool tip here">
</p>

* Remark: Zero padding is applied too.

### Stride

- Stride simply refers to the **step size** we take when we slide our kernel on the input image.
- Stride conteols the sizr of the convolution Layer output.

- Using a larger Stride produce less overlaps in kernels, which means you end small features maps because you lose information that's  being passed from layer to layer.

- Stride is one of the methods we can control the spatial input size i.e the volume of the inputs into the other layers of our CNN.

### Zero-Padding

- Zero padding is a very simple concept that refers to a border  we apply to the input volumr.
  We haven't discussed deep networks much yet. but imagine we had multiple Convolution layers. Yu can quickly see that even with a stride of 1, we end up with a tiny output matrix quickly.
 - We add a border of o's around our input. basically this is equivalent of adding a black border around an image (we can set our padding to 2 if needed)


### Calculating our Convolution Output

Symbol | Descripton
------------|-----
K | Kernel/Filter Size
D | Depth
S | Stride
P | Zero Padding
I | Input Image Size

To ensure our filters cover the full input image symetrically, we used the following equation to do this sanity check. Once the result of this equation is an integer, out setting are valid.

`((I-K+2P))/S +1`

## ReLU the Activation layer of choice for CNNs

After we have applied the kernel we got feature map,
now we have applied the activation function. 
<p align="center"> <!-- style="width:400px;" -->
  <img src="images/cnn/relu.jpeg" title="tool tip here">
</p>


## Pooling 

- Pooling, also known as **subsampling** or **downsampling**, is a simple process where we reduce the size or dimensionality of Feature Map.

- The purpose of this reduction is to reduce the number if parameters needed to train . while retaining the most important features and iformation in the image.

- There are 3 types of Pooling we can apply: (1) Max , (2) Average, (3) Sum

**Example of max pooling:**
<p align="center"> <!-- style="width:400px;" -->
  <img src="images/cnn/max_pooling.jpeg" title="tool tip here">
</p>

## Recap

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/cnn/layers_so_far.jpeg" title="tool tip here">
</p>


## The Fully connected (FC) Layer (final Layer)

In Keras it is called Dense layer,
The FC Layer outputs the class probabilities, where each class is assigned a probabilty.
- All probabilties must sum to 1 .
The activation function used to produce these probabilties is the **SOft Max** Function as it turns the outputs of the FC layer (last layer) into probabilities.


* The more hidden layers the more features. praticularly high level features a CNN can learn.
I like to use a minimum of 2. which is shown in the diagram below.

The flow is: input -> Conv -> ReLI -> Pool -> Conv -> ReLI -> Pool -> FC -> Output

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/cnn/cnn_review.jpeg" title="tool tip here">
</p>

## Training CNNs
Just like NN, training CNNs is essentialy the same once we setup out Network layers. the flow follows the following steps:

1. Random weight initialization in the Convolution Kernels

2. forward propagates an image through our network (input -> CON -> ReLU -> Pooling -> FC)

3. Calculate the Total Error e.g say we got an output of (0.2, 0.4 , 0.4) while the true probabilties were [0,1,0]

4. Use Back Propogation to update our gradients (i.e the weights in the kernel filters) via gradient descent.

5. Keep propogating akk images through our network till Epoch is complete

6. Keep completing epochs till our loss and accuracy are satisfactory.

## Basic CNN Design Rules

* Input Layer typically Square e.g 28x28x3 or 64x64x3 (this isn't necessary but simplifies our design and speeds up our matrix calculations)

* Input should be divisible by at least 4 which allows for downsampling.

* **Filters (kernels)** are typically samll either 3x3 or 5x5.

* **Stride** is typically 1 or 2 if inputs are large.

* **Zero padding** is used typically to allow the output Conv layer to the same size as input.

* **Pool kernel** size is typically 2x2.

* **Dropout** is a very useful technique to avoid over fitting in CNNs.



## Building a CNN in Keras

Keras is a high level neural network APi for **Python**
It has the abilty to use TensorFlow, CNTK or Theano backends

### Loading out data
### Hot One Encoding
### building & compiling our model

* Sequential model is a linear stack of layers

```python
from keras.models import Sequential

model = Sequential()
```

#### Demo

Example of brining up a simple model without zero padding:

```python
from keras.layers import Dense, Dropout, Flatten
from keras.layers import Conv2D, MaxPooling2D

# First layer:
model.add(Con2D(32, kernel_size = (3,3), activation = 'relu', input_shape = input_shape))
# The output of the first layer moves towards the following layer
model.add(Con2D(64, (3,3), activation = 'relu')
model.add(MaxPooling2D(pool_size = (2,2)))

# Flatten is a function to feed a dense layer or fully connected layer.
model.add(Flatten())
model.add(Dense(128, activation = 'relu'))
model.add(Dense(num_classes, activation = 'softmax'))

```
<p align="center"> <!-- style="width:400px;" -->
  <img src="images/cnn/simple_model_example.jpeg" title="tool tip here">
</p>

### Training our classifier
### Plotting loss and accuracy Charts
### Saving and loading your model
### Displaying your model visually




