<!--ts-->
   * [Machine learning](#machine-learning)
      * [The relationship between all terminalogy (illustration)](#the-relationship-between-all-terminalogy-illustration)
      * [Machine learning techniques:](#machine-learning-techniques)
      * [Flavors of Machine Learning](#flavors-of-machine-learning)
         * [<strong>Supervised</strong>](#supervised)
         * [<strong>Unsupervised</strong>](#unsupervised)
      * [Unsupervised learning techniques:](#unsupervised-learning-techniques)
      * [Supervised vs Unsupervised learning](#supervised-vs-unsupervised-learning)
      * [Under and Over-fitting](#under-and-over-fitting)
      * [<strong>Over fitting</strong>](#over-fitting)
      * [<strong>Under-fitting</strong>](#under-fitting)
      * [Regression algorithms](#regression-algorithms)
      * [<strong>Non linear regression</strong>](#non-linear-regression)
      * [Regression accuracy](#regression-accuracy)
      * [Classification algorithms in machine learning](#classification-algorithms-in-machine-learning)
      * [Biasand Variance Tradeoff](#biasand-variance-tradeoff)
      * [K Nearest Neighbhors (KNN)](#k-nearest-neighbhors-knn)

<!-- Added by: gil_diy, at: Sat 05 Mar 2022 09:24:16 IST -->

<!--te-->

[Link](https://www.youtube.com/watch?v=3VsuTlImyiY)

# Machine learning

## The relationship between all terminalogy (illustration)

<p align="center">
  <img src="images/machine-learning/machine_learning_terms.jpg" title="sun_of_terms">
</p>


Cardinality = How many unique values

## Machine learning techniques:

Technique name | explanation | Example
------------|-----|---
Regression/Estimation | Predicting continuous values | Predicting a price of a house
Classification | Predicting the item class/category of a case | if a cell is a benign or malignant.
Clustering | Finding the structure of data, for finding similar cases; summarization | Customer segmentation in the banking field
Associations | Associating frequent co-occuring items/events | For example groceries items which are usually getting buyed together by a praticulr customer
Anomaly detection | Discovering abnormal and unusual cases | Is used for card fraud detection
Sequence mining | Predicting next events | click stream in websites (Markov Model, HMM)
Dimension Reduction | Reducing the size of data (PCA) |
Recommnedation systems | Recommending items |

## Flavors of Machine Learning
### **Supervised**
You have information about the quality you're intrested in for each piece of training data and want to predict that quality.

* **Classification** Assign each data point to one of a set classes (e.g cat or dog)

* **Regression**  Predict the Value of quality based on given information (e.g dog's weight given age and breed)

### **Unsupervised** 
You don't have information about a specific quality you're intrested in.

* **Clustering** Split your data into groups of similar samples.

* **Dimension reduction** Given high-dimensional data, reduce it into a smaller number of dimentsions while minimizing information loss (data compression).

On Unsupervised learning the model works on its own to discover information, all of this data is unlabeled.

Unsupervised learning has more difficult algorithms then supervised learning, since we know little information about the data.

## Unsupervised learning techniques:
* Dimension reduction (Feature selection, by reducing redundant features to make the classification easier)
* Density estimation (Explore the data for find the structure )
* Market basket analysis (Model techinuqe based on the theory If you buy a certain group of items you more likely to buy another group of itmes )
* clustering (Clustering is grouping of data points or objects that are somehow similar)


## Supervised vs Unsupervised learning

Supervised learning | Unsupervised learning
--------------------|------------------------
* **Classification** | * **Clustering**
Classifies labeled data | Finds patterns and groupings from unlabled data
* **Regressions:** | * Has fewer evaluation methods than supervised learning
Predicts trends using previous labeled data |
* Has more evaluation methods | * Less controlled environment
* Controlled environment |

## Under and Over-fitting


When you are building a predictor you have choice of algorithms to can apply,
predictor is just a function , some function are more flexiable then others, more complex .
other functions are more rigid.

**Over fitting**
----------------
is when you pick a function which is too complex (flexible)

* Fits "noise" in the training data.
* Patterns that will not re-appear

**Under-fitting**
-------------------
* Predictor too simplistic (too rigid)
* Not powerful enough to capture notable patterms in data



**Examples:**

For Regression :

## Regression algorithms
* Linear regression (Very fast, No parameter tuning)
* Ordinal regression
* Poisson regression
* Fast forest quantile regression
* Linear, Polynomial, Lasso, Stepwise. Ridge regression
* Bayesian linear regression
* Neural network regression
* Decision forest regression
* Boosted decision tree regression
* KNN (K-nearest neighbors)

## **Non linear regression**
* To model non-linear relationship between the dependent variable and a set of independent variables.
* y hat must be a non-linear function of paramters theta, not necessarily the features x.

## Regression accuracy
* MAE  (Mean Absolute error)
* MSE  (Mean Square Error)
* RMSE (Root Mean Square Error)


<p align="center">
  <img src="images/machine-learning/regression_example_over_under_fitting.png" title="sigmoid">
</p>

Over-fit: the model is overly trained to the dataset, which may capture noise and produce a non-generalized model

For Classification:
Example: the loan bank prediction
suppose a bank is concern for the potential for loan not be repaid, if previous loan default data can be used to predict which customers are likely to have problems repaying loans these bad risk customers can either have their loan application declined or offered alternative products.the goal of a loan default predictor is to use existing loan default data which has information about the customers such age, income, education to build a classifier. pass a new customer or potential future default to the model and then label it. This specific example which predict who might return a loan is a binary classifier.

## Classification algorithms in machine learning

* decision trees
* Naive bayes
* Linear Discriminant analysis
* k-Nearest Neighbor
* Logistic regression
* Neural Network
* Support Vector Machines (SVM)

<p align="center">
  <img src="images/machine-learning/classifying_example_over_under_fitting.png" title="sigmoid">
</p>

## Biasand Variance Tradeoff

* **Bias** - An error . Models with **high bias** pays very little attention to the training data and 
 **oversimplifies the model**.

<p align="center">
  <img width="400" src="images/machine-learning/high_bias.jpg" title="Look into the image">
</p>


* **Variance** - An error . **High variance** can cause an algorithm to model the random noise in the training data, rather than the intended outputs. In other words, model with high variance pays a lot of information to traing data and **does not generlize on the data which it hasn't seen before**.


<p align="center">
  <img width="400" src="images/machine-learning/high_variance.jpg" title="Look into the image">
</p>



* We always aim for low bias and low variance:

<p align="center">
  <img width="400" src="images/machine-learning/low_bias_low_variance.jpg" title="Look into the image">
</p>


## K Nearest Neighbhors (KNN)




In python:

```python
from sklearn.model_selection import cross_val_score

# We got a vector of 10 scores for each fold
scores = cross_val_score(clf_knn, features, target, cv=10)
```


[Nice Reference](https://www.youtube.com/watch?v=6dbrR-WymjI)


## 