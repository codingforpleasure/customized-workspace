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


out = df.select(
    pl.sum("nrs"),
    pl.col("names").sort(),
    pl.col("names").first().alias("first name"),
    (pl.mean("nrs") * 10).alias("10xnrs"),
)
print(out)
```