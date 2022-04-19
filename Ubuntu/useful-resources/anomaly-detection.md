<!--ts-->
   * [Anomaly Detection](#anomaly-detection)
   * [Methods](#methods)
      * [Classical Approaches](#classical-approaches)
         * [Density based](#density-based)
            * [DBSCAN (Density-based spatial clustering)](#dbscan-density-based-spatial-clustering)
            * [LOF (Local Outlier Factor)](#lof-local-outlier-factor)
      * [Distance based](#distance-based)
         * [K-NN](#k-nn)
         * [Example](#example)
            * [K-MEANS](#k-means)
            * [Regression hyperplan distance](#regression-hyperplan-distance)
         * [Parametric](#parametric)
            * [GMM](#gmm)
            * [One Class SVMs](#one-class-svms)
            * [One-Class SVM (SGD)](#one-class-svm-sgd)
            * [Extreme value theory](#extreme-value-theory)
      * [Isolation Forest](#isolation-forest)
         * [Drawbacks](#drawbacks)
         * [Example](#example-1)
      * [Extended Isolation Forests](#extended-isolation-forests)
      * [Deep Learning approaches](#deep-learning-approaches)
         * [Autoencoder](#autoencoder)
            * [LSTM Autoencoder -  to capture the temporal dependencies of the data](#lstm-autoencoder----to-capture-the-temporal-dependencies-of-the-data)
      * [PyOD (Useful Package)](#pyod-useful-package)

<!-- Added by: gil_diy, at: Tue 19 Apr 2022 17:31:37 IDT -->

<!--te-->

# Anomaly Detection

The real challenge in anomaly detection is to construct the right data model to seperate outliers from noise and normal data.


# Methods

## Classical Approaches
### Density based

#### DBSCAN (Density-based spatial clustering)

* DBSCAN is a density-based and unsupervised machine learning algorithm.

* Density as a measure of the number of data points in a specified area. 

* The most exciting feature of DBSCAN clustering is that it is robust to outliers.

* It also does not require the number of clusters to be told beforehand, unlike K-Means, where we have to specify the number of centroids.

`eps` - Maximum distance between two samples for one to be considered to be connected to the other.
And the distance can be defined by any type of distance function, the “Euclidean distance” for example.


```python
from sklearn.cluster import DBSCAN

from sklearn.cluster import DBSCAN
dbscan=DBSCAN()
dbscan.fit(df[[“sepal_length”, “sepal_width”]])

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

## Distance based

### K-NN

* Although kNN is a supervised ML algorithm, when it comes to anomaly detection it takes an unsupervised approach

* There is no pre-determined labeling of “outlier” or “not-outlier” in the dataset

* Data scientists arbitrarily decide the cutoff values beyond which all observations.

Many distance-based techniques (e.g. KNNs) suffer the **curse of dimensionality** when they compute distances of every data point in the full feature space.

### Example

```python
data = pd.read_csv("https://raw.githubusercontent.com/uiuc-cse/data-fa14/gh-pages/data/iris.csv")  
# input data
df = data[["sepal_length", "sepal_width"]]

# scatterplot of inputs data
plt.scatter(df["sepal_length"], df["sepal_width"])
plt.ylabel('sepal_width')
plt.xlabel('sepal_length')
plt.show()

```

<p align="center">
  <img width="400" src="images/anomaly-detection/knn_data_points.png" title="Look into the image">
</p>


```python
# create arrays
X = df.values

# instantiate model
nbrs = NearestNeighbors(n_neighbors=3)  # fit model
nbrs.fit(X)

# distances and indexes of k-neaighbors from model outputs
distances, indexes = nbrs.kneighbors(X)  # plot mean of k-distances of each observation
plt.plot(distances.mean(axis=1))
plt.show()

# Plot the average distances for each of the observations in the dataset.
# As we can see, there are some spikes in distance measures, and these spikes are
# potentially anomalies or outliers in the dataset.
```


<p align="center">
  <img width="400" src="images/anomaly-detection/knn_avg_distance.png" title="Look into the image">
</p>

```python
# visually determine cutoff values > 0.15
outlier_index = np.where(distances.mean(axis=1) > 0.15)

# filter outlier values
outlier_values = df.iloc[outlier_index]

# plot data
plt.scatter(df["sepal_length"], df["sepal_width"], color="b", s=65)  # plot outlier values
plt.scatter(outlier_values["sepal_length"], outlier_values["sepal_width"], color="r")
plt.ylabel('sepal_width')
plt.xlabel('sepal_length')
plt.show()

```


<p align="center">
  <img width="400" src="images/anomaly-detection/knn_isolated.png" title="Look into the image">
</p>


[Reference](https://towardsdatascience.com/k-nearest-neighbors-knn-for-anomaly-detection-fdf8ee160d13)

#### K-MEANS

#### Regression hyperplan distance

### Parametric

#### GMM

#### One Class SVMs

```python
from sklearn.svm import OneClassSVM

# import data
data = pd.read_csv("https://raw.githubusercontent.com/uiuc-cse/data-fa14/gh-pages/data/iris.csv")# input data
df = data[["sepal_length", "sepal_width"]]
# model specification
model = OneClassSVM(kernel = 'rbf', gamma = 0.001, nu = 0.03).fit(df)
# prediction
y_pred = model.predict(df) # either -1 (Anomaly) or 1

# filter outlier index
outlier_index = where(y_pred == -1) # filter outlier values
outlier_values = df.iloc[outlier_index]
outlier_values

# visualize outputs
plt.scatter(data["sepal_length"], df["sepal_width"])
plt.scatter(outlier_values["sepal_length"], outlier_values["sepal_width"], c = "r")
plt.show()
```

#### One-Class SVM (SGD)

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

* In sklearn an anomaly score of `-1` is assigned to anomalies and `1` to normal points.

* The range of output from  IsolationForest `decision_function` is between -0.5 and 0.5, where smaller values mean more anomalous. The predict function then applies a threshold to this function to get either -1 (anomaly) or 1 (not anomaly). 
The `decision threshold` is stored as model.threshold_ and defaults to `0.0`.

* The funciton `decision_function(X)` - **Average anomaly score** of X of the base classifiers.

**Contamination** - percentage of anomalies present in the data

Isolation Forests are computationally efficient and have been proven to be very effective in Anomaly detection.


### Drawbacks

* The final anomaly score depends on the **contamination parameter**, provided while training the model. This implies that we **should have an idea of what percentage of the data is anomalous beforehand** to get a better prediction.

* The model suffers from a bias due to the way the branching takes place.


### Example

```python
import pandas as pddf = pd.DataFrame({
    'x': [1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 2.0],
    'y': [2.1, 2.4, 3.0, 2.6, 2.2, 2.8, 3.7]
}, index = ['A', 'B', 'C', 'D', 'E', 'F', 'G'])
```

<p align="center">
  <img width="400" src="images/anomaly-detection/data_points.png" title="Look into the image">
</p>

As we know Isolation forest, uses number of trees (i.e: `n_estimators = 100`):

```python
from sklearn.ensemble import IsolationForest

iforest = IsolationForest(n_estimators = 100).fit(df)
```

<p align="center">
  <img width="600" src="images/anomaly-detection/example_of_first_tree.png" title="Look into the image">
</p>

* Here are the 9 trees out of the 100 trees:

<p align="center">
  <img width="700" src="images/anomaly-detection/9_trees.png" title="Look into the image">
</p>

* Taking a look at these first 9 trees, we can already see a pattern: G tends to be at a much lower depth (1.44 on average) than any other point. Indeed, the second point is A with an average depth of 2.78.

* Conceptually, this is exactly how the algorithm works: **a lower average depth means a higher likelihood of being an outlier** .


Let’s see the scores estimated for each of our points:

```python
scores = iforest.score_samples(df)
```

<p align="center">
  <img width="400" src="images/anomaly-detection/score_samples_isolation_forests.png" title="Look into the image">
</p>

## Extended Isolation Forests

Extension to Isolation Forests called **‘Extended Isolation Forests’**. In EIF, horizontal and vertical cuts were replaced with cuts with **Random Slopes**.

<p align="center">
  <img width="400" src="images/anomaly-detection/extended_Isolation_forests.png" title="Look into the image">
</p>


## Deep Learning approaches

### Autoencoder

Why Do We Apply Dimensionality Reduction to Find Outliers?

* Recall that in an autoencoder model the number of the neurons of the input and output layers corresponds to the number of variables.

* The number of neurons of the hidden layers is always less than that of the outside layers

```python
threshold = np.mean(train_loss) + np.std(train_loss)
print('Threshold: ', threshold)
```

#### LSTM Autoencoder -  to capture the temporal dependencies of the data


## PyOD (Useful Package)

[pyod Github](https://github.com/yzhao062/pyod)

[Github - Examples](https://github.com/yzhao062/pyod/tree/master/examples)

* Pycaret uses under the hood PyOD too.

* Unsupervised techniques can detect many outliers. But due to its unspervised nature it is not stable, meaning overfitting to a specific dataset - Achieve Model Stability by Aggregating Multiple Models.


* binary labels (0: inliers, 1: outliers)

```python
y_train_scores = clf1.decision_scores_  # raw outlier scores

# get the prediction on the test data
y_test_pred = clf1.predict(X_test_scaled)  # outlier labels (0 or 1)
# clf.decision_function: Predict raw anomaly score of X using the fitted detector.
y_test_scores = clf1.decision_function(X_test_scaled)  # outlier scores

y_test_pred = pd.Series(y_test_pred)
y_test_scores = pd.Series(y_test_scores)

```


