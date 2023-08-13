- [Polars](#polars)
  - [Data structures](#data-structures)
    - [Series](#series)
    - [Dataframe](#dataframe)
  - [Read from csv](#read-from-csv)
  - [Sample](#sample)
  - [Get summary statistics of a dataframe](#get-summary-statistics-of-a-dataframe)
  - [Select](#select)
  - [with\_columns](#with_columns)
  - [filter](#filter)
  - [groupby](#groupby)
    - [groupby is iterable, returning the name and data of each group.](#groupby-is-iterable-returning-the-name-and-data-of-each-group)
  - [Join](#join)
    - [Inner Join](#inner-join)
    - [Left Join](#left-join)
    - [Outer Join](#outer-join)
  - [Concat](#concat)
    - [Vertical concatenation - getting longer](#vertical-concatenation---getting-longer)
    - [Horizontal concatenation - getting wider](#horizontal-concatenation---getting-wider)


# Polars

Polars is written in Rust which gives it C/C++ performance and allows it to fully control performance critical parts in a query engine.

As such Polars goes to great lengths to:

* Reduce redundant copies.
* Traverse memory cache efficiently.
* Minimize contention in parallelism.
* Process data in chunks.
* Reuse memory allocations.

```python
import polars as pl
```
## Data structures
### Series
```python
import polars as pl

s = pl.Series("a", [1, 2, 3, 4, 5])
print(s)
```
### Dataframe

```python
df = pl.DataFrame(
    {
        "integer": [1, 2, 3, 4, 5],
        "date": [
            datetime(2022, 1, 1),
            datetime(2022, 1, 2),
            datetime(2022, 1, 3),
            datetime(2022, 1, 4),
            datetime(2022, 1, 5),
        ],
        "float": [4.0, 5.0, 6.0, 7.0, 8.0],
    }
)

print(df)
```

## Read from csv

```python
df = pl.read_csv('log_total.csv')
```

## Sample
If you want to get an impression of the data of your DataFrame, 
you can also use sample. 

With sample you get an n number of random rows from the DataFrame.

```python
print(df.sample(2))
```

## Get summary statistics of a dataframe

```python
print(df.describe())
```

## Select



```
df = pl.DataFrame(
    {
        "nrs": [1, 2, 3, None, 5],
        "names": ["foo", "ham", "spam", "egg", None],
        "random": np.random.rand(5),
        "groups": ["A", "A", "B", "C", "B"],
    }
)
print(df)
```

As you can see from the query the select context is very powerful and allows you to perform arbitrary expressions independent (and in parallel) of each other. 


select drops the original columns

```
out = df.select(
    pl.sum("nrs"),
    pl.col("names").sort(),
    pl.col("names").first().alias("first name"),
    (pl.mean("nrs") * 10).alias("10xnrs"),
)
print(out)
```

## with_columns

`with_columns` retains the original columns and adds new ones

```python
out2 = df.with_columns(
    pl.sum("nrs"),
    pl.col("names").sort(),
    pl.col("names").first().alias("first name"),
    (pl.mean("nrs") * 10).alias("10xnrs"),
)
```

## filter

```python
out = df.filter(pl.col("nrs") > 2)
print(out)
```

## groupby

```python
out = df.groupby("groups").agg(
    pl.sum("nrs"),  # sum nrs by groups
    pl.col("random").count().alias("count"),  # count group members
    # sum random where name != null
    pl.col("random").filter(pl.col("names").is_not_null()).sum().suffix("_sum"),
    pl.col("names").reverse().alias("reversed names"),
)
print(out)
```


###  groupby is iterable, returning the name and data of each group.

```
for name, data in df.groupby("a"):  
    print(name)
    print(data)
```

## Join

### Inner Join
```python
df_customers = pl.DataFrame(
    {
        "customer_id": [1, 2, 3],
        "name": ["Alice", "Bob", "Charlie"],
    }
)
print(df_customers)
```

```python
df_orders = pl.DataFrame(
    {
        "order_id": ["a", "b", "c"],
        "customer_id": [1, 2, 2],
        "amount": [100, 200, 300],
    }
)
print(df_orders)
```

```python
df_inner_customer_join = df_customers.join(df_orders, on="customer_id", how="inner")
print(df_inner_customer_join)
```

### Left Join

```python
df_left_join = df_customers.join(df_orders, on="customer_id", how="left")
print(df_left_join)

```

### Outer Join

```python
df_outer_join = df_customers.join(df_orders, on="customer_id", how="outer")
print(df_outer_join)
```

## Concat

### Vertical concatenation - getting longer

```python
df_v1 = pl.DataFrame(
    {
        "a": [1],
        "b": [3],
    }
)
df_v2 = pl.DataFrame(
    {
        "a": [2],
        "b": [4],
    }
)
df_vertical_concat = pl.concat(
    [
        df_v1,
        df_v2,
    ],
    how="vertical",
)
print(df_vertical_concat)

```

### Horizontal concatenation - getting wider

```python
df_h1 = pl.DataFrame(
    {
        "l1": [1, 2],
        "l2": [3, 4],
    }
)
df_h2 = pl.DataFrame(
    {
        "r1": [5, 6],
        "r2": [7, 8],
        "r3": [9, 10],
    }
)
df_horizontal_concat = pl.concat(
    [
        df_h1,
        df_h2,
    ],
    how="horizontal",
)
print(df_horizontal_concat)
```
