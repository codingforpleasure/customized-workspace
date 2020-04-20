
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
         * [Compile our model](#compile-our-model)
         * [Training our classifier](#training-our-classifier)
         * [Evaluate our Model and Generate Predictions](#evaluate-our-model-and-generate-predictions)
         * [Plotting loss and accuracy Charts](#plotting-loss-and-accuracy-charts)
         * [Saving and loading your model](#saving-and-loading-your-model)
         * [Displaying your model visually](#displaying-your-model-visually)
      * [Data Augmentation](#data-augmentation)
         * [Benefits of Data Augmentation](#benefits-of-data-augmentation)
         * [Displaying our misclassified data](#displaying-our-misclassified-data)
         * [Displaying the misclassfications](#displaying-the-misclassfications)
      * [Types of optimizers available in Keras](#types-of-optimizers-available-in-keras)
         * [Optimizers](#optimizers)
            * [Stochastic Gradient Descent](#stochastic-gradient-descent)
      * [Keras Checkpoint models and Callbacks](#keras-checkpoint-models-and-callbacks)
         * [Creating checkpoint models](#creating-checkpoint-models)
         * [Early stopping](#early-stopping)
         * [Reducing Learning rate on plateau](#reducing-learning-rate-on-plateau)
      * [Resources](#resources)

<!-- Added by: gil_diy, at: 2020-04-20T11:22+03:00 -->

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
- Stride controls the size of the convolution Layer output.

- Using a larger Stride produce less overlaps in kernels, which means you end small features maps because you lose information that's  being passed from layer to layer.

- Stride is one of the methods we can control the spatial input size i.e the volume of the inputs into the other layers of our CNN.

### Zero-Padding

- Zero padding is a very simple concept that refers to a border we apply to the input volume.
  We haven't discussed deep networks much yet. but imagine we had multiple Convolution layers. You can quickly see that even with a stride of 1, we end up with a tiny output matrix quickly.
 - We add a border of 0's around our input. basically this is equivalent of adding a black border around an image (we can set our padding to 2 if needed)


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

- The purpose of this reduction is to reduce the number of parameters needed to train . while retaining the most important features and information in the image.

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

* **Filters (kernels)** are typically small either 3x3 or 5x5.

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

Example of bringing up a simple model without zero padding:

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

### Compile our model

```python
model.compile(loss = 'categorical_crossentropy',
	optimizer = SGD(0.01), # Stochastic Gradient descent
	metrics = ['accuracy'])
```
### Training our classifier

```python
model.fit(x_train, y_train, epochs = 5, batch_size = 32)
```

### Evaluate our Model and Generate Predictions

```python
loss_and_metrixs = model.evaluate(x_test, y_test, batch_size = 120)
```
```python
classes = model.predict(x_test, batch_size = 120)
``` 

### Plotting loss and accuracy Charts


### Saving and loading your model
### Displaying your model visually



## Data Augmentation

In deep learning, the more training data/examples we have the better our model will be on unseen data (test data)

however, what if we had less than 1000 examples per image class?
Therefore we can use Keras Data Augementation to generate multiple version of our original image (shearing/shifting/zooming/skewing).
Adding variations such as rotations, shifts,zooming etc make our classifier much more invariant to chnages in our images. Thus making it far more robust.

Reduces overfitting due to the increased varity in the training dataset.

### Benefits of Data Augmentation
* Take a small dataset and make it much larger!

Keras' buil-in **Data Augmentation API** performs a just-in-time augumented image dataset. This means images aren't created and dumped to a directory (which will be wasteful storage). Instead it generates this dataset during the training process.


[Types of Data Augmentation](https://keras.io/preprocessing/image/)

* We use the above code to create our generator with types of augementation to perform specified in the input arguments

```python
train_detection = ImageDataGenerator(
  rescale = 1./255,
  shear_range = 0.2,
  zoom_range = 0.2,
  horizontal_flip = True)

test_datagen = ImageDataGenerator(rescale = 1. / 255)
```


### Displaying our misclassified data

```python
import cv2
import numpy as np

# use numpy to create an array that stores a value of 1 when missclassification accurs

result = np.absolute(y_test - y_pred)
result_indices = np.nonzero(result > 0)

# Display the indices of misclassifications
print("Indices of misclassified data are: \n\n", str(result_indices))
```

### Displaying the misclassfications
```python
import cv2

def draw_test(name, pred, input_im, true_label):
  BLACK = [0,0,0]
  expanded_image = cv2.c
```


## Types of optimizers available in Keras

### Optimizers
Optimizers are the actual algorithm we use to **minimize our Loss** for example:

*  Gradient Descent
*  Stochastic Gradient Descent
*  Mini Batch Gradient Descent

**Keras's build in optimizers:**

*  Stochastic Gradient Descent
*  RMSprop
*  AdaGrad
*  AdaDelta
*  Adam
*  Adamax
*  Nadam

The main difference in these algorithms is how they **manipulate** the **learning rate** to allow for faster convergence and better validation accuracy.

Some require manual setting of parameters to adjust our **learning rate schedule**

Some use a heuristic approach to provide adaptive learning rates.

#### Stochastic Gradient Descent

* By default Keras uses a constant learing rate in the SGD optimizers. However, we can set:
1)  **momentum**

2)  **decay **

3) Enabling **Nesterov Momentum**


**Momentum**
Is a tecnique that accelarates SGD by pushing the gradient steps aling rhe relabelmat direction but reducing the jump in oscilatrions away from the relevant ditections.

**Decay** 
is setting decays the learning rate every batch update (not epoch, so be aware of how you set your batch size)
A good rule of thunb for setting decay is (**learning rate / epochs**)

**Nesterov**
solves the problem of oscillating around our minima when momentum is high and unable to slow down. it first makes a big jump then a small correction after the gradient is calculated.


[Keras optimizers](https://keras.io/optimizers/)

## Keras Checkpoint models and Callbacks

* This is a simple but very useful way saving your best model before it starts overfitting (i.e LOSS on our test/validation data starts increases as our Epochs increase)
 
* **Checkpointing** allows us to keep saving our weights/models after each epoch.

* Keras then allows us to keep saving the 'best' model by monitoring validation loss (we can monitor accuarcy if you desire)


### Creating checkpoint models

```python
from keras.callbacks import ModelCheckpoint
```

```python
checkpoint = ModelCheckpoint('/home/..../Trained_models/',
                              monitor = 'val_loss',
                              mode = "min",
                              save_best_only = True,
                              verbose = 1)

callbacks = [checkpoint]
```

* so we have created a callback that monitors validation loss. Here we look at the lowest value and |ave only the best model:

```python
history = model.fit(x_train, y_train, 
  batch_size = 64,
  epochs = 3,
  verbose = 2,
  callbacks = callbacks,
  validation_data = (x_test, y_test)
  )
```

### Early stopping 

Early Stopping is another Keras Callback that allows us to stop training once the value being monitored (e.g: val_loss) has stopped getting better (decreasing).

We can even use a "patience" parameter to wait X amount of epochs before stopping.

```python
earlystop = EarlyStopping(monitor = 'val_loss', # value being monitored for improvement
                          min_delta = 0, # 
                          patience = 3, # number of epochs we wait before stopping
                          verbose = 1,
                          restore_best_weights = True) # keep the best weights once stopped

# We put our callbacks into a callback list
callbacks = [earlystop, checkpoint]
```

### Reducing Learning rate on plateau

* Keras also comes with a Learning rate adjusment callback

* We can avoid having our loss oscilate around the global minimum by attempting to reduce the Learn Rate by a certain fact. if no improvment is seen in our monitored metric (val_loss typically), we wait a certain number of epochs (patience) then this callback reduces the learning rate by a factor.

```python
from keras.callbacks import ReducceLROnPlateau

reduce_learning_rate = ReducceLROnPlateau(monitor = 'val_loss', factor = 0.2, patience = 3, verbose = 1, min_delta = 0.0001)
```


## Resources
[Great Reference](https://towardsdatascience.com/applied-deep-learning-part-4-convolutional-neural-networks-584bc134c1e2)