<!--ts-->
   * [Scikit-learn](#scikit-learn)
      * [Classification (Categorial data)](#classification-categorial-data)
      * [Regression (Continuous data)](#regression-continuous-data)
      * [Type of Classifiers:](#type-of-classifiers)
         * [Desicion Tree classifier](#desicion-tree-classifier)
            * [Advantages of decision trees are:](#advantages-of-decision-trees-are)
            * [Disadvantages of decision trees are:](#disadvantages-of-decision-trees-are)
            * [Code exmaple:](#code-exmaple)
         * [Linear models](#linear-models)
         * [KNN (K Nearest Neighbours)](#knn-k-nearest-neighbours)
         * [Support Vector machine](#support-vector-machine)
      * [Binarizing label features](#binarizing-label-features)
      * [Evaluation metrics](#evaluation-metrics)
         * [Jaccard coefficient](#jaccard-coefficient)
         * [F1-score](#f1-score)
         * [LogLoss](#logloss)

<!-- Added by: gil_diy, at: 2019-10-12T15:29+03:00 -->

<!--te-->

# Scikit-learn

## preprocessing

### Handling Text and Categorical Attributes

#### OrdinalEncoder

Use it if you know there is an **Order** between the elements:

```python
from sklearn.preprocessing import OrdinalEncoder

housing_cat = housing["ocean_proximity"]
housing_cat.head(10)

ordinal_encoder = OrdinalEncoder()
housing_cat_encoded = ordinal_encoder.fit_transform(housing_cat)
housing_cat_encoded[:10]
```

#### OneHotEncoder
```python
from sklearn.preprocessing import OneHotEncoder
cat_encoder = OneHotEncoder()
housing_cat_1hot =cat_encoder.fit_transform(housing_cat)
```

**Note:**

* Output is a **SciPy sparse matrix**, instead of Numpy array.

* This is very useful when you have  categorical attributes with thousands of categories.

* After one-hot encodin, we get a matrix with thousands of columns, and the matrix is full of 0s except for a single1 per row.

* If you really want to convert it to a (dense) NumPy array, just call the toarray() method:

```python
housing_cat_1hot.toarray()
```

* You can get the list of categories using the encoder's categorie_ instance variable:

```python
cat_encoder.categories_
```



data  = x
target = y

```python
from sklearn.model_selection import train_test_split

# Create a training-test split
(train_data, test_data, train_target, test_target) = train_test_split(data,
																	labels,
																	test_size=0.25,
																	random_state=0)
```

```Python
# Train it on our training data
my_classifier.fit(train_data, train_target)

my_classifier.predict(test_data)

```


## Classification (Categorial data)
* binary classification (tumor: benign, malignant)
* multiclass classification (books: maths, physics, psychology, etc.)
* example algorithms: KNN, Linear Models,  Decision Trees, SVMs ,etc

## Regression (Continuous data)
* predicting income, price of stock, age, nd other continous data
* example algoriithms: KNN, Linear Models, Decision Trees, SVMs ,etc


Linear models (LinReg, LogReg, Lasso, Ridged, etc)

## Type of Classifiers:

### Desicion Tree classifier

Decision Trees (DTs) are a non-parametric supervised learning method used for classification and regression. The
goal is to create a model that predicts the value of a target variable by learning simple decision rules inferred from the data features.

#### Advantages of decision trees are:
(1) Simple to understand and to interpret. Trees can be visualised.

(2) Requires little data preparation. Other techniques often require data normalisation, dummy variables need to be created and blank values to be removed. Note however that this module does not support missing values.

(3) The cost of using the tree (i.e., predicting data) is logarithmic in the number of data points used to train the tree.


#### Disadvantages of decision trees are:

(1) Decision-tree learners can create over-complex trees that do not generalise the data well. This is called overfitting. Mechanisms such as pruning (not currently supported), setting the minimum number of samples required at a leaf node or setting the maximum depth of the tree are necessary to avoid this problem.

(2) Decision trees can be unstable because small variations in the data might result in a completely different tree being generated. This problem is mitigated by using decision trees within an ensemble.

(3) Decision tree learners create biased trees if some classes dominate. It is therefore recommended to balance the dataset prior to fitting with the decision tree.

#### Code exmaple:

DecisionTreeClassifier is a class capable of performing multi-class classification on a dataset.

```python
from sklearn.tree import tree

iris = load_iris()
clf_decision_tree = tree.DecisionTreeClassifier()
clf_decision_tree = clf_decision_tree.fit(iris.data, iris.target)

# Once  trained, we can easily plot tree with the plot_tree function:
clf_decision_tree.plot_tree(clf_decision_tree)

```

**DecisionTreeClassifier**'s parameters:

Parameters | description
------------|-----
criterion | The function to measure the quality of split (`entropy` - for the information gain).
max_depth | The maximum depth of the Tree, the default value is None
max_features | The number of features to consider when looking for the best split.


### Linear models
### KNN (K Nearest Neighbours)
### Support Vector machine

## Binarizing label features

There are another way to work with categorical variables.
Instead of dealng with categorical variables use OneHotEncode, we might use LabelBinarizer.

## Evaluation metrics

### Jaccard coefficient
* A commonly used measure of overlap of two sets A and B is the Jaccard coefficient:

`jaccard(A, B) = |intersction_of(A,B)|/ |union_of(A,B)|`

therefore according to the formula:

* jaccard(A,A) = 1

* if intersction_of(A,B)==0 then jaccard(A,B) = 0

* 0 <= jaccard(A, B) <= 1



In python, for the binary case:
```python
from sklearn.metrics import jaccard_score

jaccard_score(y_true[0], y_pred[0])
```

### F1-score

F-Score is a measure of a test's accuracy.

```python
from sklearn.metrics import f1_score

f1_score(y_true, y_pred)
```

### LogLoss

Log loss, also called logistic regression loss or cross-entropy loss, is defined on probability estimates. It is commonly used in (multinomial) logistic regression and neural networks, as well as in some variants of expectation-maximization, and can be **used to evaluate the probability outputs (predict_proba) of a classifier instead of its discrete predictions.**

```python
from sklearn.metrics import log_loss
y_true = [0, 0, 1, 1]
y_pred = [[.9, .1], [.8, .2], [.3, .7], [.01, .99]]
log_loss(y_true, y_pred)
```
