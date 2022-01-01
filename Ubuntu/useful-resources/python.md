<!--ts-->
   * [Python](#python)
      * [Magic methods (dunder methods)](#magic-methods-dunder-methods)
      * [What is the meaning of asterisk in python?](#what-is-the-meaning-of-asterisk-in-python)
      * [Single asterisks for unpacking into function call](#single-asterisks-for-unpacking-into-function-call)
      * [Single astrisks for tuple unpacking](#single-astrisks-for-tuple-unpacking)
      * [Double Asterisks usage](#double-asterisks-usage)
      * [S strings in python](#s-strings-in-python)
         * [Approach one - “Old Style” String Formatting (% Operator)](#approach-one---old-style-string-formatting--operator)
         * [f-Strings (Python 3.6+)](#f-strings-python-36)
      * [Type hints](#type-hints)
         * [Type aliases](#type-aliases)
      * [Create gridsearch easily](#create-gridsearch-easily)

<!-- Added by: gil_diy, at: Sat 01 Jan 2022 12:28:42 IST -->

<!--te-->


# Python

## Magic methods (dunder methods)

different names which start and end with the double underscore. They are called as magic methods




## What is the meaning of asterisk in python?

## Single asterisks for unpacking into function call

That print('3',\*fruits) line is passing all of the items in the fruits list into the print function call as separate arguments, without us even needing to know how many arguments are in the list


```python
fruits = ['lemon', 'pear', 'watermelon', 'tomato']
print('1) ', fruits)
print('2) ', fruits[0], fruits[1], fruits[2], fruits[3])
print('3) ', *fruits)
```
**The output will be:**

```
1)  ['lemon', 'pear', 'watermelon', 'tomato']
2)  lemon pear watermelon tomato
3)  lemon pear watermelon tomato
```

**Another example**
Using * multiple times can sometimes be handy:

```python
fruits = ['lemon', 'pear', 'watermelon', 'tomato']
numbers = [2, 1, 3, 4, 7]
print(*numbers, *fruits)
```

```
2 1 3 4 7 lemon pear watermelon tomato
```

## Single astrisks for tuple unpacking

```python
fruits = ['lemon', 'pear', 'watermelon', 'tomato']
first, second, *remaining = fruits
print('1) ', remaining)
first, *remaining = fruits
print('2) ', remaining)
```

**The output will be:**

```
1)  ['watermelon', 'tomato']
2)  ['pear', 'watermelon', 'tomato']
```

## Double Asterisks usage

The ** operator does something similar, but with keyword arguments. 

The ** operator allows us to take a dictionary of key-value pairs and unpack it into keyword arguments in a function call.

```python
date_info = {'year': "2020", 'month': "01", 'day': "01"}
filename = "{year}-{month}-{day}.txt".format(**date_info)
print(filename)
```

**The output will be:**

```
2020-01-01.txt
```



**Another example**
Using ** multiple times can sometimes be handy:

```python
date_info = {'year': "2020", 'month': "01", 'day': "01"}
track_info = {'artist': "Beethoven", 'title': 'Symphony No 5'}
filename = "{year}-{month}-{day}-{artist}-{title}.txt".format(
     **date_info,
     **track_info,
)
```

**The output will be:**

```
2020-01-01-Beethoven-Symphony No 5.txt
```


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