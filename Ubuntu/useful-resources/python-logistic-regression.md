# Logistic regression

## basic example
Simple example:

```pyhton
from sklearn.linear_model import LogisticRegression

# Make an instance of the Model
logisticRegr = LogisticRegression()


# Model is learning the relationship between digits (x_train) and labels (y_train)
logisticRegr.fit(x_train, y_train)


# Returns a NumPy Array
# Predict for One Observation (image)
logisticRegr.predict(x_test[0].reshape(1,-1))

predictions = logisticRegr.predict(x_test)

# Use score method to get accuracy of model
score = logisticRegr.score(x_test, y_test)
print(score)

```


## Calculating the confusion matrix

A confusion matrix is a table that is often used to describe the performance of a classification model (or “classifier”) on a set of test data for which the true values are known

```python
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn import metrics


plt.figure(figsize=(9,9))
sns.heatmap(cm, annot=True, fmt=".3f", linewidths=.5, square = True, cmap = 'Blues_r');
plt.ylabel('Actual label');
plt.xlabel('Predicted label');
all_sample_title = 'Accuracy Score: {0}'.format(score)
plt.title(all_sample_title, size = 15);
```


[url](https://towardsdatascience.com/logistic-regression-using-python-sklearn-numpy-mnist-handwriting-recognition-matplotlib-a6b31e2b166a)
