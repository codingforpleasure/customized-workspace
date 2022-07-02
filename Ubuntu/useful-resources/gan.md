<!--ts-->
   * [GAN (Generative Adversial Network)](#gan-generative-adversial-network)
      * [Background](#background)
      * [Discriminative model](#discriminative-model)
      * [Generative model](#generative-model)
         * [GAN](#gan)
      * [Use cases of GAN](#use-cases-of-gan)
         * [Generate images (StyleGan2)](#generate-images-stylegan2)
         * [Image translation (CycleGan)](#image-translation-cyclegan)
         * [A rough drawing of a landscape and make it photorealistic (GauGAN).](#a-rough-drawing-of-a-landscape-and-make-it-photorealistic-gaugan)
         * [Generate 3D objects like chairs and tables (3d-GAN) - Genarative Design](#generate-3d-objects-like-chairs-and-tables-3d-gan---genarative-design)
         * [The Mona Lisa, and animate it using the motion of any real person's face. (Few-shot adversarial learning of realistic neural talking head models)](#the-mona-lisa-and-animate-it-using-the-motion-of-any-real-persons-face-few-shot-adversarial-learning-of-realistic-neural-talking-head-models)
      * [Descriminator](#descriminator)
      * [Generator](#generator)
   * [BCE (Binary Cross Entropy)](#bce-binary-cross-entropy)

<!-- Added by: gil_diy, at: Sat 02 Jul 2022 19:40:13 IDT -->

<!--te-->
# GAN (Generative Adversial Network)

* GAN is unsupervised technique

* A different kind of Generative model is Variational Autoencoder (VAE)
A good distribution over the latent space is important for VAEs. 


## Background
There are two models behind a GAN, the generator and the discriminator.
They actually fight against each other, and this fighting gets one of the models to be
so good that it generates realistic images. 


## Discriminative model
A discriminative model is one typically used for classification in machine learning.
They learn how to distinguish between classes such as dogs and cats,
and are often called classifiers.

Discriminative models take a set of features X, such as having a wet nose or whether it purrs and from these features
determine a category why of whether the image is of a dog or a cat.
In other words, they try to model the probability of class Y given a set of features X as having a wet nose,
but it doesn't purr, so it's probably a dog.


## Generative model
Generative model learn to produce realistic examples


### GAN
The two models compete with each other and reach a point where realistic examples are produced by the generator. 

* The generator's goal is to fool the descriminator

* The descrimianator's goal is to distguish between real and fake.

* They learn from the competition with each other

* At the end, fakes look real


## Use cases of GAN

[url video](https://coursera.org/share/c2e679c26d61962b0f881f3a310eebb0)

### Generate images (StyleGan2)

### Image translation (CycleGan)

which just means they can take an image from one domain and transform it into another. For instance, they can transform an image of a horse into a zebra and vice versa. What's really interesting is that you don't actually need examples of a zebra and a horse doing the same things, and instead just transfer
that style over.

### A rough drawing of a landscape and make it photorealistic (GauGAN).

### Generate 3D objects like chairs and tables (3d-GAN) - Genarative Design

### The Mona Lisa, and animate it using the motion of any real person's face. (Few-shot adversarial learning of realistic neural talking head models)


Example: 
[https://www.thispersondoesnotexist.com/](https://www.thispersondoesnotexist.com/)

## Descriminator

P(Y-Class | X-Features)

* The discriminator is a classifier
* It learns the probabilty of class Y (Real or Fake) 
given features X
* The probabilties are the feedback for the generator.

## Generator

* The genrator final goal is to be able to produce examples from a certain class.

* To ensure the it's able to produce different examples every single time, you will input different sets of random values (noise vectors).

* It learns to mimic that distribution of features X from the class of your data P(X-Features | Y-Class).

# BCE (Binary Cross Entropy)

* Close to zero when the label and the prediction are similar

* Appraoches inifinity when the label and the prediction are different.

* The discriminator looks at real and fake images over time, makes guesses, and gets feedback on whether its guess was right or wrong.

* Over time, it learns to discern real from fake better, but note that since the generator is also learning, the fake images get more realistic and harder to discern. This cat and mouse game enables both models to learn in tandem. 

How does the **generator** learn over time?

* With feedback from the discriminator on whether a fake image looks real or fake, the generator starts producing fake images that are more and more realistic (that tries to fool the discriminator). Images that look “fake” to the discriminator are discarded in favor of those that look “real” to the discriminator; since the discriminator is improving over time as it sees more reals and fakes, the generator needs to continually learn too.

* Both models (generator and discriminator)  should improve together. and should be kept at similar skill levels from the begining of training.

* GANs train in an alternating fashion

* The two models should always be at similar "skill" level"


<p align="center">
  <img width="600" src="images/gan/A-Standard-GAN-and-b-conditional-GAN-architecturpn.png" title="Look into the image">
</p>