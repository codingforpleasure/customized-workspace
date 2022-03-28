<!--ts-->
   * [AWS](#aws)
      * [Services](#services)
      * [AWS Data Wrangler](#aws-data-wrangler)
         * [Install AWS Data Wrangler](#install-aws-data-wrangler)
         * [Read dataset directly from S3 into pandas](#read-dataset-directly-from-s3-into-pandas)
      * [AWS CLI](#aws-cli)
         * [Create a new private S3 bucket](#create-a-new-private-s3-bucket)
         * [Copy the content of the public S3 bucket to our newly created private S3 bucket](#copy-the-content-of-the-public-s3-bucket-to-our-newly-created-private-s3-bucket)
         * [list the S3 folder](#list-the-s3-folder)

<!-- Added by: gil_diy, at: Mon 28 Mar 2022 12:56:07 IDT -->

<!--te-->


# AWS

## Services

Service name | Description
------------|-----
AWS Data Wrangler | Extends the power of **pandas** to AWS. AWS Data Wrangler connects pandas DataFrames with AWS services such as Amazon S3, AWS Glue, Amazon Athena, and Amazon Redshift. AWS Data Wrangler provides optimized Python functions to perform common ETL tasks to load and unload data between data lakes, data warehouses, and databases.
Amazon S3  | Cloud Object Storage
Redshift | Amazon Redshift is a fully managed data warehouse that allows us to run complex analytic queries against petabytes of structured data
AWS Deequ | AWS Deequ is an open source library built on top of Apache Spark that lets us define
**unit tests for data and measure data quality in large datasets**
Amazon Comprehend | Amazon Comprehend is a fully managed AI service for natural language processing (NLP) 
                  | Amazon Comprehend takes text documents as input and recognizes entities, key phrases, language.
Amazon Neptune  | Amazon Neptune is a fully managed graph database
Amazon Athena | Amazon Athena is a serverless, interactive query service to query data and analyze big data in Amazon S3 using standard SQL
Neptune ML |  Neptune ML implements graph neural networks (GNNs) to make predictions using graph data.
AWS DeepLens | 
AWS DeepRacer | Is a fully autonomous 1/18th-scale race car driven by reinforcement learning
 
We configure the SageMaker Autopilot job by providing our raw data in an S3 bucket
in the form of a tabular CSV file.

## AWS Data Wrangler

### Install AWS Data Wrangler

```bash
pip install awswrangler
```

### Read dataset directly from S3 into pandas

```bash
import awswrangler as wr

# Retrieve the data directly from Amazon S3
df = wr.s3.read_parquet("s3://<BUCKET>/<DATASET>/"))
```

## AWS CLI

### Create a new private S3 bucket

```bash
aws s3 mb s3://data-science-on-aws
```

### Copy the content of the public S3 bucket to our newly created private S3 bucket

```bash
aws s3 cp --recursive s3://amazon-reviews-pds/tsv/  s3://data-science-on-aws/amazon-reviews-pds/tsv/ \
--exclude "*" --include "amazon_reviews_us_*"
```

### list the S3 folder 

```bash
aws s3 ls s3://data-science-on-aws/amazon-reviews-pds/parquet-from-redshift/2015
```