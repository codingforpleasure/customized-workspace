<!--ts-->
   * [scikit-learn](#scikit-learn)
      * [Preprocessing data](#preprocessing-data)
         * [Scaler](#scaler)
         * [Categorical encoding](#categorical-encoding)
            * [Label encoding](#label-encoding)
               * [Not an Ordinal variable](#not-an-ordinal-variable)
               * [Ordinal label encoding](#ordinal-label-encoding)
            * [One-Hot Encoding](#one-hot-encoding)
         * [Imputation of missing values](#imputation-of-missing-values)
            * [Missing value for numeric columns](#missing-value-for-numeric-columns)
            * [Missing value for categorical columns](#missing-value-for-categorical-columns)
         * [ColumnTransformer (Super nice)](#columntransformer-super-nice)
         * [Dimension Reduction techniques](#dimension-reduction-techniques)
            * [PCA (Principal Component Analysis)](#pca-principal-component-analysis)

<!-- Added by: gil_diy, at: Mon Jan  4 17:13:42 IST 2021 -->

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


### Categorical encoding 

**Categorical encoding** is a process of converting categories to numbers.

#### Label encoding

##### Not an Ordinal variable

```python
label_encoder = LabelEncoder()
df[['fuel']] = label_encoder.fit_transform([['fuel']])
```
##### Ordinal label encoding

**The OrdinalEncoder** - this estimator transforms each categorical feature to one new feature of integers (0 to n_categories - 1)

```python
types_of_cylinders = ['two', 'three', 'four', 'five', 'six', 'eight', 'twelve']
ordinal_encoder_for_cylinders = OrdinalEncoder(categories=[types_of_cylinders])
df[["cylinders"]] = ordinal_encoder_for_cylinders.fit_transform(df[["cylinders"]])
```

#### One-Hot Encoding

[Link](https://www.analyticsvidhya.com/blog/2020/03/one-hot-encoding-vs-label-encoding-using-scikit-learn/)




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



### ColumnTransformer (Super nice)

Explained very well here for creating a concise code neat [Link](https://www.youtube.com/watch?v=OTEokOJ12ao)

[Reference](https://machinelearningmastery.com/columntransformer-for-numerical-and-categorical-data/)


### Dimension Reduction techniques

#### PCA (Principal Component Analysis)

```python
    scaler = StandardScaler()
    X_train = scaler.fit_transform(X_train)

    print("reduced_data.shape: ", X_train.shape)

    # PCA - for PCA for Data Visualization
    reduced_data = PCA(n_components=2).fit_transform(X_train)

    print("reduced_data.shape: ", reduced_data.shape)

    plt.figure(figsize=(8, 6))
    
    colors = {0: 'green', 1: 'black'}

    plt.scatter(reduced_data[:, 0], reduced_data[:, 1], c=Y_train_dry_or_wet.apply(lambda x: colors[x]))
    plt.xlabel('principal component 1')
    plt.ylabel('principal component 2')

    plt.show()
```

[Reference1](https://youtu.be/QdBy02ExhGI)

[Reference2](https://www.youtube.com/watch?v=OFyyWcw2cyM)
