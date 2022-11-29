<!--ts-->
* [Python](#python)
   * [Magic methods (dunder methods)](#magic-methods-dunder-methods)
   * [What is the meaning of asterisk in python?](#what-is-the-meaning-of-asterisk-in-python)
      * [Single asterisk usage](#single-asterisk-usage)
         * [Example #1: Single asterisks for unpacking into function call](#example-1-single-asterisks-for-unpacking-into-function-call)
         * [Example #2: Using * multiple times:](#example-2-using--multiple-times)
         * [Example #3: Single astrisks for tuple unpacking](#example-3-single-astrisks-for-tuple-unpacking)
      * [Double Asterisks usage](#double-asterisks-usage)
         * [Example #1: unpacking dictionary](#example-1-unpacking-dictionary)
         * [Example #2: unpacking twice for naming a file](#example-2-unpacking-twice-for-naming-a-file)
   * [S strings in python](#s-strings-in-python)
      * [Approach one - “Old Style” String Formatting (% Operator)](#approach-one---old-style-string-formatting--operator)
      * [f-Strings (Python 3.6+)](#f-strings-python-36)
   * [Type hints](#type-hints)
      * [Type aliases](#type-aliases)
   * [Create gridsearch easily](#create-gridsearch-easily)
   * [try, Except](#try-except)
   * [Dectorators](#dectorators)
      * [Example #1: For Logging a function](#example-1-for-logging-a-function)
      * [Example #2: profiling function with Timer](#example-2-profiling-function-with-timer)
   * [Property decorator](#property-decorator)
   * [Python Generators](#python-generators)
   * [Python Closure](#python-closure)
   * [jsonify with numpy arrays](#jsonify-with-numpy-arrays)
   * [DefaultDict](#defaultdict)
   * [Try, exception](#try-exception)
   * [Get traceback of exception](#get-traceback-of-exception)
   * [raise exception](#raise-exception)
   * [Counting words with a counter](#counting-words-with-a-counter)
   * [Make logger colorful](#make-logger-colorful)
   * [Useful packages](#useful-packages)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Tue 29 Nov 2022 11:59:32 IST -->

<!--te-->


# Python

## Magic methods (dunder methods)

Different names which start and end with the double underscore. They are called as **magic methods**, Built-in classes in Python define many magic methods.

Use the `dir()` function to see the number of magic methods inherited by a class. For example, the following lists all the attributes and methods defined in the int class. 

```python
dir(int)
```


[Reference](https://www.tutorialsteacher.com/python/magic-methods-in-python)

## What is the meaning of asterisk in python?

### Single asterisk usage

#### Example #1: Single asterisks for unpacking into function call

That print('3',\*fruits) line is passing all of the items in the fruits list into the print function call as separate arguments, without even needing to know how many arguments are in the list


```python
fruits = ['lemon', 'pear', 'watermelon', 'tomato']
print('1) ', fruits)

print('2) ', fruits[0], fruits[1], fruits[2], fruits[3])

print('3) ', *fruits) # <- How neat is this!
```
**The output will be:**

```
1)  ['lemon', 'pear', 'watermelon', 'tomato']
2)  lemon pear watermelon tomato
3)  lemon pear watermelon tomato
```

```python

def my_func(*args):
    num_args = len(args)


x = np.
y = x
a = 
b = 
my_func(x,y,a,b)

```

#### Example #2: Using * multiple times:


```python
fruits = ['lemon', 'pear', 'watermelon', 'tomato']
numbers = [2, 1, 3, 4, 7]
print(*numbers, *fruits)
```

```
2 1 3 4 7 lemon pear watermelon tomato
```

#### Example #3: Single astrisks for tuple unpacking

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

### Double Asterisks usage

The ** operator allows us to take a **dictionary of key-value pairs and unpack it** into keyword arguments in a function call.


#### Example #1: unpacking dictionary

```python
date_info = {'year': "2020", 'month': "01", 'day': "01"}
filename = "{year}-{month}-{day}.txt".format(**date_info)
print(filename)
```

**The output will be:**

```
2020-01-01.txt
```

#### Example #2: unpacking twice for naming a file

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

[Five wonderful uses of ‘f- Strings’ in Python](https://towardsdatascience.com/five-wonderful-uses-of-f-strings-in-python-7980cfd31c0d)

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

* **Comment:** The ability to use the [] operator on types like list, dict for type hinting was added in 3.9. therefore use:

`from typing import Dict, List`

[Reference](https://towardsdatascience.com/how-to-write-your-grid-search-function-in-python-43ad0da97522)


## try, Except 


## Dectorators

[Reference](https://www.programiz.com/python-programming/decorator)

Decorators are an advanced feature of the Python language that allow you to modify the behavior of a function or method without touching its code

### Example #1: For Logging a function
```python
def my_logger(orig_func):
    import logging
    logging.basicConfig(filename=f'{orig_func.__name__}.log', level=logging.INFO)

    def wrapper(*args, **kwargs):
        logging.info(f'Ran with args: {args}, and kwargs: {kwargs}')
        return orig_func(*args, **kwargs)

    return wrapper


@my_logger
def display_info(name, age):
    print(f'display_info ran with arguments ({name},{age})')


if __name__ == '__main__':
    display_info('John', 25)
```

### Example #2: profiling function with Timer

```python
def my_timer(orig_func):
    import time

    def wrapper(*args, **kwargs):
        t1 = time.time()
        # We are calling the original function, in our case it's 'display_info(name, age)'
        result = orig_func(*args, **kwargs)
        t2 = time.time() - t1
        print(f'{orig_func.__name__} ran in: {t2} sec')

    return wrapper


@my_timer
def display_info(name, age):
    print(f'display_info ran with arguments ({name},{age})')


if __name__ == '__main__':
    display_info('John', 25)

```

## Property decorator

[Reference](https://www.programiz.com/python-programming/property)

## Python Generators

[Reference](https://www.programiz.com/python-programming/decorator)

## Python Closure

[Reference](https://www.programiz.com/python-programming/closure)

## jsonify with numpy arrays

```python
import json
import numpy as np

class NumpyEncoder(json.JSONEncoder):
    """ Special json encoder for numpy types """
    def default(self, obj):
        if isinstance(obj, np.integer):
            return int(obj)
        elif isinstance(obj, np.floating):
            return float(obj)
        elif isinstance(obj, np.ndarray):
            return obj.tolist()
        return json.JSONEncoder.default(self, obj)

dumped = json.dumps(data, cls=NumpyEncoder)
```

## DefaultDict

Defaultdict is a sub-class of the dictionary class that returns a dictionary-like object. 
The functionality of both dictionaries and defaultdict are almost same except for the fact that defaultdict never raises a KeyError. 

It provides a default value for the key that does not exists.


```python
from collections import defaultdict
  
# Function to return a default values for keys that is not
# present
def def_value():
    return "Not Present"
      
# Defining the dict
d = defaultdict(def_value)
d["a"] = 1
d["b"] = 2
  
print(d["a"])
print(d["b"])
print(d["c"])


# Output:
# 1
# 2
# Not Present
```

## Try, exception

```python
try:
    do_complicated_task(....)
except Exception as e:
    print(e)
    raise e
```

## Get traceback of exception

```python
import traceback

traceback.print_exc()
```

## raise exception
```python
if not(len(paths) == len(colors) == len(names)):
    raise ValueError
```

## Counting words with a counter

```python
from collections  import Counter

tokens = "She likes my cats and my cats like my sofa".split()
counter = Counter(tokens)

print(counter)

# Counter({'my': 3, 'cats': 2, 'She': 1, 'likes': 1, 'and': 1, 'like': 1, 'sofa': 1})

```


## Make logger colorful

```python
# https://alexandra-zaharia.github.io/posts/make-your-own-custom-color-formatter-with-python-logging/

import logging
from colorama import Fore, Style
from datetime import datetime

class CustomFormatter(logging.Formatter):
    """Logging colored formatter, adapted from https://stackoverflow.com/a/56944256/3638629"""

    grey = '\x1b[38;21m'
    blue = Fore.BLUE  # '\x1b[38;5;39m'
    green = Fore.GREEN  # '\x1b[38;5;226m'
    red = Fore.RED  # '\x1b[38;5;196m'
    bold_red = Fore.RED  # '\x1b[31;1m'
    reset = Fore.RESET  # '\x1b[0m'

    def __init__(self, fmt):
        super().__init__()
        self.fmt = fmt
        self.FORMATS = {
            logging.DEBUG: self.grey + self.fmt + self.reset,
            logging.INFO: Fore.GREEN + self.fmt + self.reset,
            logging.WARNING: Fore.BLACK + self.fmt + self.reset, #Fore.GREEN
            logging.ERROR: Fore.RED + Style.BRIGHT + self.fmt + self.reset,
            logging.CRITICAL: self.bold_red + self.fmt + self.reset
        }

    def format(self, record):
        log_fmt = self.FORMATS.get(record.levelno)
        formatter = logging.Formatter(log_fmt)
        return formatter.format(record)


if __name__ == '__main__':
    # Create custom logger logging all five levels
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.DEBUG)

    # Define format for logs
    fmt = '%(asctime)s | %(levelname)8s | %(message)s'

    # Create stdout handler for logging to the console (logs all five levels)
    stdout_handler = logging.StreamHandler()
    stdout_handler.setLevel(logging.DEBUG)
    stdout_handler.setFormatter(CustomFormatter(fmt))

    # Add both handlers to the logger
    logger.addHandler(stdout_handler)

    logger.warning('Watch out!')
    logger.error('Watch out!')
    logger.info('Watch out!')
    logger.critical('Watch out!')
```

## Useful packages

[Generate fake data easily](https://github.com/joke2k/faker)