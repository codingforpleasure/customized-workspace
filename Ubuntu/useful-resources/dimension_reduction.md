<!--ts-->
   * [Dimension Reduction](#dimension-reduction)
   * [Feature extraction and elimination](#feature-extraction-and-elimination)
      * [Missing values ratio](#missing-values-ratio)
      * [Low-variance filter](#low-variance-filter)
      * [High-correlation filter](#high-correlation-filter)
      * [Random forest](#random-forest)
      * [Backwards-feature elimination](#backwards-feature-elimination)
      * [Forward-feature construction](#forward-feature-construction)
      * [UMAP](#umap)
   * [Linear algebra methods](#linear-algebra-methods)
      * [PCA (Principal Component Analysis)](#pca-principal-component-analysis)
      * [LDA (Linear Discriminatory Analysis)](#lda-linear-discriminatory-analysis)
      * [SVD (Singular Value Decomposition)](#svd-singular-value-decomposition)
   * [Manifold](#manifold)
      * [Isomap embedding](#isomap-embedding)
      * [LLE (Locally linear embedding)](#lle-locally-linear-embedding)
      * [t-SNE (t-Distributed Stochastic Neighbour)](#t-sne-t-distributed-stochastic-neighbour)
      * [Auto-encoder](#auto-encoder)

<!-- Added by: gil_diy, at: Tue 15 Mar 2022 11:38:52 IST -->

<!--te-->


# Dimension Reduction

One way to preserve the structure of high-dimensional data in a low-dimensional space is to use a dimensional reduction technique.
So, what’s the benefit of this? The answer is three-fold:

1. it improves the model accuracy due to less misleading data

2. the model trains faster since it has fewer dimensions

3. It makes the model simpler for researchers to interpret


**There are three main dimensional reduction techniques**:

(1) Feature elimination and extraction

(2) Linear algebra

(3) Manifold

The dimensionality reduction technique comes into the cleaning stage of the process.


[Link](https://towardsdatascience.com/techniques-for-dimensionality-reduction-927a10135356)


# Feature extraction and elimination

A process of selecting a subset of columns for use in the model

## Missing values ratio

Columns with too many missing values will unlikely add additional value to a machine learning model.
Therefore, when a column exceed a given threshold for missing values it can be excluded for the training set.

## Low-variance filter

Columns that have a small variance are unlikely to add as much value to a machine learning model.
Thus, when a column goes below a given threshold for variance it can be excluded from the training set.

## High-correlation filter

multiple columns contain similar trends, then it’s enough to feed the machine learning algorithm just one of the columns.
To identify these columns, an analyst can use a Pearson’s Product Momentum Coefficient.

## Random forest

One way to eliminate features is to use a random forest technique, which creates, against the target attributes,
a decision tree, and then leverage the usages statistics to identify the most informative subset of features.


## Backwards-feature elimination

The backwards feature elimination, a top down approach, starts off with all the features within the dataset,
progressively removes one feature at a time, until the algorithm has reached the maximum tolerable error.


## Forward-feature construction

 The forward feature construction, unlike the backwards feature elimination technique, takes a bottom up approach,
where it starts with one feature, progressively adding the next feature with the highest increase in performance.



## UMAP

Out of the few dimensionality reduction algorithms, UMAP is arguably the best performing as it keeps a significant portion of the high-dimensional local structure in lower dimensionality.


# Linear algebra methods

## PCA (Principal Component Analysis)

**Goal **

PCA find a new set of dimensions such that all the dimensions are orthogonal (and hence linearly independent) and ranked according to the variance of the data along them.

Find transformation such that:

* The transformed features are linearly independent

* Dimensionality can be reduced by taking only the dimensions with the highest importance.

* Those newly found dimensions should minimize the projection error.

* The projected points should have maximum spread. i.e maximum variance.


PCA, an unsupervised machine learning algorithm, reduces the dimensions of a dataset while retaining as much information as possible.
To do this, the algorithm **creates a new set of features from an existing set of features** . 

Note, however, to avoid a feature with large values dominating the results, **all variables should be on the same scale** .

In Python’s scikit-learn, to achieve this, you can use the ‘StandardScaler’ function to ensure all of the variables are on the same scale.


PCA which simply maximizes the variance

PCA is a linear algorithm. It will not be able to interpret complex polynomial relationship between features. 
PCA is linear projection technique so it does not take non liner dependencies in to consideration.
On the other hand, t-SNE is based on probability distributions with random walk on neighborhood graphs to find the structure within the data. 

A major problem with, linear dimensionality reduction algorithms is that they concentrate on placing dissimilar data points far apart in a lower dimension representation. But in order to represent high dimension data on low dimension, non-linear manifold, it is important that similar datapoints must be represented close together, which is not what linear dimensionality reduction algorithms do.


[Best explanation of PCA on the web - video](https://youtu.be/TJdH6rPA-TI?list=PLzH6n4zXuckpfMu_4Ff8E7Z1behQks5ba)

[Great notebook](https://colab.research.google.com/drive/11Xe5fdTvA4Fg5nFNJhwaf_pHdw7DeMIt)

## LDA (Linear Discriminatory Analysis)

 LDA, a supervised technique, seeks to retain as much as possible of the discriminatory power for the dependent variables.
 To do this, first, the LDA algorithm computes the separability between classes; 
 second, it computes the distance between the sample of each class and the mean; 
 and lastly, it produces the dataset in a lower-dimensionality space.

## SVD (Singular Value Decomposition)

SVD extracts the most important features from the dataset.
This method is particularly popular because it’s based on simple, interpretable linear algebra models.



# Manifold

## Isomap embedding

## LLE (Locally linear embedding)

## t-SNE (t-Distributed Stochastic Neighbour)

t-SNE outputs provide better results than PCA and other linear dimensionality reduction models. This is because a linear method such as classical scaling is not good at modeling curved manifolds. It focuses on preserving the distances between widely separated data points rather than on preserving the distances between nearby data points.

By embedding, we're talking about projecting the data from high dimensions onto vectors in a smaller space.

## Auto-encoder

Another place you may have seen this trick is in unsupervised feature learning, where you train an auto-encoder to compress an input vector in the hidden layer, and decompress it back to the original in the output layer. After training it, you strip off the output layer (the decompression step) and just use the hidden layer--it's a trick for learning good image features without having labeled training data.


[Link](https://blogs.oracle.com/r/using-svd-for-dimensionality-reduction)

[Link](https://www.youtube.com/watch?v=UyAfmAZU_WI)