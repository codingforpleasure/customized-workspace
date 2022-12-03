<!--ts-->
* [argparse](#argparse)
   * [basic example](#basic-example)
   * [Positional Arguments](#positional-arguments)
   * [Unpositional Arguments](#unpositional-arguments)
   * [Optional arguments](#optional-arguments)
   * [Multiple arguments](#multiple-arguments)
   * [No limit on the number of arguments](#no-limit-on-the-number-of-arguments)
   * [Mutual exclusive arguments](#mutual-exclusive-arguments)
   * [Writing subparser](#writing-subparser)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sat 03 Dec 2022 13:56:46 IST -->

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

Sometimes, you don’t want to use the flag’s name in the argument. You can use a positional argument to eliminate the need to specify the --name flag before inputting the actual value.


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

```bash
python3 example2_positional_arguments.py 4 5
```

## Unpositional Arguments (Prefered way)

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

```bash
python3 example4_optional_arguments.py --name Gil
```
or

```bash
python3 example4_optional_arguments.py --name Gil --age 30
```

## Multiple arguments

```python
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--values', type=int, nargs=3)
    args = parser.parse_args()
    sum = sum(args.values)
    print('Sum:', sum)

```

**Run:**
```bash
python3 example5_multiple_arguments.py --values 100 200 300
```

## No limit on the number of arguments

What if you don’t want just 3 values, but any number of inputs?

```python
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    # You can set nargs='+', which will allow the argument to take in any number of values.
    parser.add_argument('--values', type=int, nargs='+')
    args = parser.parse_args()
    sum = sum(args.values)
    print('Sum:', sum)

```

**Run:**

```bash
python3 example6_no_limit_on_multiple_arguments.py --values 100 200
```

```bash
python3 example6_no_limit_on_multiple_arguments.py --values 100 200 300 400 500
```

## Mutual exclusive arguments

```python
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    # By creating a group with group = parser.add_mutually_exclusive_group(),
    # the user is only allowed to select one of the arguments to use.
    group = parser.add_mutually_exclusive_group()
    # In the add_argument() method,
    # there is a new parameter called action. This is simply storing the default method if the argument is blank.
    group.add_argument('--add', action='store_true')
    group.add_argument('--subtract', action='store_true')
    parser.add_argument('x', type=int)
    parser.add_argument('y', type=int)
    args = parser.parse_args()

    if args.add:
        sum = args.x + args.y
        print('Sum:', sum)
    elif args.subtract:
        difference = args.x - args.y
        print('Difference:', difference)
```

**Run:**

```bash
python3 example7_mutually_exclusive_arguments.py --add 5 7
```

## Writing subparser

Subparsers are powerful in that they allow for different arguments to be permitted based on the command being run.
For example, when using the git command, some options are git checkout, git commit, and git add.
Each one of these commands requires a unique set of arguments, and subparsers allow you to distinguish between them.

```python
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    subparser = parser.add_subparsers(dest='command')
    login = subparser.add_parser('login')
    register = subparser.add_parser('register')
    login.add_argument('--username', type=str, required=True)
    login.add_argument('--password', type=str, required=True)
    register.add_argument('--firstname', type=str, required=True)
    register.add_argument('--lastname', type=str, required=True)
    register.add_argument('--username', type=str, required=True)
    register.add_argument('--email', type=str, required=True)
    register.add_argument('--password', type=str, required=True)
    args = parser.parse_args()

    if args.command == 'login':
        print('Logging in with username:', args.username, ' and password:', args.password)
    elif args.command == 'register':
        print(
            f'Creating username: {args.username}\nnew member: {args.firstname} {args.lastname}\nemail:{args.email}\npassword: {args.password}')
```

**Run:**

```bash
python3 example8_subparser.py login --username gil --password 5751824
```

or 

```bash
python3 example8_subparser.py register --firstname gil --lastname cohen --username Nemo --email gil@gmail.com --password  5751824
```