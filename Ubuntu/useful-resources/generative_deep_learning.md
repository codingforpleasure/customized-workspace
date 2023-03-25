<!--ts-->


<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sat 25 Mar 2023 03:47:08 PM IDT -->

<!--te-->


In order to generate new data there are already lots of model
architectures available to generate new data for example:
GAN -  Generative Adversarial Networks
VAE - Variational Autoencoders

<p align="center">
  <img width="400" src="images/generative_deep_learning/image1.jpg" title="Look into the image">
</p> 


* VAEs have shown to produce diverse samples quickly but usually the quality is not great compared to GANs.

* VAEs compresses an input into a latent distribution and then samples from this distribution
  to recover the inputs after training we can sample from the latent space to generate
  new data points usually VAEs are quite easy to train but as mentioned the outputs can be **blury**


* GANs produce **high quality outputs** but are most of the time difficult to train this
stems from the adversarial setup which can cause problems such as **vanishing
gradients** or **mode collapse**



* Fusion models work by destroying the input until noise is left over and
then recovering the input from noise using a neural network .

* Diffusion model downsides for example the sampling speed because of the sequential reverse
process they are much slower compared to gans or vaes.