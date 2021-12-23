<!--ts-->
   * [seaborn: statistical data visualization](#seaborn-statistical-data-visualization)
      * [Plot line chart](#plot-line-chart)
      * [Set Title](#set-title)
      * [Set width of the figure](#set-width-of-the-figure)
      * [Add label for horizontal axes](#add-label-for-horizontal-axes)
      * [Add label for vertical axes](#add-label-for-vertical-axes)
      * [Adding legend](#adding-legend)
      * [Bar chart](#bar-chart)
      * [Heatmap](#heatmap)

<!-- Added by: gil_diy, at: Thu 23 Dec 2021 15:24:26 IST -->

<!--te-->

# seaborn: statistical data visualization

## Plot line chart

```python
sns.lineplot(data=financial_data)
```

## Set Title 

```python
# Add title
plt.title("Daily Global Streams of Popular Songs in 2017-2018")
```

## Set width of the figure

```python
# Set the width and height of the figure
plt.figure(figsize=(14,6))
```

## Add label for horizontal axes

```python
# Add label for horizontal axis
plt.xlabel("Date")
```

## Add label for vertical axes
```python
# Add label for vertical axis
plt.ylabel("Arrival delay (in minutes)")
```

## Adding legend

 The label to make the line appear in the legend and set its corresponding label.

```python
# Line chart showing daily global streams of 'Shape of You'
sns.lineplot(data=spotify_data['Shape of You'], label="Shape of You")

# Line chart showing daily global streams of 'Despacito'
sns.lineplot(data=spotify_data['Despacito'], label="Despacito")
```

## Bar chart

```python
sns.barplot(x=flight_data.index, y=flight_data['NK'])
```

## Heatmap

```python
# Heatmap showing average arrival delay for each airline by month
# This ensures that the values for each cell appear on the chart
sns.heatmap(data=flight_data, annot=True)
```

Another example
```python
# Set the width and height of the figure
plt.figure(figsize=(8, 6))
# Bar chart showing average score for racing games by platform
sns.barplot(x=ign_data['Racing'], y=ign_data.index)
# Add label for horizontal axis
plt.xlabel("")
# Add label for vertical axis
plt.title("Average Score for Racing Games, by Platform")
```

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/sns/bar_plot.png" title="tool tip here">
</p>