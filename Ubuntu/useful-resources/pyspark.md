<!--ts-->
   * [PySpark](#pyspark)
      * [What is spark?](#what-is-spark)
      * [Install](#install)
      * [Open spark session](#open-spark-session)
      * [Read data](#read-data)
         * [read csv](#read-csv)
         * [read json](#read-json)
         * [show data](#show-data)

<!-- Added by: gil_diy, at: Sun 06 Mar 2022 11:07:14 IST -->

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
df_spark = spark.read.csv('my_csv_file.csv')
```

### read json

```python
df_spark = spark.read.json('my_json_file.json')
```

### show data

```python
df_spark.show()
```