<!--ts-->
   * [Architecture Networks](#architecture-networks)
      * [GAN - Generative Networks](#gan---generative-networks)
         * [Desciminator](#desciminator)
         * [Generator](#generator)

<!-- Added by: gil_diy, at: Thu 10 Feb 2022 11:57:14 IST -->

<!--te-->

# Architecture Networks

## GAN - Generative Networks

The Neural Network consist of 'Desciminator' and 'Genearator'

### Desciminator 

For Desciminator, any CNN based classifier with 1 class (real) at the output
can be used (e.g VGG, Resnet, etc.).
So the **output of the discriminator** will not have softmax it will have only single neuron which will give zero or one (Real or Fake).


<p align="center"> <!-- style="width:400px;" -->
  <img src="images/neural-networks-architectures/GAN-descriminator.jpg" title="tool tip here">
</p>


### Generator

Applying transpose convolution and fractional-strided convolutions.
reminder: Transpose Convolution are **upscaler**, used for Encoder-Decoder architectures as **"Decomprossor"**.

[Link](file:///home/gil_diy/my_documentation_helper/pytorch/pytorch.html#transpose-convolution,-what-is-it?)


<p align="center"> <!-- style="width:400px;" -->
  <img src="images/neural-networks-architectures/GAN-generator.jpg" title="tool tip here">
</p>

**Architecture guidelines for stable Deep Convolutions GANs:**


* Using batchnorm in both the **generator** and the **discriminator**.

* Remove fully connected hidden layers for deeper architectures.

* Use ReLU activation in generator for all layers except for the output, which uses tanh hyperbolic tangent function).

* Use LeakyReLU activation in the discriminator for all layers