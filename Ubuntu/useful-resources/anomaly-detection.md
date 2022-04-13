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

<!-- Added by: gil_diy, at: Wed 13 Apr 2022 14:50:01 IDT -->

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

* In an Isolation Forest, randomly sub-sampled data is processed in a tree structure based on randomly selected features.

* The samples that travel deeper into the tree are less likely to be anomalies as they required more cuts to isolate them.

* Similarly, the samples which end up in shorter branches indicate anomalies as it was easier for the tree to separate them from other observations.


```python
from sklearn.ensemble import IsolationForest
```

## Local Outlier Factor

## Robust Covariance

## One-Class SVM

```python
from sklearn.svm import OneClassSVM
```

## One-Class SVM (SGD)