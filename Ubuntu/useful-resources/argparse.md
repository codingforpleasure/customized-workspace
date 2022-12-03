<!--ts-->
* [argparse](#argparse)
   * [basic example](#basic-example)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sat 03 Dec 2022 13:46:40 IST -->

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

```bash
python3 main.py --name gil
```
