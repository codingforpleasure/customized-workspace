<!--ts-->
   * [What is the meaning of asterisk in python?](#what-is-the-meaning-of-asterisk-in-python)
      * [Single asterisks for unpacking into function call](#single-asterisks-for-unpacking-into-function-call)
      * [Single astrisks for tuple unpacking](#single-astrisks-for-tuple-unpacking)
      * [Double Asterisks usage](#double-asterisks-usage)
      * [Magic methods (dunder methods)](#magic-methods-dunder-methods)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: Fri 04 Mar 2022 15:05:44 IST -->

<!--te-->

# What is the meaning of asterisk in python?

## Single asterisks for unpacking into function call

That print('3',*fruits) line is passing all of the items in the fruits list into the print function call as separate arguments, without us even needing to know how many arguments are in the list



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

## 

## Magic methods (dunder methods)

different names which start and end with the double underscore. They are called as magic methods




## Reference
[Link](https://treyhunner.com/2018/10/asterisks-in-python-what-they-are-and-how-to-use-them/)