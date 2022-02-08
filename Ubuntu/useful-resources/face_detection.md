<!--ts-->
   * [Face Recognition](#face-recognition)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Tue 08 Feb 2022 11:46:58 IST -->

<!--te-->

# Face Recognition

Is not a classification problem because the number of faces in the world is not bounded.
We don't train a neural network to classify me, we just use the existing network which was already trained on thousands of thousands faces of people to doing this, to put me somwhere in the latent space (aka latent feature space) and I record the location. then when I try again to unlock the phone does my new image goes to the same place in the space as the last one.

What happens is that you get an architecture capable of doing **one shot learning**.

* The name of the network is [Siamese Networks](https://towardsdatascience.com/a-friendly-introduction-to-siamese-networks-85ab17522942) (sometimes called a twin neural network) 

* The network uses a special type of loss function called `triplet loss`.
  The name triplet loss since the loss function recieves 3 variables:

  <p align="center" style="width:400px;" >
  <img src="images/cnn/Triplet_loss_function_in_Siamese_Network.jpg" title="tool tip here">
</p>

  * $A$ is an **Anchor** input
  * $P$ is a **Positive** input of the same class as $A$
  * $N$ is a **Negative** input of a different class from $A$
  * $/alpha$ is a margin between positive and negative pairs
  * $f$ is an after embedding to the latent space

* A and P the same person, N is different person than A.


[Link](https://medium.com/visionwizard/research-for-all-in-defense-of-triplet-loss-for-person-re-identification-9cce5616fb6)



[Triplet Loss](https://youtu.be/d2XB5-tuCWU)


# Reference

[Detecting Faces - Viola Jones Algorithm](https://youtu.be/uEJ71VlUmMQ)

[How Face ID Works (Face recognition)](https://youtu.be/mwTaISbA87A)


[FaceID ](https://towardsdatascience.com/how-i-implemented-iphone-xs-faceid-using-deep-learning-in-python-d5dbaa128e1d)