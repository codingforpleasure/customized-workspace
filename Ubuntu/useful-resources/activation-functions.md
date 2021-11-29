<!--ts-->
   * [Activation functions](#activation-functions)
      * [Why to use activation functions?](#why-to-use-activation-functions)

<!-- Added by: gil_diy, at: Mon 29 Nov 2021 10:34:01 IST -->

<!--te-->


# Activation functions


## Why to use activation functions?

For example, if f(x) = 2x + 3 and g(x) = 5x – 1, then chaining these two linear functions
gives you another linear function: f(g(x)) = 2(5x – 1) + 3 = 10x + 1. So if you don’t
have some nonlinearity between layers, then even a deep stack of layers is equivalent
to a single layer, and you can’t solve very complex problems with that. Conversely, a
large enough DNN with nonlinear activations can theoretically approximate any con‐
tinuous function.

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/neural-networks/activation_function_and_their_derivatives.png" title="tool tip here">
</p>



[activation functions](https://keras.io/api/layers/activations/)