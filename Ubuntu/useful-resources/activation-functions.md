<!--ts-->
   * [Activation functions](#activation-functions)
      * [Why to use activation functions?](#why-to-use-activation-functions)
      * [Type of Activation Layers](#type-of-activation-layers)
         * [Tanh (Hyperbolic Tangent)](#tanh-hyperbolic-tangent)
         * [Sigmoid](#sigmoid)
         * [ReLU (Rectified Linear Unit)](#relu-rectified-linear-unit)
         * [LeakyReLU](#leakyrelu)
         * [Gelu (Gaussian Error Linear Unit)](#gelu-gaussian-error-linear-unit)

<!-- Added by: gil_diy, at: Tue 01 Mar 2022 10:25:06 IST -->

<!--te-->


# Activation functions


## Why to use activation functions?

For example, if f(x) = 2x + 3 and g(x) = 5x – 1, then chaining these two linear functions
gives you another linear function: f(g(x)) = 2(5x – 1) + 3 = 10x + 1. So if you don’t
have some nonlinearity between layers, then even a deep stack of layers is equivalent
to a single layer, and you can’t solve very complex problems with that. Conversely, a
large enough DNN with nonlinear activations can theoretically approximate any con‐
tinuous function.

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

<p align="center">
  <img width="400" src="images/activation-functions/sigmoid.png" title="Look into the image">
</p>

### ReLU (Rectified Linear Unit)

<p align="center">
  <img width="400" src="images/activation-functions/Relu.jpg" title="Look into the image">
</p>

### LeakyReLU

<p align="center">
  <img width="400" src="images/activation-functions/LeakyRelu.jpg" title="Look into the image">
</p>

### Gelu (Gaussian Error Linear Unit)

* Is used in BERT, GELU has several notable differences:

* GELU is a smoother version of the RELU.

* It is Non convex, non-monotonic function is not linear in the positive axis and exhibits curvature at all points.

<p align="center">
  <img width="400" src="images/activation-functions/GELU.jpg" title="Look into the image">
</p>


[Link](https://medium.com/@shoray.goel/gelu-gaussian-error-linear-unit-4ec59fb2e47c)