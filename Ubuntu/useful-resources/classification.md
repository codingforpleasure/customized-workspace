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
            * [Adaboost (Adaptive boosting)](#adaboost-adaptive-boosting)
            * [Gradient Boosting](#gradient-boosting)
            * [XGboost (Extreme Gradient boosted trees)](#xgboost-extreme-gradient-boosted-trees)
            * [LightGBM](#lightgbm)
            * [Catboost](#catboost)
         * [The difference between Random Forest to Adaboost](#the-difference-between-random-forest-to-adaboost)
         * [The difference between Adaboost to Gradient Boost](#the-difference-between-adaboost-to-gradient-boost)
      * [Support Vector Machine (SVM)](#support-vector-machine-svm)
      * [Naive Bayes](#naive-bayes)

<!-- Added by: gil_diy, at: Mon 10 Jan 2022 20:26:46 IST -->

<!--te-->

# Classification

## Regression
### Logistic Regression
### KNN
### Desicion Trees

* High variance - when we creating a decision tree to it's **complete depth**, it leads to over fitting

## Ensemble

Ensemble is a learning technique in which multiple individual model combines together to create a master model.

They don't overfit as easily as the other methods.
Ensemble methods are the most important and powerful machine learning tool and they don't suffer from the drawbacks of the other machine learning methods.

Bagging and boosting are ways to implement ensemble models. 

### Bagging technique (Bootstrap aggregation)


Allow training instances to be sampled several times across multiple predictors, but only bagging allows training instances to be sampled several times for the same predictor.


* When sampling is performed **without replacement**, it is called **pasting** .


Each individual predictor has a higher bias than if it were trained on the original training set, but
aggregation reduces both bias and variance.  Generally, the net result is that the ensemble has a similar bias but a **lower variance** than a single predictor trained on the
original training set.

[Youtube explanation](https://youtu.be/KIOeZ5cFZ50)

#### Random Forest

* Random Forest is **ensemble technique**

* Random Forest is an implementation of **bagging technique**

* Using **multiple desicion trees**

* Each desicion tree is built based on random sampled rows and random sampled columns (Features sampled)- Row sampling and Feature sampling.

* Using the majority vote for deciding the 

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/machine-learning/random_forest.png" title="tool tip here">
</p>


* **Has low Bias**
* As we we discussed of desicion tree, we mentioned it has a high variance, BUT when we combine all the decision trees with the respect to the majority vote the high variance will be converted to **low variance**.

* **classifier uses majority vote** and in case of **Regressor it will actually find the mean or median of the praticular output of all the decision trees**.


```python
from sklearn.ensemble import RandomForestClassifier

classifier = RandomForestClassifier(n_estimators=20, random_state=42)
classifier.fit(X_train,y_train)
```

* Hyperparameter for random forest is how many decision tree to use.

[Youtube explanation](https://youtu.be/nxFG5xdpDto)


### Boosting techniques

**Boosting is an ensemble technique** that attempts to create a strong classifier from a number of weak classifiers (weak learners).

In other words a set of low accurate classifier to create a highly accurate classifier.


<p align="center"> <!-- style="width:400px;" -->
  <img src="images/machine-learning/Ensemble_Boosting.png" title="tool tip here">
</p>


* Boosting algorithms consist of **iteratively learning weak classifiers** with respect to a distribution and adding them to a final strong classifier.

* When they are added, they are weighted in a way that is related to the weak learners' accuracy. After a weak learner is added, **the data weights are readjusted**, known as "re-weighting".

* Misclassified input data gain a higher weight and examples that are classified correctly lose weight.

* Thus, future weak learners focus more on the examples that previous weak learners misclassified. 

#### Adaboost (Adaptive boosting)

* Adaboost is ensemble technique spcefically it's a Boosting technique

* The output of **weak learners** is combined into a weighted sum that represents the final output of the boosted classifier.

* AdaBoost is **adaptive** in the sense that subsequent weak learners are tweaked in favor of those instances misclassified by previous classifiers

* AdaBoost is an **iterative ensemble** method

* All the base learners are decision trees will consist of a **single node with two leaves** (Thet are called** stumps**)


The stump with the **lowest entropy/gini** will be first.



* It iteratively corrects the mistakes of the weak classifier and improves accuracy by combining weak learners.

* The **weights of the records gets updated**, **all the missclasiffied records/entries** (all the records which the praticular weak model did not perform well), **thier weights are increased**, which means more weight is given to those records for the next weak model.

* You can use many base classifiers with AdaBoost. AdaBoost is not prone to overfitting.

* AdaBoost algorithms can be used for both classification and regression problem.

* The cons: AdaBoost is **sensitive to noise data**. It is highly affected by outliers because it tries to fit each point perfectly

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/machine-learning/adaboost.jpg" title="tool tip here">
</p>

```python
from sklearn.ensemble import AdaBoostClassifier
from sklearn.tree import DecisionTreeClassifier


# base_estimator: It is a weak learner used to train the model.
#                 It uses DecisionTreeClassifier as default weak learner
#				  for training purpose. You can also specify different 
#                 machine learning algorithms.
#
# n_estimators: Number of weak learners to train iteratively.
# 
# learning_rate: It contributes to the weights of weak learners.
#                It uses 1 as a default value.

clf = AdaBoostClassifier(DecisionTreeClassifier(max_depth=1),
                         n_estimators=200)

# Train Adaboost Classifer
clf.fit(X_train, y_train)
y_pred = clf.predict(X_test)
```

Or we can use different base learners, such as SVM:

```python
from sklearn.ensemble import AdaBoostClassifier

# Import Support Vector Classifier
from sklearn.svm import SVC
#Import scikit-learn metrics module for accuracy calculation
from sklearn import metrics
svc=SVC(probability=True, kernel='linear')

# Create adaboost classifer object
abc =AdaBoostClassifier(n_estimators=50, base_estimator=svc,learning_rate=1)

# Train Adaboost Classifer
model = abc.fit(X_train, y_train)

#Predict the response for test dataset
y_pred = model.predict(X_test)


# Model Accuracy, how often is the classifier correct?
print("Accuracy:",metrics.accuracy_score(y_test, y_pred))
```

[Youtube explanation](https://www.youtube.com/watch?v=HRBMlBiOo7Q)

[Youtube explanation](https://youtu.be/NLRO1-jp5F8)



#### Gradient Boosting

The learning is done by optimizing the loss function.

In differ to Adaboost the trees depth in Gradient Boost is between 8 to 32.

```python
from sklearn.ensemble import GradientBoostingRegressor

gbrt = GradientBoostingRegressor(max_depth=2, n_estimators=1, learning_rate=1.0)
gbrt.fit(X,y)
```

[Youtube explanation](https://youtu.be/j034-r3O2Cg)

[Youtube explanation](https://youtu.be/Nol1hVtLOSg)

#### XGboost (Extreme Gradient boosted trees)

* Each tree boosts attributes that led to misclassifications of previous tree

* Regularized boosting (prevents overfitting)

* Can handle missing values automatically

* Parallel processing (Scale well on multiple machine/cores)

* Can cross-validate at each iteration (Enables early stopping, finding optimal number of iterations)

* Tree pruning (generally results in deeper, but optimized trees)

* **XGboost** is ensemble technique

[Link](https://youtu.be/OQKQHNCVf5k)


#### LightGBM

#### Catboost

### The difference between Random Forest to Adaboost

Random Forest | Adaboost
------------|-----
 **Parallel** - The individual Decision Trees are built from the main data parallelly independently from each other   | **Sequential** - model2 is depend on model1 and similary model3 is depend on model2 etc.

 All models have **equal say** or equall vote in the final model | All the models **don't have equal say** (weights)

 Uses fully **grown trees** | Each weak model uses **Stumps - one root node and two leaf nodes** 


### The difference between Adaboost to Gradient Boost

Adaboost | Gradient boost
------------|-----
Many weak models are get trained sequentially (one by one) The** weights'** of the records of all missclassfied records are get updated | Learning by **optimizing the loss function**

The trees are **Stumps**| The **trees are much bigger**, the number of leaf nodes is in the range 8 to 32.


## Support Vector Machine (SVM)

## Naive Bayes