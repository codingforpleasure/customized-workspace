<!--ts-->
   * [Pandas](#pandas)
      * [Pandas data structures](#pandas-data-structures)
         * [Series](#series)
         * [Dataframe](#dataframe)
            * [Converting from numpy to panda](#converting-from-numpy-to-panda)
         * [Accesing an element in pandas:](#accesing-an-element-in-pandas)
         * [Methods of slicing in pandas](#methods-of-slicing-in-pandas)
      * [Importing data from CSV](#importing-data-from-csv)
      * [Get information of the data types for a dataframe](#get-information-of-the-data-types-for-a-dataframe)
      * [Get statistics (count, mean, std, min, max))](#get-statistics-count-mean-std-min-max)
      * [Datatypes conversions](#datatypes-conversions)
      * [Retrieve NaN values](#retrieve-nan-values)
      * [Get the index of the min or the max element](#get-the-index-of-the-min-or-the-max-element)
      * [Get the nsmallest or nlargest element](#get-the-nsmallest-or-nlargest-element)
      * [Group by:](#group-by)
      * [Concat Dataframes](#concat-dataframes)
         * [Join two dataframes one <strong>below</strong> the other.](#join-two-dataframes-one-below-the-other)
         * [Join two dataframes one <strong>besides</strong> the other.](#join-two-dataframes-one-besides-the-other)
         * [Printing data so all columns will be presented](#printing-data-so-all-columns-will-be-presented)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: 2019-11-26T16:08+02:00 -->

<!--te-->



# Pandas
pandas adopts significant parts of NumPy’s idiomatic style of array-based computing, especially array-based functions and a preference for data processing without for loops.

While pandas adopts many coding idioms from NumPy, the biggest difference is that
pandas is designed for working with tabular or heterogeneous data. NumPy, by con‐
trast, is best suited for working with homogeneous numerical array data.

```python
import pandas as pd
```

## Pandas data structures

### Series

A series is one-dimensional array like object conject containing a sequense of values.

```python
obj = pd.Series([4, 7, -5, 3])
```

you can use labels in the index when selecting single
values or a set of values:
```python
obj2 = pd.Series([4, 7, -5, 3], index=['d', 'b', 'a', 'c'])
my_matrix = pd.Series()
```



### Dataframe

```python
data = {'state': ['Ohio', 'Ohio', 'Ohio', 'Nevada', 'Nevada', 'Nevada'],
	'year': [2000, 2001, 2002, 2001, 2002, 2003],
	'pop': [1.5, 1.7, 3.6, 2.4, 2.9, 3.2]}

frame = pd.DataFrame(data)
```

Anothe example:

```python
my_df = pd.Dataframe(data = [[0,0,0],[1,2,3],[4,5,6],[7,8,9]]),
                     index = range(0,4),
                     columns=['col1','col2','col3'])

print("\n",my_df)
```


```python
df = pd.Dataframe(np.array([1,2,3],[4,5,6]))
print("\nThe shape of our dataframe is:",df.shape) # The shape of the dataframe is (2,3)
```

#### Converting from numpy to panda
```python
my_2darray = np.array([[1, 2, 3], [4, 5, 6]])
print(pd.dataframe(my_2darray,columns=['a','b','c']))
```

### Accesing an element in pandas:
```python
print(my_df.iloc[row_num, col_num] )
```

### Methods of slicing in pandas

* `loc` get rows/columns with praticular **labels** (label-based indexing).

* `iloc` get rows/columns at praticular **index** (it only takes integers).

* `get_loc()` is and index method meaning "get the position of the label in this index"

```python
df.iloc[:df.index.get_loc('row_bla') + 1, :4]
```

## Importing data from CSV

```python
movies_df = pd.read_csv('data/movies/csv')
movies_df.head()
```

## Get information of the data types for a dataframe

```python
movies_df.info()
```

## Get statistics (count, mean, std, min, max))

```python
df[''].describe()
```

## Datatypes conversions

```python
movies_df['average rating'] = movies_df['average rating'].astype('float')
movies_df['Date'] = pd.to_datetime(movies_df['Date'])
movies_df['Star Ratings'] = movies_df['Star Ratings'].astype('int')
```

## Retrieve NaN values
```python
<columnname>.notnull()
```

## Get the index of the min or the max element

```python
data_example = pd.Series([
		1,3,2,8,124,4,2,1
])

print('The index of the minimum value is: ', data_example.idxmin())
print('The index of the maximum value is: ', data_example.idxmax())
```

## Get the nsmallest or nlargest element

```python
df = pd.Dataframe({
	'Name': ['Bob', 'Mark', 'Steph', 'Jess', 'Becky'],
	'Points': [55, 98, 46, 77, 81]
})

print('The fourth element in size is:', str(df.mslargest(4,'Points')))
print('The 2nd smallest element  is:', str(df.msmallest(2,'Points')))
```

## Group by:
```python
# This will create a data frame object consists of
# few tables each table is seperated for each city (we have splitted the data into smaller groups).
my_groups = df.groupby('city')

# Running iteratively and retrieving the table for the corresponding group.
for city,city_df in my_groups:
	print(city)
	print(city_df)

# Get the dataframe of group city 'new york'
my_groups.get_group('new york')


# Apply the function max on each group:
my_groups.max()


# Get all the analytics in one shot (count, mean, std, min, max):
my_groups.describe()
```

[Reference](http://tiny.cc/h6hdaz)

<!-- ### Group by year in date column

```python
df.groupby(df['Date'].dt.year)
``` -->

## Concat Dataframes

### Join two dataframes one **below** the other.

```python
import pandas as pd

israel_weather = pd.Dataframe({
   'city':['Ramat-Gan', 'Tel-Aviv', 'Haifa'],
   'tempature':['35','33','40'],
   'humidity':[60,65,75]
   })

us_weather = pd.Dataframe({
   'city':['New york', 'Boston', 'Los Angeles'],
   'tempature':['25','29','30'],
   'humidity':[40,25,55]
   })

df1 = pd.concat([israel_weather, us_weather], ignore_index = True)

# create a sub-table
df2 = pd.concat([israel_weather, us_weather], keys = ['Israel','US'])

# Retrieve the Israel dataframe:
df2.loc['Israel']
```
### Join two dataframes one **besides** the other.

```python
import pandas as pd

tempature_df = pd.Dataframe({
   'city':['New york', 'Boston', 'Los Angeles'],
   'humidity':[60,65,75]
   })

windspeed_df = pd.Dataframe({
   'city':['New york', 'Boston', 'Los Angeles'],
   'widspeed':[7,12,9]
   })

# Axis =1 means concating dataframe beside one the other dataframe
df1 = pd.concat([israel_weather, us_weather], axis = 1)

# Retrieve the Israel dataframe:
df2.loc['Israel']
```

[Reference](https://www.youtube.com/watch?v=WGOEFok1szA&list=PLeo1K3hjS3uuASpe-1LjfG5f14Bnozjwy&index=8)

### Printing data so all columns will be presented
```python
pd.set_option('display.max_rows', 500)
pd.set_option('display.max_columns', 500)
pd.set_option('display.width', 1000)
```

## Reference

[Pandas Cheat Sheet #1](https://www.datacamp.com/community/blog/python-pandas-cheat-sheet#gs.S4P4T=U)

[Pandas Cheat Sheet #2](http://datasciencefree.com/pandas.pdf)
