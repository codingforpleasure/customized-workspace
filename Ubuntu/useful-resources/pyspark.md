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
         * [See a spcefic column](#see-a-spcefic-column)

<!-- Added by: gil_diy, at: Sun 06 Mar 2022 11:39:06 IST -->

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

### See a spcefic column

```python
print(df_spark.select('Name'))
``` 