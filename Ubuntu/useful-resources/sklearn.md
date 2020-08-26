<!--ts-->
   * [scikit-learn](#scikit-learn)
      * [Preprocessing data](#preprocessing-data)
         * [Scaler](#scaler)
         * [Encoding categorical features](#encoding-categorical-features)
            * [Ordinal order](#ordinal-order)
            * [Ordinal order](#ordinal-order-1)
         * [Imputation of missing values](#imputation-of-missing-values)
            * [Missing value for numeric columns](#missing-value-for-numeric-columns)
            * [Missing value for categorical columns](#missing-value-for-categorical-columns)
         * [ColumnTransformer](#columntransformer)

<!-- Added by: gil_diy, at: 2020-08-26T14:41+03:00 -->

<!--te-->

# scikit-learn

## Preprocessing data


### Scaler

All features are centered around zero and have variance in the same order

```python
from sklearn import preprocessing
import numpy as np

X_train = np.array([[ 1., -1.,  2.],
                    [ 2.,  0.,  0.],
                    [ 0.,  1., -1.]])

X_scaled = preprocessing.scale(X_train)
# Now Scaled data has zero mean and unit variance. you can check:
# X_scaled.mean(axis=0)
# X_scaled.s td(axis=0)
```


### Encoding categorical features
#### Ordinal order

**The OrdinalEncoder** - this estimator transforms each categorical feature to one new feature of integers (0 to n_categories - 1)

#### Ordinal order

### Imputation of missing values

#### Missing value for numeric columns
For various reasons, **many real world datasets contain missing values**, often encoded as blanks, NaNs or other placeholders. Such datasets however are incompatible with scikit-learn estimators which assume that all values in an array are numerical, and that all have and hold meaning. A basic strategy to use incomplete datasets is to discard entire rows and/or columns containing missing values. However, this comes at the price of losing data which may be valuable (even though incomplete). A better strategy is to impute the missing values


```python
from sklearn.impute import SimpleImputer

imputer_mean = SimpleImputer(missing_values=np.nan, strategy='mean')

# Now let's say on columns 1,2,5 we would like to apply the imputer_mean:
X_train[:,[1,2,5]] = imputer_mean.fit_transform(X_train[:,[1,2,5]])


```

**Attention:** In case you would like to modify the type of the imputer just replace **imputer_mean**
with **imputer_median** as seen below:
```python
imputer_median = SimpleImputer(missing_values=np.nan, strategy='median')
```
#### Missing value for categorical columns

The same way as I have written above, just place the most common value in the empty cells:

```python
imputer_categorical = SimpleImputer(missing_values=np.nan, strategy='most_frequent')
```



### ColumnTransformer

Explained very well here for creating a concise code neat [Link](https://www.youtube.com/watch?v=OTEokOJ12ao)