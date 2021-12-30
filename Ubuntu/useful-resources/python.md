<!--ts-->
   * [Python](#python)
      * [Magic methods (dunder methods)](#magic-methods-dunder-methods)
      * [S strings in python](#s-strings-in-python)
         * [Approach one - “Old Style” String Formatting (% Operator)](#approach-one---old-style-string-formatting--operator)
         * [Type hints](#type-hints)
         * [f-Strings (Python 3.6+)](#f-strings-python-36)
      * [Create gridsearch easily](#create-gridsearch-easily)

<!-- Added by: gil_diy, at: Thu 30 Dec 2021 13:42:28 IST -->

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

### Type hints

####Type aliases

```python
from ty
```

### f-Strings (Python 3.6+)

```python
f'Hello, {name}!'
```

## Create gridsearch easily

To avoid nested and inflexible for loops, I used the product function that is available from the awesome itertools module.
What that does is building an iterable that returns the cartesian product of all iterables you are passing in

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


[Reference](https://towardsdatascience.com/how-to-write-your-grid-search-function-in-python-43ad0da97522)