<!--ts-->
   * [Anomaly Detection](#anomaly-detection)
      * [Methods](#methods)
         * [Density based](#density-based)
            * [DBSCAN](#dbscan)
            * [LOF](#lof)
         * [Distance based](#distance-based)
            * [K-NN](#k-nn)
            * [K-MEANS](#k-means)
            * [Regression hyperplan distance](#regression-hyperplan-distance)
         * [Parametric](#parametric)
            * [GMM](#gmm)
            * [Single Class SVMs](#single-class-svms)
            * [Extreme value theory](#extreme-value-theory)
      * [Isolation Forest](#isolation-forest)
      * [Local Outlier Factor](#local-outlier-factor)
      * [Robust Covariance](#robust-covariance)
      * [One-Class SVM](#one-class-svm)
      * [One-Class SVM (SGD)](#one-class-svm-sgd)

<!-- Added by: gil_diy, at: Wed 13 Apr 2022 12:11:11 IDT -->

<!--te-->

# Anomaly Detection

The real challenge in anomaly detection is to construct the right data model to seperate outliers from noise and normal data.


## Methods

### Density based

#### DBSCAN

#### LOF

### Distance based

#### K-NN

#### K-MEANS

#### Regression hyperplan distance

### Parametric

#### GMM

#### Single Class SVMs

#### Extreme value theory



## Isolation Forest

Isolation Forest is an unsupervised anomaly detection algorithm that uses a random forest algorithm (decision trees),
under the hood to detect outliers in the dataset. 

The algorithm tries to split or divide the data points such that each observation gets isolated from the others.



## Local Outlier Factor

## Robust Covariance

## One-Class SVM

```python
from sklearn.svm import OneClassSVM
```

## One-Class SVM (SGD)