<!--ts-->
   * [Anomaly Detection](#anomaly-detection)
      * [Methods](#methods)
         * [Density based](#density-based)
            * [DBSCAN (Density-based spatial clustering)](#dbscan-density-based-spatial-clustering)
            * [LOF (Local Outlier Factor)](#lof-local-outlier-factor)
         * [Distance based](#distance-based)
            * [K-NN](#k-nn)
            * [K-MEANS](#k-means)
            * [Regression hyperplan distance](#regression-hyperplan-distance)
         * [Parametric](#parametric)
            * [GMM](#gmm)
            * [Single Class SVMs](#single-class-svms)
            * [Extreme value theory](#extreme-value-theory)
      * [Isolation Forest](#isolation-forest)
         * [Drawbacks](#drawbacks)
      * [Extended Isolation Forests](#extended-isolation-forests)
      * [Robust Covariance](#robust-covariance)
      * [One-Class SVM](#one-class-svm)
      * [One-Class SVM (SGD)](#one-class-svm-sgd)

<!-- Added by: gil_diy, at: Sat 16 Apr 2022 18:46:40 IDT -->

<!--te-->

# Anomaly Detection

The real challenge in anomaly detection is to construct the right data model to seperate outliers from noise and normal data.


## Methods

### Density based

#### DBSCAN (Density-based spatial clustering)

* Density as a measure of the number of data points in a specified area. 

`eps` - Maximum distance between two samples for one to be considered to be connected to the other.
And the distance can be defined by any type of distance function, the “Euclidean distance” for example.

core samples, the samples that are in areas of high density


```python
from sklearn.cluster import DBSCAN

```
#### LOF (Local Outlier Factor)

* The local outlier factor computes an anomaly score called anomaly score that measures how isolated the point is with **respect to the surrounding neighborhood**.

* Distance techniques can't identify Local Outlier, hence we switch to **density based techniques**
like the local Outlier factor algorithm.

* Basic idea of LOF: comparing the local density of a point with the densities of its neighbors. A has a much lower density than its neighbors.


```python
import numpy as np
from sklearn.neighbors import LocalOutlierFactor

X = [[-1.1], [0.2], [101.1], [0.3]]
clf = LocalOutlierFactor(n_neighbors=2)
clf.fit_predict(X)
array([ 1,  1, -1,  1])
```

### Distance based

#### K-NN

#### K-MEANS

#### Regression hyperplan distance

### Parametric

#### GMM

#### Single Class SVMs

#### Extreme value theory



## Isolation Forest

Isolation Forest is an unsupervised anomaly detection algorithm that uses a **random forest algorithm** (decision trees), under the hood to **detect outliers** in the dataset. 

* Isolation Forests are computationally efficient and have been proven to be very effective in Anomaly detection.

* In an Isolation Forest, randomly sub-sampled data is processed in a tree structure based on randomly selected features.

* The samples that travel deeper into the tree are **less likely to be anomalies as they required more cuts to isolate them**.

* Similarly, the samples which end up in **shorter branches indicate anomalies** as it was easier for the tree to separate them from other observations.

[isolation-forest well explained](https://towardsdatascience.com/isolation-forest-the-anomaly-detection-algorithm-any-data-scientist-should-know-1a99622eec2d)

[Reference]([Link](https://youtu.be/qNDcPUeCEPI))

<p align="center">
  <img width="400" src="images/anomaly-detection/Isolation_Forest.png" title="Look into the image">
</p>

```python
from sklearn.ensemble import IsolationForest


iso_forest = IsolationForest(contamination=0.1)
iso_forest.fit(X_train)

anomaly_scores = iso_forest.decision_function(x_validate)
```

* An anomaly score of `-1` is assigned to anomalies and `1` to normal points.

**Contamination** - percentage of anomalies present in the data

Isolation Forests are computationally efficient and have been proven to be very effective in Anomaly detection.

### Drawbacks

* The final anomaly score depends on the **contamination parameter**, provided while training the model. This implies that we **should have an idea of what percentage of the data is anomalous beforehand** to get a better prediction.

* The model suffers from a bias due to the way the branching takes place.

## Extended Isolation Forests

Extension to Isolation Forests called **‘Extended Isolation Forests’**. In EIF, horizontal and vertical cuts were replaced with cuts with **Random Slopes**.

<p align="center">
  <img width="400" src="images/anomaly-detection/extended_Isolation_forests.png" title="Look into the image">
</p>



## Robust Covariance

## One-Class SVM

```python
from sklearn.svm import OneClassSVM
```



## One-Class SVM (SGD)