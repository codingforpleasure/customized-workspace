<!--ts-->
* [argparse](#argparse)
   * [basic example](#basic-example)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sat 03 Dec 2022 13:48:19 IST -->

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

## 

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

