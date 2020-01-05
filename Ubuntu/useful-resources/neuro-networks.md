<!--ts-->
<!--te-->

# Neural network architecture
<img src="/home/gil_diy/myGitRepositories/customized-workspace/Ubuntu/useful-resources/images/neural-networks/type-of-networks.png" width="500">


## Useful resources:

[tensorflow playground](https://playground.tensorflow.org)

## Feed Forward Neural networks
These are the commonest type of neural network in practical applications.

**Properties:**
The first layer is the input and the last layer is the output.
If there is more than one hidden layer, we call them "deep" neural networks.


## Recurrent Neural networks - information can flow round in cycles
these networks can remember information for a long time they can exhibit all sort of interesting oscillations but **they are much difficult to train** in part beacuse they are so much more complicated in what they can do.

**Properties:**
Recurrent Neural networks are much more powerful then feed forward neural networks.
They have directed cycles in their connection graph. that means you can sometimes get back to where you started by following arrows.
* They are more biologically realistic.
* Recurrent neural networks are a very natural way to model sequential data:
- They are equivalent to very deep nets with one hidden layer per time slice.
- Except that they use the same weights at every time slice and they get input at every time slice.
* They have the abilty to remember information in their hidden state for a long time.
- But its very hard to train them to use this potential.

* They are well suited for applications involving sequences, they are widelyused in problems related to videos, which are a time sequqnce of images, and for translation purposes, wherein understanding the next word is based on the context of the previuos text.

## Convolutional Neural Networks (CNN)

Convolution Neural networks are well adapted for image recognition and handwriting recognition. Their structure is based on sampling a window or portion if an image, detecting it's feature, and then using the features to build a represenation.According to this description this leads to use of several layers.

* Convolution be used for edge detection and other image filters (2-D)
* Convolution be used for adding echo, reverb and other audio effects to sound (1-D) - 1 dimention is time. One obvious application is speech recognition. Speech is a 1-D signal (amplitude vs time)
Another application is Automatic text transcription  (1h of audio may take 3h to transcribe - not scalable! Perfect opportunity to apply ML)



## Symmetrically connected networks
* These are like recurrent networks.
but the connections between units are symmetrical
(They have the same weight in both directions).
* Researchers realized that symmetric networks are much easier to analyze than recurrent networks.
* They are also more restricted in what they can do, because they obey an energy function (**they cannot model cycles**).
