<!--ts-->
   * [Architecture Networks](#architecture-networks)
      * [VGG](#vgg)
      * [ResNet](#resnet)
      * [GAN - Generative Adversial Networks](#gan---generative-adversial-networks)
         * [Desciminator](#desciminator)
         * [Generator](#generator)

<!-- Added by: gil_diy, at: Thu 10 Feb 2022 12:47:13 IST -->

<!--te-->

# Architecture Networks


## VGG

## ResNet

## GAN - Generative Adversial Networks

The Neural Network consist of 'Desciminator' and 'Genearator'

When training the descriminator, hold the generator values constant;
and when training the generator, hold the discrimiantor constant. Each Should train against a static adversary.


### Desciminator 

For Desciminator, any CNN based classifier with 1 class (real) at the output
can be used (e.g VGG, Resnet, etc.).
So the **output of the discriminator** will not have softmax it will have only single neuron which will give zero or one (Real or Fake).


<p align="center"> <!-- style="width:400px;" -->
  <img src="images/neural-networks-architectures/GAN-descriminator.jpg" title="tool tip here">
</p>


### Generator

* Generators try to generate Fake images.

* Each Generator starts with a **Random Noise Seed** (Latent Vector)

* Along the network the generator network upscales the image by using **transpose convolution** and fractional-strided convolutions.

Reminder: Transpose Convolution are **upscaler**, used for Encoder-Decoder architectures as **"Decomprossor"**.

[Link](file:///home/gil_diy/my_documentation_helper/pytorch/pytorch.html#transpose-convolution,-what-is-it?)


<p align="center"> <!-- style="width:400px;" -->
  <img src="images/neural-networks-architectures/GAN-generator.jpg" title="tool tip here">
</p>

**Architecture guidelines for stable Deep Convolutions GANs:**


* Using batchnorm in both the **generator** and the **discriminator**.

* Remove fully connected hidden layers for deeper architectures.

* Use ReLU activation in generator for all layers except for the output, which uses tanh hyperbolic tangent function).

* Use LeakyReLU activation in the discriminator for all layers

[Link](https://github.com/jantic/DeOldify)