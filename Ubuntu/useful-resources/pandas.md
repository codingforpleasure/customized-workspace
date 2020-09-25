
<!-- #Pandas Cheat sheet for Shay (clean examples) -->
<!--ts-->
   * [Pandas](#pandas)
      * [Pandas data structures](#pandas-data-structures)
         * [Series](#series)
         * [Dataframe](#dataframe)
            * [Creating a dataframe](#creating-a-dataframe)
            * [Get dimensions of a dataframe](#get-dimensions-of-a-dataframe)
            * [Get dataframe except specific rows](#get-dataframe-except-specific-rows)
            * [Get row names](#get-row-names)
            * [Get column names](#get-column-names)
            * [rename column names](#rename-column-names)
            * [Get numeric columns in pandas](#get-numeric-columns-in-pandas)
            * [Get categorical columns in pandas](#get-categorical-columns-in-pandas)
            * [Get column index for a given specific name](#get-column-index-for-a-given-specific-name)
            * [Dropping columns in pandas](#dropping-columns-in-pandas)
            * [Concatentaing columns and rows](#concatentaing-columns-and-rows)
            * [Converting from numpy to panda](#converting-from-numpy-to-panda)
            * [Converting categorical columns to numbers (4 Methods)](#converting-categorical-columns-to-numbers-4-methods)
            * [Accessing an element in pandas:](#accessing-an-element-in-pandas)
            * [Methods of slicing in pandas](#methods-of-slicing-in-pandas)
            * [Filtering data within a dataframe](#filtering-data-within-a-dataframe)
               * [Method #1 (Similar to R language)](#method-1-similar-to-r-language)
               * [Method #2 (Similar to Filter function in R language)](#method-2-similar-to-filter-function-in-r-language)
               * [Method #3 (less clean way)](#method-3-less-clean-way)
      * [CSV](#csv)
         * [Importing data from CSV file](#importing-data-from-csv-file)
         * [Importing only first 1000 rows from a HUGE CSV file](#importing-only-first-1000-rows-from-a-huge-csv-file)
         * [Importing only selected columns from a HUGE CSV file](#importing-only-selected-columns-from-a-huge-csv-file)
         * [Importing data from CSV with NA's](#importing-data-from-csv-with-nas)
         * [Exporting data into CSV](#exporting-data-into-csv)
      * [json](#json)
         * [Importing data from json](#importing-data-from-json)
         * [Importing data from json](#importing-data-from-json-1)
      * [Displaying data cleaner](#displaying-data-cleaner)
      * [Get information of the data types for a given dataframe](#get-information-of-the-data-types-for-a-given-dataframe)
      * [Get information about the memory usage of a dataframe stored in the memory](#get-information-about-the-memory-usage-of-a-dataframe-stored-in-the-memory)
      * [Get statistics (count, mean, std, min, max))](#get-statistics-count-mean-std-min-max)
      * [Get counts for spcific column (Exactly like table function in R)](#get-counts-for-spcific-column-exactly-like-table-function-in-r)
      * [Datatypes conversions](#datatypes-conversions)
      * [Dealing with NA's](#dealing-with-nas)
         * [Check the column-wise distribution of null values](#check-the-column-wise-distribution-of-null-values)
         * [Remove rows with NA's](#remove-rows-with-nas)
         * [Replace NA's with the median](#replace-nas-with-the-median)
         * [Replace string with other thing in a column](#replace-string-with-other-thing-in-a-column)
         * [Replace string with other thing in a dataframe](#replace-string-with-other-thing-in-a-dataframe)
         * [Retrieve NaN values](#retrieve-nan-values)
      * [fill](#fill)
      * [Get the index of the min or the max element](#get-the-index-of-the-min-or-the-max-element)
      * [Get the nsmallest or nlargest element](#get-the-nsmallest-or-nlargest-element)
      * [Group by:](#group-by)
         * [Group by time slot](#group-by-time-slot)
      * [Concat Dataframes](#concat-dataframes)
         * [Join two dataframes one <strong>below</strong> the other.](#join-two-dataframes-one-below-the-other)
         * [Join two dataframes one <strong>besides</strong> the other.](#join-two-dataframes-one-besides-the-other)
         * [Printing data so all columns will be presented](#printing-data-so-all-columns-will-be-presented)
         * [Drop the rows where at least one element is missing.](#drop-the-rows-where-at-least-one-element-is-missing)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: 2020-09-25T14:42+03:00 -->

<!--te-->






# Pandas
pandas adopts significant parts of NumPy’s idiomatic style of array-based computing, especially array-based functions and a preference for data processing without for loops.

While pandas adopts many coding idioms from NumPy, the biggest difference is that
pandas is designed for working with tabular or heterogeneous data. NumPy, by contrast, is best suited for working with homogeneous numerical array data.

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

#### Creating a dataframe

```python

# Converting a a simple dictionary to a dataframe

my_data_states = {'state': ['Ohio', 'Ohio', 'Ohio', 'Nevada', 'Nevada', 'Nevada'],
	'year': [2000, 2001, 2002, 2001, 2002, 2003],
	'pop': [1.5, 1.7, 3.6, 2.4, 2.9, 3.2]}

my_df1 = pd.DataFrame(my_data_states)
```

Another example:

```python
my_df2 = pd.DataFrame(data = [[0,0,0],[1,2,3],[4,5,6],[7,8,9]],
                     index = range(0,4),
                     columns=['col1','col2','col3'])

print("\n",my_df2)
```

Another example:

Creating a dataframe of specific size and initializing it with -1's:

```python
my_df3 = pd.DataFrame(index=range(5), columns=range(3))
my_df3 = my_df3.fillna(-1)
```

#### Get dimensions of a dataframe

```python
df = pd.Dataframe(np.array([1,2,3],[4,5,6]))
print("\nThe shape of our dataframe is:",df.shape) # The shape of the dataframe is (2,3)
```

#### Get dataframe except specific rows

I'd like to get all rows **excepts rows 3 and 5**:
```python
not_relevant_rows = my_df1.index.isin([3,5])
df_relevant = my_df1[~not_relevant_rows]
```

#### Get row names
```python
print(my_df.index.values)
```

#### Get column names

```python
 print("The numeric columns are:")
 df_numeric = df.select_dtypes(include='number')
 print(df_numeric.columns.values)
```

#### rename column names

```python
 df.columns = ['new-name1', 'new-name1']
```

#### Get numeric columns in pandas
```python
df.select_dtypes(include='number')
```

#### Get categorical columns in pandas
```python
df.select_dtypes(include='category')
```

#### Get column index for a given specific name

```python
   df.columns.get_loc('my_column')
```

#### Dropping columns in pandas

```python
df.drop('column_name',1,inplace=True)
```

#### Concatentaing columns and rows

concatentaing columns:
```python
# Axis 1 means columns
result = pd.concat([df['person_name'], df['person_weight']], axis = 1)
```

a different approach for adding a column will be:

```python
df['my_new_column'] = pd.Series(list_of_values)
```

Retriving specific columns:
```python
df1 = df[['column1','column2']]
```

concatentaing rows:
```python
# Here i'm concatentaing two first rows with two last rows.
result = pd.concat([df[0:2], df[-2:]], axis = 0)
```


```python
# Adding a row to my_df:
my_df.loc["two"] = [4,5,6]
```

#### Converting from numpy to panda
```python
my_2darray = np.array([[1, 2, 3], [4, 5, 6]])
print(pd.dataframe(my_2darray,columns=['a','b','c']))
```

#### Converting categorical columns to numbers (4 Methods)
**Worked well for me!**

Great reference:

[Link](https://www.datacamp.com/community/tutorials/categorical-data)


#### Accessing an element in pandas:
```python
print(my_df.iloc[row_num, col_num] )
```

#### Methods of slicing in pandas

* `loc` get rows/columns with praticular **labels** (label-based indexing).

* `iloc` get rows/columns at praticular **index** (it only takes integers).

* `get_loc()` is and index method meaning "get the position of the label in this index"

```python
df.iloc[:df.index.get_loc('row_bla') + 1, :4]
```


#### Filtering data within a dataframe

##### Method #1 (Similar to R language)

```python
newdf = df[(df.column_name_1 == "JFK") & (df.colunm_name_2 == "B6")]
```

##### Method #2 (Similar to Filter function in R language)

```python
newdf = df.query('column_name_1 == "JFK" & colunm_name_2 == "B6"')
```

##### Method #3 (less clean way)

```python
newdf = df.loc[(df.column_name_1 == "JFK") & (df.colunm_name_2 == "B6")]
```

## CSV

### Importing data from CSV file

```python
movies_df = pd.read_csv('data/movies.csv')
movies_df.head()
```

### Importing only first 1000 rows from a HUGE CSV file

```python
relevant_df = pd.read_csv('data/large_dataset.csv', nrows = 1000)
```

### Importing only selected columns from a HUGE CSV file

```python
chosen_columns = ['id', 'occupation']
df = pd.read_csv('data/large_dataset.csv',usecolumns = chosen_columns)
```

### Importing data from CSV with NA's
```python
rawfile = pd.read_csv(filename, header=None, names=DataLabels, sep=',\s', na_values=["?"])
```

### Exporting data into CSV

```python
movies_df.to_csv('./my_folder/movies.csv', index = False)
```

## json

### Importing data from json

### Importing data from json

## Displaying data cleaner

```python
display(df[0:5])
```

## Get information of the data types for a given dataframe

```python
movies_df.info()
```

Writes how many variables of each type in dataframe, 

**dtypes: Int64(1), float32(4), float64(7), int64(12)**

Which means my data holds:

**1 column of type Int64**

**4 columns of type Float32**

**7 columns of type Float64**

**12 columns of type Int64**


## Get information about the memory usage of a dataframe stored in the memory

```python
df1.info(memory_usage = 'deep')
```

Or you can use this:

```python
df1.memory_usage(deep = True) * 1e-3
```
** Comment: ** memory usage in KB


## Get statistics (count, mean, std, min, max))

```python
df[''].describe()
```

## Get counts for spcific column (Exactly like table function in R)
```python
data_df['my_column'].value_counts()
```

## Datatypes conversions

```python
movies_df['average rating'] = movies_df['average rating'].astype('float')
movies_df['Date'] = pd.to_datetime(movies_df['Date'])
movies_df['Star Ratings'] = movies_df['Star Ratings'].astype('int')
```

## Dealing with NA's

### Check the column-wise distribution of null values

```python
print(df.isnull().sum())
```

### Remove rows with NA's
```python
my_df = my_df.dropna()
```

### Replace NA's with the median 
```python
the_median = df['horse_power'].median()
my_df['horse_power'] = my_df['horse_power'].fillna(med)
```

### Replace string with other thing in a column
```Python
df['workclass'].replace('?', np.NaN)
```

### Replace string with other thing in a dataframe

```Python
df.replace('?', np.NaN)
```

### 


### Retrieve NaN values
```python
<columnname>.notnull()
```


## fill

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

### Group by time slot

[Link](https://stackoverflow.com/questions/11073609/how-to-group-dataframe-by-a-period-of-time)


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


### Drop the rows where at least one element is missing.

```python
df.dropna()
```


## Reference

[Pandas Cheat Sheet #1](https://www.datacamp.com/community/blog/python-pandas-cheat-sheet#gs.S4P4T=U)

[Pandas Cheat Sheet #2](http://datasciencefree.com/pandas.pdf)
