<!--ts-->
   * [Face Recognition](#face-recognition)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Tue 08 Feb 2022 09:58:28 IST -->

<!--te-->

# Face Recognition

Is not a classification problem because the number of faces in the world is not bounded.
We don't train a neural network to classify me, we just use the existing network which was already trained on thousands of thousands faces of people to doing this, to put me somwhere here and I record the location. then when I try again to unlock the phone does my new image goes to the same place in the space as the last one.

Solves the one shot learning problem

The network uses a special type of loss function called `triplet loss`.
[Link](https://medium.com/visionwizard/research-for-all-in-defense-of-triplet-loss-for-person-re-identification-9cce5616fb6)




# Reference

[Detecting Faces - Viola Jones Algorithm](https://youtu.be/uEJ71VlUmMQ)

[How Face ID Works (Face recognition)](https://youtu.be/mwTaISbA87A)


[FaceID ](https://towardsdatascience.com/how-i-implemented-iphone-xs-faceid-using-deep-learning-in-python-d5dbaa128e1d)