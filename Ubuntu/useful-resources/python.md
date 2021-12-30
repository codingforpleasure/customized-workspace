<!--ts-->
   * [Python](#python)
      * [Magic methods (dunder methods)](#magic-methods-dunder-methods)
      * [S strings in python](#s-strings-in-python)
         * [Approach one - “Old Style” String Formatting (% Operator)](#approach-one---old-style-string-formatting--operator)
         * [f-Strings (Python 3.6+)](#f-strings-python-36)
      * [Type hints](#type-hints)
         * [Type aliases](#type-aliases)
      * [Create gridsearch easily](#create-gridsearch-easily)

<!-- Added by: gil_diy, at: Thu 30 Dec 2021 14:10:03 IST -->

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

## Type hints

[Reference](https://docs.python.org/3/library/typing.html)

### Type aliases

A type alias is defined by assigning the type to the alias. In this example, Vector and list[float] will be treated as interchangeable synonyms:

```python
from typing import List

Vector = List[float]

def scale(scalar: float, vector: Vector) -> Vector:
    return [scalar * num for num in vector]

# typechecks; a list of floats qualifies as a Vector.
new_vector = scale(2.0, [1.0, -4.2, 5.4])
```



## Create gridsearch easily

To avoid nested and inflexible for loops, I used the product function that is available from the awesome itertools module.
What that does is building an iterable that returns the cartesian product of all iterables you are passing in

```python
from typing import Iterable, Any, Dict  # List, Tuple, etc...
from itertools import product


def grid_parameters(parameters: Dict[str, Iterable[Any]]) -> Iterable[Dict[str, Any]]:
    for params in product(*parameters.values()):
        yield dict(zip(parameters.keys(), params))


parameters = {"learning_rate": [0.1, 1, 2], "penalty": [1, 2, 3]}

for settings in grid_parameters(parameters):
    print(settings)

```

* **Comment:** The ability to use the [] operator on types like list, dict for type hinting was added in 3.9. therefore use 
`from typing import Dict, List`

[Reference](https://towardsdatascience.com/how-to-write-your-grid-search-function-in-python-43ad0da97522)