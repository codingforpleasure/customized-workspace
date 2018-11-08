<!--ts-->
<!--te-->

Seeee:
https://www.youtube.com/playlist?list=PLeo1K3hjS3uuASpe-1LjfG5f14Bnozjwy

#Pandas
pandas adopts significant parts of NumPy’s idiomatic style of array-based computing, especially array-based functions and a preference for data processing without for loops.

While pandas adopts many coding idioms from NumPy, the biggest difference is that
pandas is designed for working with tabular or heterogeneous data. NumPy, by con‐
trast, is best suited for working with homogeneous numerical array data.

```python
import pandas as pd
```

##Pandas data structures

### Series
```python
obj = pd.Series([4, 7, -5, 3])
```

you can use labels in the index when selecting single
values or a set of values:
```python
obj2 = pd.Series([4, 7, -5, 3], index=['d', 'b', 'a', 'c'])
```

### Dataframe

```python
data = {'state': ['Ohio', 'Ohio', 'Ohio', 'Nevada', 'Nevada', 'Nevada'],
	'year': [2000, 2001, 2002, 2001, 2002, 2003],
	'pop': [1.5, 1.7, 3.6, 2.4, 2.9, 3.2]}

frame = pd.DataFrame(data)
```
