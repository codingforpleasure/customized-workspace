<!--ts-->
* [argparse](#argparse)
   * [basic example](#basic-example)
   * [Positional Arguments](#positional-arguments)
   * [Unpositional Arguments](#unpositional-arguments)
   * [Optional arguments](#optional-arguments)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sat 03 Dec 2022 13:50:42 IST -->

<!--te-->


# argparse

## basic example

```python
import argparse  # Create the parser

if __name__ == '__main__':
    parser = argparse.ArgumentParser()  # Add an argument
    parser.add_argument('--name', type=str, required=True)  # Parse the argument
    args = parser.parse_args()  # Print "Hello" + the user input argument
    print('Hello,', args.name)
```

**run: **
```bash
python3 main.py --name gil
```

## Positional Arguments

```pyhton
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('x', type=int, help='The first value to multiply')
    parser.add_argument('y', type=int, help='The second value to multiply')
    args = parser.parse_args()
    product = args.x * args.y
    print('Product:', product)

```

**Run:**

```
python3 example2_positional_arguments.py 4 5
```

## Unpositional Arguments

```python
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--x', type=int, required=True, help='The first value to multiply')
    parser.add_argument('--y', type=int, required=True, help='The second value to multiply')
    args = parser.parse_args()
    product = args.x * args.y
    print('Product:', product)

```

**run: **
```bash
python3 example3_unpositional_arguments.py --x 4 --y 5
```

## Optional arguments

Optional arguments are useful if you want to give the user a choice to enable certain features


```python
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument('--name', type=str, required=True)

    # An optional age. (Notice the required=True is missing from the --age argument.)
    parser.add_argument('--age', type=int)
    
    args = parser.parse_args()
    if args.age:
        print(args.name, 'is', args.age, 'years old.')
    else:
        print('Hello,', args.name + '!')

```

**Run:**
```
```
