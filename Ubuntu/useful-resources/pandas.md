
<!-- #Pandas Cheat sheet for Shay (clean examples) -->
<!--ts-->
   * [Pandas](#pandas)
      * [Pandas data structures](#pandas-data-structures)
         * [Series](#series)
         * [DataFrame](#dataframe)
            * [Creating a dataframe](#creating-a-dataframe)
            * [Creating dataframe (another approach)](#creating-dataframe-another-approach)
            * [Creating a dataframe and adding row on each iteration](#creating-a-dataframe-and-adding-row-on-each-iteration)
            * [Get dimensions of a dataframe](#get-dimensions-of-a-dataframe)
            * [Iterate over rows](#iterate-over-rows)
            * [Rename indexes (rename row names)](#rename-indexes-rename-row-names)
            * [Rename indexes to default range index](#rename-indexes-to-default-range-index)
            * [Get dataframe except specific rows](#get-dataframe-except-specific-rows)
            * [Get dataframe except specific column](#get-dataframe-except-specific-column)
            * [Get row names](#get-row-names)
            * [Get column names](#get-column-names)
            * [rename column names](#rename-column-names)
            * [rename either columns/rows names](#rename-either-columnsrows-names)
            * [Get numeric columns in pandas](#get-numeric-columns-in-pandas)
            * [Get categorical columns in pandas](#get-categorical-columns-in-pandas)
            * [Get column index for a given specific name](#get-column-index-for-a-given-specific-name)
            * [Dropping columns in pandas](#dropping-columns-in-pandas)
            * [Concatentaing columns and rows](#concatentaing-columns-and-rows)
            * [Converting from numpy table to pandas dataframe](#converting-from-numpy-table-to-pandas-dataframe)
            * [Converting from pandas dataframe to numpy table](#converting-from-pandas-dataframe-to-numpy-table)
            * [Converting categorical columns to numbers (4 Methods)](#converting-categorical-columns-to-numbers-4-methods)
            * [Accessing an element in pandas](#accessing-an-element-in-pandas)
            * [Accessing a column in pandas](#accessing-a-column-in-pandas)
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
         * [Importing data from CSV with date](#importing-data-from-csv-with-date)
         * [Setting a specific column as an index](#setting-a-specific-column-as-an-index)
         * [Exporting data into CSV](#exporting-data-into-csv)
      * [Excel File](#excel-file)
      * [JSON File](#json-file)
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
         * [Check for NA's in dataframe](#check-for-nas-in-dataframe)
         * [Replace NA's with the median](#replace-nas-with-the-median)
         * [Replace string with other thing in a column](#replace-string-with-other-thing-in-a-column)
         * [Replace string with other thing in a dataframe](#replace-string-with-other-thing-in-a-dataframe)
         * [Retrieve NaN values](#retrieve-nan-values)
      * [fill](#fill)
      * [Get the index of the min or the max element](#get-the-index-of-the-min-or-the-max-element)
      * [Get the nsmallest or nlargest element](#get-the-nsmallest-or-nlargest-element)
      * [Group by:](#group-by)
         * [Group with aggregate](#group-with-aggregate)
         * [Segment and sort data values into bins](#segment-and-sort-data-values-into-bins)
         * [Group by time slot](#group-by-time-slot)
      * [Concat Dataframes](#concat-dataframes)
         * [Join two dataframes one <strong>below</strong> the other.](#join-two-dataframes-one-below-the-other)
         * [Join two dataframes one <strong>besides</strong> the other.](#join-two-dataframes-one-besides-the-other)
         * [Dataframe Pivot table](#dataframe-pivot-table)
         * [Printing data so all columns will be presented](#printing-data-so-all-columns-will-be-presented)
         * [Get data ditribution of the data per column](#get-data-ditribution-of-the-data-per-column)
      * [Convert each consecutive pair of columns into a tuple in a single column](#convert-each-consecutive-pair-of-columns-into-a-tuple-in-a-single-column)
      * [Mapping/Applying categorical values to a specified numerical values](#mappingapplying-categorical-values-to-a-specified-numerical-values)
      * [One hot encoding](#one-hot-encoding)
      * [Mathematical functions](#mathematical-functions)
         * [Calculate correlation for all numerical columns pairs](#calculate-correlation-for-all-numerical-columns-pairs)
      * [Time-Series](#time-series)
         * [Converting to Time-Stamp](#converting-to-time-stamp)
         * [Slicing date-time type](#slicing-date-time-type)
         * [Rolling Window Statistics](#rolling-window-statistics)
         * [Expanding Window Statistics](#expanding-window-statistics)
         * [Statsmodels](#statsmodels)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: Fri 07 Jan 2022 22:56:43 IST -->

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



### DataFrame

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

#### Creating dataframe (another approach)

```python
import pandas as pd
df = pd.DataFrame([['a','b','c'],['gr','lt','eq']],
                  columns=["col1", "col2", "col3"])

df.to_csv('list.csv', index=False)
```

#### Creating a dataframe and adding row on each iteration

```python

df = pd.DataFrame(columns=["a", "b", "c"])

 for i in range(5):
     df.loc[len(df)] = ['name5', 9, 0]
```

#### Get dimensions of a dataframe

```python
df = pd.DataFrame(np.array([1,2,3],[4,5,6]))
print("\nThe shape of our dataframe is:",df.shape) # The shape of the dataframe is (2,3)
```

#### Iterate over rows

```python
# list of dicts 
input_df = [{'name':'Sujeet', 'age':10}, 
            {'name':'Sameer', 'age':11}, 
            {'name':'Sumit', 'age':12}] 
  
df = pd.DataFrame(input_df) 
print('Original DataFrame: \n', df) 
  
  
print('\nRows iterated using iterrows() : ') 
for index, row in df.iterrows(): 
    print(row['name'], row['age']) 
```

#### Rename indexes (rename row names)

```python
my_df.set_index("third-column", inplace=True)
```

#### Rename indexes to default range index

```python
my_df.reset_index(inplace=True)
```


#### Get dataframe except specific rows

I'd like to get all rows **excepts rows 3 and 5**:
```python
not_relevant_rows = my_df1.index.isin([3,5])
df_relevant = my_df1[~not_relevant_rows]
```

#### Get dataframe except specific column


```python
X = df.iloc[:, df.columns.drop('target-column')].values
```

#### Get row names
```python
print(my_df.index.values) # equivallent to  print(list(my_df.index))
```

#### Get column names

```python
print(data_df.columns.values)
```

#### rename column names

```python
 df.columns = ['new-name1', 'new-name1']
```
#### rename either columns/rows names 

```python
df_new = df.rename(columns={'A': 'a'}, index={'ONE': 'one'}, inplace=True)
```

* index - stands for rows names

[Great reference](https://note.nkmk.me/en/python-pandas-dataframe-rename/)


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

#### Converting from numpy table to pandas dataframe
```python
my_2darray = np.array([[1, 2, 3], [4, 5, 6]])
print(pd.dataframe(my_2darray,columns=['a','b','c']))
```

#### Converting from pandas dataframe to numpy table

When we use the `.values` we get the actual numpy matrix

```python
x = df.loc[:, features].values
```

#### Converting categorical columns to numbers (4 Methods)
**Worked well for me!**

Great reference:

[Link](https://www.datacamp.com/community/tutorials/categorical-data)


#### Accessing an element in pandas
```python
print(my_df.iloc[row_num, col_num] )
```

#### Accessing a column in pandas

```python
print(my_df.my_column_name)
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

### Importing data from CSV with date
```python
# fifa_data = pd.read_csv(fifa_filepath, index_col="Date", parse_dates=True)
rawfile = pd.read_csv(filename, header=None, names=DataLabels, parse_dates=True)
```

### Setting a specific column as an index
Labeling the rows while importing data

```python
spotify_data = pd.read_csv(spotify_filepath, index_col="Date", parse_dates=True)
```


### Exporting data into CSV
```python
movies_df.to_csv('./my_folder/movies.csv', index = False)
```

## Excel File
```python
movies_df = pd.read_excel('data/movies.xlsx')
```

## JSON File

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
df['column_name'].describe()

# or for all numerical columns

df.describe()

```

**For getting all stats write:**

```python
df.describe(include='all')
```

* count
* unique
* top (most frequent)
* freq
* mean
* std
* min
* 25%
* 50%
* 75%
* max


## Get counts for spcific column (Exactly like table function in R)
```python
data_df['my_column'].value_counts()


# See the counts broken down by precentage ( In R it's prop.table )
data_df['my_column'].value_counts(normalize=True)

# Get the top 5 values
data_df['my_column'].value_counts(ascending=False).nlargest(5)


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
### Check for NA's in dataframe

```python
np.any(np.isnan(df))
```

```python
np.all(np.isfinite(df))
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
df = pd.DataFrame({
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

### Group with aggregate

```python

```
[Link](https://www.youtube.com/watch?v=txMdrV1Ut64)

### Segment and sort data values into bins


```python
data_to_split = [1,16,5,9,32,42]
pd.cut(x = data_to_split , bins = np.arange(0, 46, 5))
```
**The output is:**

`
[(0, 5], (15, 20], (0, 5], (5, 10], (30, 35], (40, 45]]
Categories (9, interval[int64, right]): [(0, 5] < (5, 10] < (10, 15] < (15, 20] ... (25, 30] <
                                         (30, 35] < (35, 40] < (40, 45]]
`


### Group by time slot

[Link](https://stackoverflow.com/questions/11073609/how-to-group-dataframe-by-a-period-of-time)

[Link](https://coderedirect.com/questions/115764/pandas-groupby-range-of-values)


```python
df.groupby(pd.cut(df["B"], np.arange(0, 1.0+0.155, 0.155))).sum()
```




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

### Dataframe Pivot table 

```python

    my_df1 = pd.DataFrame(data=[['omer', 45645, 0], ['Liron', 92314, 3], ['Yuval', 19863, 6], ['Shani', 73198, 9]],
                          index=range(0, 4),
                          columns=['name', 'user_id', 'score'])

    # Creating a sparse matrix, by retrieving 3 columns: 
    # the actual matrix content in the scores, and the column names is 'user_id' and the row names is 'name'.
    my_pivot = my_df1.pivot_table(values='score', index='name', columns='user_id')

```
[Link](https://www.youtube.com/watch?v=5yFox2cReTw)

### Printing data so all columns will be presented
```python
pd.set_option('display.max_rows', 500)    # To see all rows
pd.set_option('display.max_columns', 500) # To see all columns
pd.set_option('display.width', 1000)
```

### Get data ditribution of the data per column

```python
import matplotlib.pyplot as plt
my_df.hist(bins=50, figsize=(20,15))
plt.show()
```


## Convert each consecutive pair of columns into a tuple in a single column
```python
df = ps.Datframe({"nose_x":[1,3,5],"nose_y":[11,18,9],"left_eye_x":[0,3,2], "left_eye_y":[11,25,3],"chin":[13,21,45]})

li = zip(df.columns[0:-1:2], df.columns[1:-1:2])

new_df = pd.DataFrame({f"{i}y": zip(df[i], df[j]) for i, j in li})
```

## Mapping/Applying categorical values to a specified numerical values

```python
 
event_type_strength = {
     'VIEW': 1.0,
     'LIKE': 2.0,
     'BOOKMARK': 2.5,
     'FOLLOW': 3.0,
     'COMMENT CREATED': 4.0,
 }

# mapping:
df['eventStrength'] = interactions_df['eventType'].apply(lambda x: event_type_strength[x])

```

## One hot encoding

```python
categorical_columns = ['Gender', 'House Type']

for column in categorical_columns:
    tempdf = pd.get_dummies(df[column], prefix=column)
```
## Mathematical functions

### Calculate correlation for all numerical columns pairs

```python
df.corr()
```

Attention: In case there is a categorical column in the dataframe it will get ignored it.

## Time-Series

### Converting to Time-Stamp

```python
df['Date'] = pd.to_datetime(df['Date'], format='%d/%M/%Y')
```

### Slicing date-time type

Approach #1:

```python
df['2012-1':'2012-1-2 00:00:00', 'Date']
```


Approach #2:

```python
df['Date'].truncate(before='2013-11-01', after='2013-11-02')
```


### Rolling Window Statistics

```python
load_val = ts_data['load']
shifted = load_val.shift(1)

window = shifted.rolling(window=6)

new_dataframe = concat([window.min, window.mean(), window.max(), load_val], axis=1)
new_dataframe.columns = ['min','mean','max', 'load']

print(new_dataframe.head(10))
```

### Expanding Window Statistics

Expanding window are features that include all previous data. 

```python
load_val = ts_data['load']
window = load_val.expanding()

new_dataframe = concat([window.min(), window.mean(), window.max(), load_val.shift(-1)], axis=1)
new_dataframe.columns = ['min','mean','max', 'load+1']

print(new_dataframe.head(10))
```

### Statsmodels

```python
from statsmodels.tsa.ar_model import AutoReg, ar_select_order

for t in range(test_ts.shape[0]):
   model = AutoReg(ts_data_load, 1)
   model_fit = model.fit()
   yhat = model_fit.predict
   predictions.append(yhat)
   obs = list(test_ts.iloc[t])
   # move the training window
   history.append(obs[0])
   history.pop(0)
   print(test_ts.index[t])
   print(t+1, ': predicted =', yhat, 'expected =', obs)
```

[Reference](https://machinelearningmastery.com/autoregression-models-time-series-forecasting-python/)

## Reference

[Pandas Cheat Sheet #1](https://www.datacamp.com/community/blog/python-pandas-cheat-sheet#gs.S4P4T=U)

[Pandas Cheat Sheet #2](http://datasciencefree.com/pandas.pdf)


[My Python Pandas Cheat Sheet](https://towardsdatascience.com/my-python-pandas-cheat-sheet-746b11e44368)