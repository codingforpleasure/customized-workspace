<!--ts-->
   * [Scikit-learn](#scikit-learn)
      * [preprocessing](#preprocessing)
         * [Handling Text and Categorical Attributes](#handling-text-and-categorical-attributes)
            * [OrdinalEncoder](#ordinalencoder)
            * [OneHotEncoder](#onehotencoder)
      * [Multiclass Classification](#multiclass-classification)
         * [OvR (One-vs-Rest)](#ovr-one-vs-rest)
         * [OvO (One-vs-One)](#ovo-one-vs-one)
      * [Classification (Categorial data)](#classification-categorial-data)
         * [Support Vector Machine classifier](#support-vector-machine-classifier)
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
      * [Dimensionality Reduction](#dimensionality-reduction)
         * [PCA](#pca)
            * [Choosing the right number of Dimensions](#choosing-the-right-number-of-dimensions)

<!-- Added by: gil_diy, at: 2020-01-15T14:00+02:00 -->

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

## Multiclass Classification

The following algorithms are capable of handling multiple classes natively:

* **SGD Classifiers**
* **Random Forest Classifiers**
* **Naive Bayes Classifiers**

However the following algorithms are stricly binary classifiers:

* **Logistic Regression**
* **Support Vector Machine**


### OvR (One-vs-Rest)
* One way to create a system that can classify the digit images into 10 classes (from 0 to 9) is to train 10 binary classifiers, one fo reach digit.
then when you want to classify an image, you get the desicion score from each
classifier for that image and you select the class whose classifier outputs the highest score. This is called **One-versus-Rest** (OvR) strategy.

### OvO (One-vs-One)
* Another strategy is to train a binary classifier for **every pair** of digits:
one to distinguish 0s and 1s, another to distinguish 0s and 2s, another for 1s and 2s, and so on. This is called **One-versus-One** (OvO), If there are N classes, you need train N*(N-1)/2 classifiers.

* Therefore for MNIST problem , this means training 45 binary classifiers. When you want to classify an image you have to run the image through all 45 classifiers and see which class wins the most duels.
The main advantage of OvO is that each classifier **only needs to be trained on the part of the training set for two classes that it must distnguish**.

* For **Support Machine Classifiers** OvO is preferred because it is faster
to train many classifiers on small training sets than to train few classifiers on large training sets.




## Classification (Categorial data)
* binary classification (tumor: benign, malignant)
* multiclass classification (books: maths, physics, psychology, etc.)
* example algorithms: KNN, Linear Models,  Decision Trees, SVMs ,etc

### Support Vector Machine classifier
```python
from sklearn.svm import SVC
svm_clf = SVC()
svm_clf.fit(X_train, y_train)
svm_clf.predict([some_digit])
```

This code trains the SVC on the training set using the **original target classes from 0 to 9** (y_train), then it makes a prediction. Under the hood, Scikit-Learn actually used the OvO startegy: It trained **45 Binary classifiers** , got their desicion scores for the image and selected the class that won the most.

```python
some_digits_score = svm_clf.decision_function([some_digit])
print(some_digits_score)
print(np.argmax(some_digits_score))
```

## Regression (Continuous data)
* predicting income, price of stock, age, nd other continous data
* example algoriithms: KNN, Linear Models, Decision Trees, SVMs ,etc


Linear models (LinReg, LogReg, Lasso, Ridged, etc)

## Type of Classifiers:

### Desicion Tree classifier

Decision Trees (DTs) are a non-parametric supervised learning method used for classification and regression. The goal is to create a model that predicts the value of a target variable by learning simple decision rules inferred from the data features.

```python
from sklearn.datasets import load_iris
from sklearn.tree import DecisionTreeClassifier

iris = load_iris()
X = iris.data[:,:2] # Petal length and width
y = iris.target

tree_clf = DecisionTreeClassifier(max_depth = 2)
tree_clf.fit(x, y)
```

Visualizing the Decision tree:

```python
from sklearn.tree import export_graphvis

export_graphvis(
   tree_clf,
   out_file = image_path('iris_tree.dot')
   feature_names = iris.feature_names[2:]
   class_names =iris.target_names,
   rounded = True,
   filled = True
   )
```

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

## Dimensionality Reduction
### PCA

```python
from sklearn.decomposition import PCA

pca = PCA(n_components = 2)
X2D = pca.fit_transform(x)
```

**Explained variance ratio**
The ratio indicates the proportion of the dataset's
variance that lies along each principal component.
For example let's look at the explained variance ratios of the first two components of the 3D dataset
```python
pca.explained_variance_ratio_
```

The output tells you that 84.2% of the dataset's variance lies along the first Principal Component, and 14.6% lies along the second Princoipal Conponent. This leaves less than 1.2% for the third Prinicilap conponent,
so it is reasonable to assume that the third PC probably carries little information.

#### Choosing the right number of Dimensions

* In case you will want to reduce dimensionality for **data visualization** then you should reduce down to two or three dimensions.
* Instead of arbitrary choosing the number of dimensions to reduce down to, it is simpler to choose the number of dimensions that add up to sufficiently large portion of the variance (eg: 95%).

```python
pca = PCA()
pca.fit(X_train)
cumsum = np.cumsum(pca.explained_variance_ratio_)
d = np.argmax(cumsum >= 0.95) + 1
```
Another better approach would be instead of specifying the
number of principal componentes you want to preserve, you can set n_componennts to be float between 0.0 to 1.0 indicating the **ratio you wish to preserve.**

```python
pca = PCA(n_components = 0.95)
pca.fit(X_train)
```
