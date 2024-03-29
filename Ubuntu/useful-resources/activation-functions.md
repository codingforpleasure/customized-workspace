<!--ts-->
   * [Activation functions](#activation-functions)
      * [Why to use activation functions?](#why-to-use-activation-functions)
      * [Type of Activation Layers](#type-of-activation-layers)
         * [Tanh (Hyperbolic Tangent)](#tanh-hyperbolic-tangent)
         * [Sigmoid](#sigmoid)
         * [ReLU (Rectified Linear Unit)](#relu-rectified-linear-unit)
         * [LeakyReLU](#leakyrelu)
         * [Gelu (Gaussian Error Linear Unit)](#gelu-gaussian-error-linear-unit)
         * [Application activation functions usage](#application-activation-functions-usage)
         * [Mathematical properties of activation functions](#mathematical-properties-of-activation-functions)
      * [Nicely summary table](#nicely-summary-table)

<!-- Added by: gil_diy, at: Wed 06 Apr 2022 13:15:38 IDT -->

<!--te-->


# Activation functions


## Why to use activation functions?

For example, if f(x) = 2x + 3 and g(x) = 5x – 1, then chaining these two linear functions
gives you another linear function: f(g(x)) = 2(5x – 1) + 3 = 10x + 1. So if you don’t
have some nonlinearity between layers, then even a deep stack of layers is equivalent
to a single layer, and you can’t solve very complex problems with that. Conversely, a
large enough DNN with nonlinear activations can theoretically approximate any continuous function.

[Great explanation: The need for nonlinear activation functions](https://stats.stackexchange.com/questions/275358/why-is-increasing-the-non-linearity-of-neural-networks-desired)

---------------------------------------------------------------------------------

<p align="center">
  <img width="600" src="images/activation-functions/activation_function_and_their_derivatives.png" title="Look into the image">
</p>


[activation functions](https://keras.io/api/layers/activations/)

## Type of Activation Layers

### Tanh (Hyperbolic Tangent)

<p align="center">
  <img width="600" src="images/activation-functions/Hyperbolic_tangent.jpg" title="Look into the image">
</p>


### Sigmoid

* 2012 paper on **automatic speech recognition** uses a logistic **sigmoid activation function**.

<p align="center">
  <img width="400" src="images/activation-functions/sigmoid.png" title="Look into the image">
</p>

### ReLU (Rectified Linear Unit)

* **AlexNet** computer vision architecture uses the **ReLU** activation function, as the computer vision architecture **ResNet**.

<p align="center">
  <img width="400" src="images/activation-functions/Relu.jpg" title="Look into the image">
</p>

### LeakyReLU

<p align="center">
  <img width="400" src="images/activation-functions/LeakyRelu.jpg" title="Look into the image">
</p>

### Gelu (Gaussian Error Linear Unit)

* Language processing model **BERT** uses a smooth version of the ReLU, the **GELU**.

* GELU is a smoother version of the RELU.

* GELU is a smooth approximation to the rectifier. It has a non-monotonic “bump” when x < 0, and it serves as the default activation for models such as BERT.

* It is Non convex, non-monotonic function is not linear in the positive axis and exhibits curvature at all points.

<p align="center">
  <img width="400" src="images/activation-functions/GELU.jpg" title="Look into the image">
</p>


[Link](https://medium.ocwwwm/@shoray.goel/gelu-gaussian-error-linear-unit-4ec59fb2e47c)


### Application activation functions usage

 Activation function | Used in models
------------|-----
 ReLU | Used in AlexNet
 GELU | Used in BERT

### Mathematical properties of activation functions


* **Nonlinear**

When the activation function is non-linear, then a two-layer neural network can be proven to be a **universal function approximator**. This is known as the Universal Approximation Theorem. The identity activation function does not satisfy this property. When multiple layers use the identity activation function, the entire network is equivalent to a single-layer model.


* **Range**

When the range of the activation function is finite, gradient-based training methods tend to be more stable, because pattern presentations significantly affect only limited weights. When the range is infinite, training is generally more efficient because pattern presentations significantly affect most of the weights. In the latter case, smaller learning rates are typically necessary


## Nicely summary table

[Wikipedia Activation functions](https://en.wikipedia.org/wiki/Activation_function#Table_of_activation_functions)