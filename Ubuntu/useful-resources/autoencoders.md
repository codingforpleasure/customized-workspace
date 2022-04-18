<!--ts-->
   * [Autoencoders](#autoencoders)
      * [Why Do We Apply Dimensionality Reduction to Find Outliers?](#why-do-we-apply-dimensionality-reduction-to-find-outliers)
      * [Reconstruction loss](#reconstruction-loss)
      * [LSTM Autoencoder](#lstm-autoencoder)

<!-- Added by: gil_diy, at: Mon 18 Apr 2022 15:17:07 IDT -->

<!--te-->

# Autoencoders


<p align="center">
  <img width="600" src="images/Autoencoders/autoencoder_1.png" title="Look into the image">
</p>

* Recall that in an autoencoder model the number of the neurons of the input and output layers corresponds to the number of variables.

## Why Do We Apply Dimensionality Reduction to Find Outliers?

* once the main patterns are identified, the **outliers are revealed**. Many distance-based techniques (e.g. KNNs) suffer the **curse of dimensionality** when they compute distances of every data point in the full feature space. High dimensionality has to be reduced.

* Interestingly, during the process of dimensionality reduction outliers are identified. We can say outlier detection is a by-product of dimension reduction.

## Reconstruction loss

When training an **Autoencoder**, the objective is to reconstruct the input as best as possible. This is done by minimizing a loss function (just like in supervised learning).
This function is known as **reconstruction loss**.

Cross-entropy loss and Mean squared error are common examples.

[Reconstruction loss explained](https://youtu.be/qN3n0TM4Jno?t=2098)


## LSTM Autoencoder

* We’ll have a look at how to feed Time Series data to an Autoencoder. We’ll use a couple of **LSTM layers** (hence the LSTM Autoencoder) to capture the **temporal dependencies** of the data.

To classify a sequence as normal or an anomaly, we’ll pick a threshold above which a heartbeat is considered abnormal.