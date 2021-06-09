<!--ts-->
   * [Classification](#classification)
      * [Regression](#regression)
         * [Logistic Regression](#logistic-regression)
         * [KNN](#knn)
         * [Desicion Trees](#desicion-trees)
      * [Ensemble](#ensemble)
         * [Bagging technique (Bootstrap aggregation)](#bagging-technique-bootstrap-aggregation)
            * [Random Forest](#random-forest)
         * [Boosting techniques](#boosting-techniques)
            * [Adaboost](#adaboost)
            * [Gradient Boosting](#gradient-boosting)
            * [XGboost (Extreme Gradient boost)](#xgboost-extreme-gradient-boost)
      * [Support Vector Machine (SVM)](#support-vector-machine-svm)
      * [Naive Bayes](#naive-bayes)

<!-- Added by: gil_diy, at: Wed 09 Jun 2021 12:54:37 IDT -->

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

### Bagging technique (Bootstrap aggregation)

[Youtube explanation](https://youtu.be/KIOeZ5cFZ50)

#### Random Forest

* Random Forest is **ensemble technique**

* Random Forest is a **bagging technique**

* Using **multiple desicion trees**

* Each desicion tree is built based on random sampled rows and random sampled columns (Features sampled)- Row sampling and Feature sampling.

* Using the majority vote for deciding the 

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/machine-learning/random_forest.png" title="tool tip here">
</p>


* **Has low Bias**
* As we we discussed of desicion tree, we mentioned it has a high variance, BUT when we combine all the decision tree with the respect to the majority vote the high variance will be converted to **low variance**.

* **classifier uses majority vote** and in case of **Regressor it will actually find the mean or median of the praticular output of all the decision trees**.


```python
from sklearn.ensemble import RandomForestClassifier

classifier = RandomForestClassifier(n_estimators=20, random_state=42)
classifier.fit(X_train,y_train)
```

* Hyperparameter for random forest is how many decision tree to use.

[Youtube explanation](https://youtu.be/nxFG5xdpDto)


### Boosting techniques

**Boosting is an ensemble technique** that attempts to create a strong classifier from a number of weak classifiers**

#### Adaboost

* Adaboost is ensemble technique

* AdaBoost is **adaptive** in the sense that subsequent weak learners are tweaked in favor of those instances misclassified by previous classifiers

* The trees will be a single node with two leaves.


```python
from sklearn.ensemble import AdaBoostClassifier
from sklearn.tree import DecisionTreeClassifier

clf = AdaBoostClassifier(DecisionTreeClassifier(max_depth=1),
                         n_estimators=200)

clf.fit(X_train, y_train)
y_pred = clf.predict(X_test)
```

[Youtube explanation](https://youtu.be/NLRO1-jp5F8)

#### Gradient Boosting

[Youtube explanation](https://youtu.be/Nol1hVtLOSg)

#### XGboost (Extreme Gradient boost)

* **XGboost** is ensemble technique




## Support Vector Machine (SVM)

## Naive Bayes