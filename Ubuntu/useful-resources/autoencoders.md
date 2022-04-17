<!--ts-->
   * [Autoencoders](#autoencoders)
      * [Reconstruction loss](#reconstruction-loss)
      * [LSTM Autoencoder](#lstm-autoencoder)

<!-- Added by: gil_diy, at: Sun 17 Apr 2022 13:19:58 IDT -->

<!--te-->

# Autoencoders


<p align="center">
  <img width="600" src="images/Autoencoders/autoencoder_1.png" title="Look into the image">
</p>


## Reconstruction loss

When training an **Autoencoder**, the objective is to reconstruct the input as best as possible. This is done by minimizing a loss function (just like in supervised learning).
This function is known as **reconstruction loss**.

Cross-entropy loss and Mean squared error are common examples.

## LSTM Autoencoder

* we’ll have a look at how to feed Time Series data to an Autoencoder. We’ll use a couple of LSTM layers (hence the LSTM Autoencoder) to capture the temporal dependencies of the data.