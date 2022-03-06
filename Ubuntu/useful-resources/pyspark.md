<!--ts-->
   * [PySpark](#pyspark)
      * [What is spark?](#what-is-spark)
      * [Install](#install)
         * [read csv](#read-csv)
         * [read json](#read-json)

<!-- Added by: gil_diy, at: Sun 06 Mar 2022 11:05:11 IST -->

<!--te-->

# PySpark

## What is spark?

## Install 

```bash
pip install pyspark
```

### 
```python
from pyspark.sql import SparkSession


# Let's open a spark session
spark = SparkSession.builder.appName("Practice").getOrCreate()
```

### read csv

```python
spark.read.csv('my_csv_file.csv')
```

### read json

```python
spark.read.json('my_json_file.json')
```