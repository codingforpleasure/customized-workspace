<!--ts-->
   * [Python](#python)
      * [Magic methods (dunder methods)](#magic-methods-dunder-methods)
      * [S strings in python](#s-strings-in-python)
         * [Approach one - “Old Style” String Formatting (% Operator)](#approach-one---old-style-string-formatting--operator)
         * [f-Strings (Python 3.6+)](#f-strings-python-36)
      * [Create gridsearch easily](#create-gridsearch-easily)

<!-- Added by: gil_diy, at: Thu 30 Dec 2021 09:52:55 IST -->

<!--te-->


# Python

## Magic methods (dunder methods)

different names which start and end with the double underscore. They are called as magic methods



## S strings in python

[Link](https://realpython.com/python-string-formatting/)

### Approach one - “Old Style” String Formatting (% Operator)

```python
'Hello, %s' % name
```

### f-Strings (Python 3.6+)

```python
f'Hello, {name}!'
```

## Create gridsearch easily

```python
from itertools import product


def grid_parameters(my_parameters):
    for params in product(*my_parameters.values()):
        yield dict(zip(my_parameters.keys(), params))

if __name__ == '__main__':
	parameters = {"learning_rate": [0.1, 1, 2],
              "penalty": [1, 2, 3]}

    for settings in grid_parameters(parameters):
        print()
```