<!--ts-->
   * [Imbalanced-learn samplers](#imbalanced-learn-samplers)
      * [Install package](#install-package)
      * [Under-Sampling](#under-sampling)
      * [Over-Sampling](#over-sampling)

<!-- Added by: gil_diy, at: Sun 20 Feb 2022 18:40:53 IST -->

<!--te-->


# Imbalanced-learn samplers

## Install package

```bash
pip install -U imbalanced-learn
```
[Github Repo](https://github.com/scikit-learn-contrib/imbalanced-learn)

[Documentation](https://imbalanced-learn.org/stable/index.html)

## Under-Sampling

```python
from collections import Counter
from imblearn.under_sampling import NearMiss
ns=NearMiss(0.8)
X_train_ns,y_train_ns=ns.fit_sample(X_train,y_train)
print("The number of classes before fit {}".format(Counter(y_train)))
print("The number of classes after fit {}".format(Counter(y_train_ns)))

# The number of classes before fit Counter({0: 199017, 1: 347})
# The number of classes after fit Counter({0: 433, 1: 347})
```

## Over-Sampling

```python
from imblearn.over_sampling import RandomOverSampler

os=RandomOverSampler(0.75)
X_train_ns,y_train_ns=os.fit_sample(X_train,y_train)
print("The number of classes before fit {}".format(Counter(y_train)))
print("The number of classes after fit {}".format(Counter(y_train_ns)))
```