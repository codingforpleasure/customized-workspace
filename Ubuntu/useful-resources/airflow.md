<!--ts-->
   * [Airflow](#airflow)
      * [What is airflow?](#what-is-airflow)
      * [How things is done without Airflow?](#how-things-is-done-without-airflow)

<!-- Added by: gil_diy, at: Tue 29 Mar 2022 11:11:08 IDT -->

<!--te-->


# Airflow

Was developed by Airbnb. help to write production data pipeline.

## What is airflow?

A platform to programmatically author, schedule, and monitor workflows.

Use Airflow to author workflows as directed acyclic graphs (DAGs) of tasks. The Airflow scheduler executes your tasks on an array of workers while following the specified dependencies.

[Link](https://github.com/apache/airflow)


## How things is done without Airflow?

**Traditional ETL approach**

<p align="center">
  <img width="400" src="images/airflow/traditional_etl.png" title="Look into the image">
</p>

Example of a naive approach:

* Writing a script to pull data from database and send it to HDFS to process

* Schedule the script as cronjob


[Introduction to Apache Airflow](https://www.youtube.com/watch?v=AHMm1wfGuHE&list=PLYizQ5FvN6pvIOcOd6dFZu3lQqc6zBGp2)