<!--ts-->
   * [PySpark](#pyspark)
      * [What is spark?](#what-is-spark)
      * [Install](#install)
      * [Open spark session](#open-spark-session)
      * [Read data](#read-data)
         * [read csv](#read-csv)
         * [read json](#read-json)
         * [show data](#show-data)
         * [Get Columns](#get-columns)
         * [Type of pyspark datframe](#type-of-pyspark-datframe)
         * [Print data schema (simiilar to my_df.info())](#print-data-schema-simiilar-to-my_dfinfo)
         * [See a specific column or columns](#see-a-specific-column-or-columns)
         * [See datatypes of columns](#see-datatypes-of-columns)
         * [Get simple statistics for each column](#get-simple-statistics-for-each-column)
         * [Adding columns in data frame](#adding-columns-in-data-frame)
         * [Drop columns in data frame](#drop-columns-in-data-frame)
         * [Renaming columns](#renaming-columns)

<!-- Added by: gil_diy, at: Sun 06 Mar 2022 12:03:02 IST -->

<!--te-->

# PySpark

## What is spark?

## Install 

```bash
pip install pyspark
```

## Open spark session

```python
from pyspark.sql import SparkSession


# Let's open a spark session
spark = SparkSession.builder.appName("Practice").getOrCreate()
```

## Read data
### read csv

```python
df_spark = spark.read.option('header', 'true').csv('my_csv_file.csv', infer)
```

### read json

```python
df_spark = spark.read.option('header', 'true').json('my_json_file.json')
```

### show data

```python
df_spark.show()
```


### Get Columns

```python
print(df_spark.columns)
```

### Type of pyspark datframe

```python
type(df_spark)
```
### Print data schema (simiilar to my_df.info())

```python
print(df_spark.printSchema())
```

<p align="center">
  <img width="400" src="images/spark/schema.jpg" title="Look into the image">
</p>

### See a specific column or columns

```python
print(df_spark.select(['column-name1','column-name2']).show())
``` 

### See datatypes of columns

```python
print(df_spark.dtypes)
```

### Get simple statistics for each column

Get the basic statistics such as:

* count

* mean

* stddev

* min

* max


```python
print(df_spark.describe().show())
```

### Adding columns in data frame

```python
df_spark.withColumn(colName='Experience after 2 years', col=df_spark['Experience'] + 2).show()
```


<p align="center">
  <img width="400" src="images/spark/add_column.jpg" title="Look into the image">
</p>

### Drop columns in data frame


```python
print(df_spark.drop('Experience after 2 years').show())
```

### Renaming columns

```python
print(df_spark.withColumnRenamed("Age", "new age").show())
```

