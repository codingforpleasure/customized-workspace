<!--ts-->
- [Imputations](#imputations)
  - [Categorical columns](#categorical-columns)
    - [Mode (By frequency)](#mode-by-frequency)
  - [Numerical columns](#numerical-columns)
    - [Mean](#mean)
    - [Median](#median)
    - [Create a seperate model just for predicting the NaN values](#create-a-seperate-model-just-for-predicting-the-nan-values)

<!-- Added by: gil_diy, at: Wed 26 Jan 2022 20:44:24 IST -->

<!--te-->


<p align="center"> <!-- style="width:400px;" -->
  <img src="images/handling_missing_values.jpeg" title="tool tip here">
</p>

# Imputations

Mean, median and mode are all measures of central tendency in statistics. In different ways they each tell us what value in a data set is typical or representative of the data set.

Please read here: [Link](https://statistics.laerd.com/statistical-guides/measures-central-tendency-mean-mode-median.php)

## Categorical columns

### Mode (By frequency)

mode is used for categorical data where we wish to know which is the most common category.

* We can see above that the most common form of transport, in this particular data set, is the bus:

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/mode-1a.png" title="tool tip here">
</p>

* one of the problems with the mode is that it is not unique, so it leaves us with problems when we have two or more values that share the highest frequency, such as below:

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/mode-2.png" title="tool tip here">
</p>

## Numerical columns

### Mean

The mean has one main disadvantage: it is **particularly susceptible to the influence of outliers**. These are values that are unusual compared to the rest of the data set by being especially small or large in numerical value.


### Median

The median is the middle score for a set of data that has been arranged in order of magnitude. The median is less affected by outliers and skewed data


### Create a seperate model just for predicting the NaN values

All features in the rest of the columns are the X and the single column with the
NaN values is the target column.
