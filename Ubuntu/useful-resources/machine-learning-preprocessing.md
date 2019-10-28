<!--ts-->
   * [Preprocessing the data](#preprocessing-the-data)
      * [Import the data](#import-the-data)
      * [get first rows of the data](#get-first-rows-of-the-data)
      * [Get data dimension of the data](#get-data-dimension-of-the-data)
      * [Get the columns name](#get-the-columns-name)
      * [Check how many missing values appears in each column](#check-how-many-missing-values-appears-in-each-column)
      * [Strategies to handle missing data](#strategies-to-handle-missing-data)
         * [Drop a particular row if it has a null value for a particular feature](#drop-a-particular-row-if-it-has-a-null-value-for-a-particular-feature)
         * [Drop a particular row if it has a null value for a particular feature](#drop-a-particular-row-if-it-has-a-null-value-for-a-particular-feature-1)

<!-- Added by: gil_diy, at: 2019-10-28T09:40+02:00 -->

<!--te-->


# Preprocessing the data

## Import the data

```python
my_dataset = pd.read_csv('input_data.csv')

my_dataset.index   # Get the range if the index

```

## get first rows of the data
```python
my_dataset.head(5) # Take a glimpse of the data
```

## Get data dimension of the data
```python
my_dataset.shape
```

## Get the columns name
```python
my_dataset.columns
```

## Check how many missing values appears in each column
```python
my_dataset.isnull().sum()
```

## Strategies to handle missing data

### Drop a particular row if it has a null value for a particular feature
```python
my_dataset.dropna(inplace=True)
my_dataset.isnull().sum() # Check that there is no NA values left.
```

### Drop a particular row if it has a null value for a particular feature
