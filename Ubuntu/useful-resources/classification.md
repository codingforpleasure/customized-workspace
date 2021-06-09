<!--ts-->
   * [Classification](#classification)
      * [Regression](#regression)
         * [Logistic Regression](#logistic-regression)
         * [KNN](#knn)
         * [Desicion Trees](#desicion-trees)
      * [Ensemble](#ensemble)
         * [Random Forest](#random-forest)
         * [Support Vector Machine (SVM)](#support-vector-machine-svm)
         * [Naive Bayes](#naive-bayes)
         * [XGboost](#xgboost)
         * [Adaboost](#adaboost)

<!-- Added by: gil_diy, at: Wed 09 Jun 2021 08:43:53 IDT -->

<!--te-->

# Classification

## Regression
### Logistic Regression
### KNN
### Desicion Trees

* High variance - when we creating a decision tree to it's **complete depth**, it leads to over fitting

## Ensemble

They don't overfit as easily as the other methods.
Ensemble methods are the most important and powerful machine learning tool and they don't suffer from the drawbacks of the other machine learning methods.



### Random Forest

* Random Forest is ensemble technique

* Random Forest is a bagging technique

* Using multiple desicion trees

* Each desicion tree is built based on random sampled rows and random sampled columns (Features sampled)- Row sampling and Feature sampling.

* Using the majority vote for deciding the 

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/machine-learning/random_forest.png" title="tool tip here">
</p>


* **Has low Bias**
* As we we discussed of desicion tree, we mentioned it has a high variance, BUT when we combine all the decision tree with the respect to the majority vote the high variance will be converted to **low variance**.

* **classifier uses majority vote** and in case of **Regressor it will actually find the mean or median of the praticular output of all the decision trees**.


* Hyperparameter for random forest is how many decision tree to use.

[Youtube explanation](https://youtu.be/nxFG5xdpDto)


## Boosting techniques

**Boosting is an ensemble technique** that attempts to create a strong classifier from a number of weak classifiers**

### Adaboost

* Adaboost is ensemble technique


[Youtube explanation](https://youtu.be/NLRO1-jp5F8)

### XGboost (Extreme Gradient boost)

* **XGboost** is ensemble technique


## Terminology

### Gradient Boost


[Youtube explanation](https://youtu.be/Nol1hVtLOSg)


### Bagging

### Boosting

### Support Vector Machine (SVM)
### Naive Bayes