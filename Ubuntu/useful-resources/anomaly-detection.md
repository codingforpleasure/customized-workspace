<!--ts-->
   * [Anomaly Detection](#anomaly-detection)
      * [Isolation Forest](#isolation-forest)
      * [Local Outlier Factor](#local-outlier-factor)
      * [Robust Covariance](#robust-covariance)
      * [One-Class SVM](#one-class-svm)
      * [One-Class SVM (SGD)](#one-class-svm-sgd)

<!-- Added by: gil_diy, at: Wed 13 Apr 2022 11:32:43 IDT -->

<!--te-->

# Anomaly Detection

The real challenge in anomaly detection is to construct the right data model to seperate outliers from noise and normal data.


## Isolation Forest

Isolation Forest is an unsupervised anomaly detection algorithm that uses a random forest algorithm (decision trees),
under the hood to detect outliers in the dataset. 

The algorithm tries to split or divide the data points such that each observation gets isolated from the others.



## Local Outlier Factor

## Robust Covariance

## One-Class SVM

## One-Class SVM (SGD)