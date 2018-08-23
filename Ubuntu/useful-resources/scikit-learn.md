# Scikit-learn

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
### Linear models
### KNN (K Nearest Neighbours)
### Support Vector machine


