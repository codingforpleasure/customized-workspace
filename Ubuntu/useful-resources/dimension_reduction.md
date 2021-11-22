<!--ts-->
   * [Dimension Reduction](#dimension-reduction)
      * [Missing values ratio](#missing-values-ratio)
      * [Low-variance filter](#low-variance-filter)
      * [High-correlation filter](#high-correlation-filter)
      * [Random forest](#random-forest)
      * [Backwards-feature elimination](#backwards-feature-elimination)
      * [PCA (Principal Component Analysis)](#pca-principal-component-analysis)
      * [SVD (Singular Value Decomposition)](#svd-singular-value-decomposition)

<!-- Added by: gil_diy, at: Mon 22 Nov 2021 19:00:30 IST -->

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



#Linear algebra methods

## PCA (Principal Component Analysis)

PCA, an unsupervised machine learning algorithm, reduces the dimensions of a dataset whilst retaining as much information as possible.
To do this, the algorithm **creates a new set of features from an existing set of features** . 

Note, however, to avoid a feature with large values dominating the results, **all variables should be on the same scale** .
In Python’s scikit-learn, to achieve this, you can use the ‘StandardScaler’ function to ensure all of the variables are on the same scale.

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



[Link](https://blogs.oracle.com/r/using-svd-for-dimensionality-reduction)

[Link](https://www.youtube.com/watch?v=UyAfmAZU_WI)