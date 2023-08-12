# Polars



```python
import polars as pl
```


## Read from csv

```python
df = pl.read_csv('log_total.csv')
```


    pl.scan_csv("iris.csv")
    .filter(pl.col("sepal_length") > 5)
    .groupby("species")
    .agg(pl.all().sum())
)

df = q.collect()