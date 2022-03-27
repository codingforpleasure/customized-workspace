<!--ts-->
   * [AWS](#aws)
      * [Services](#services)
      * [AWS CLI](#aws-cli)
         * [Create a new private S3 bucket](#create-a-new-private-s3-bucket)

<!-- Added by: gil_diy, at: Sun 27 Mar 2022 11:42:46 IDT -->

<!--te-->


# AWS

## Services

Service name | Description
------------|-----
Amazon S3  | Cloud Object Storage
Redshift | Amazon Redshift is a fully managed data warehouse that allows us to run complex analytic queries against petabytes of structured data
Amazon Comprehend | Amazon Comprehend is a fully managed AI service for natural language processing (NLP) 
                  | Amazon Comprehend takes text documents as input and recognizes entities, key phrases, language.
and sentiment
Amazon Neptune  | Amazon Neptune is a fully managed graph database
Neptune ML |  Neptune ML implements graph neural networks (GNNs) to make predictions using graph data.
AWS DeepLens | 
AWS DeepRacer | Is a fully autonomous 1/18th-scale race car driven by reinforcement learning
 
We configure the SageMaker Autopilot job by providing our raw data in an S3 bucket
in the form of a tabular CSV file.


## AWS CLI

### Create a new private S3 bucket

```python
aws s3 mb s3://data-science-on-aws
```