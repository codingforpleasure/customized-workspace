<!--ts-->
   * [matplotlib](#matplotlib)
      * [Basics](#basics)
         * [Simple plot](#simple-plot)
         * [Bar Charts](#bar-charts)
         * [Pie Charts](#pie-charts)
         * [Stack Plots](#stack-plots)
         * [Histograms](#histograms)
         * [Scatter Plots](#scatter-plots)
         * [Plotting time series Data](#plotting-time-series-data)
         * [Plotting Live data in real-time](#plotting-live-data-in-real-time)
         * [Subplots](#subplots)
         * [Simple plot](#simple-plot-1)

<!-- Added by: gil_diy, at: 2019-07-28T01:24+03:00 -->

<!--te-->

# matplotlib


## Basics

### Simple plot

```python
import matplotlib.pyplot as plt

ages_x = list(range(25, 36))

developer_salary_y = [38496, 42000, 46752, 49320, 53200, 56000, 62316, 64928, 67317, 68748, 73752]

# The label metioned is for the legend
plt.plot(ages_x, developer_salary_y, label='All Devs')

python_developer_salary_y = [45732, 48876, 53850, 57287, 63016, 65998, 70003, 70000, 71496, 75370, 83640]

plt.plot(ages_x, python_developer_salary_y, label='Python Devs')

plt.xlabel('Ages')
plt.ylabel('Median Salary (USD)')
plt.title('Median Salary (USD) by Age')

plt.legend()

# Showing what we've plotted
plt.show()

```

### Bar Charts
### Pie Charts
```python
from matplotlib import pyplot as plt

def pie_chart_with_explode():
    plt.style.use("fivethirtyeight")
    slices = [59219, 55466, 47544, 36443, 35917]
    labels = ['Javascript', 'HTML/CSS', 'SQL', 'Python', 'Java']
    relevant_colors = ['#008fd5', '#fc4f30', '#e5ae37', '#6d904f', '#D8BFD8']
    explode_parts = [0, 0, 0, 0.1, 0]

    plt.pie(slices,
            labels=labels,
            wedgeprops={'edgecolor': 'black'},
            colors=relevant_colors,
            explode=explode_parts,
            shadow=True,
            startangle=90,  # Rotate the pie
            autopct='%1.1f%%'  # show percentage
            )

    plt.title("My Awesome pie chart")
    plt.tight_layout()
    plt.show()
```
### Stack Plots
```python

```
### Histograms
```python
def histogram_basic_with_declared_bins():
    ages = [18, 19, 21, 25, 26, 26, 30, 32, 38, 45, 55, 47]

    the_bins = [20, 30, 40, 50, 60]

    # So the bins are between:
    # bin #1: people which fell in the age range: 20 - 30
    # bin #2: people which fell in the age range: 30 - 40
    # bin #3: people which fell in the age range: 40 - 50
    # bin #4: people which fell in the age range: 40 - 50
    # bin #5: people which fell in the age range: 50 - 60

    plt.hist(ages,
             bins=the_bins,
             edgecolor='black',
             log=True)

    median_age = statistics.median(ages)
    color_median = '#fc4f30'

    plt.axvline(median_age,
                color=color_median,
                label='Age Median',
                linewidth=5)

    plt.legend()

    plt.title('Ages of Respondents')
    plt.xlabel('Ages')
    plt.ylabel('Total Respondents')

    plt.show()
```

[Reference](https://www.youtube.com/watch?v=XDv6T4a0RNc&list=PL-osiE80TeTvipOqomVEeZ1HRrcEvtZB_&index=6)

### Boxplot
```python
ax3.boxplot(y)
```
### Scatter Plots

```python
def scatter_plot_with_different_sizes_and_colors():
    x_input = [5, 7, 8, 5, 9, 3, 1, 1, 5]
    y_input = [5, 7, 8, 5, 5, 6, 4, 3, 4]

    sizes = [100, 56, 222, 333, 151, 92, 67, 72, 103]
    colors = [1, 7, 8, 1, 1, 6, 4, 3, 1]

    # Color maps:
    # https://matplotlib.org/3.1.0/tutorials/colors/colormaps.html

    plt.scatter(x=x_input,
                y=y_input,
                s=sizes,
                c=colors,  # colors
                cmap='Pastel1',  # color map
                edgecolors='black',
                linewidth=1,
                alpha=0.5)

    plt.title('Title example: scatter_plot_with_different_sizes')
    plt.xlabel('x label')
    plt.ylabel('y label')

    color_bar = plt.colorbar()
    color_bar.set_label('Satifaction')
    plt.show()
```

[Reference](https://www.youtube.com/watch?v=zZZ_RCwp49g&list=PL-osiE80TeTvipOqomVEeZ1HRrcEvtZB_&index=7)


### Plotting time series Data
### Plotting Live data in real-time
### Subplots

### Simple plot

Description | command
------------|---------
Load image | img = mpimg.imread('my_image.jpg')
Show image | plt.imshow(output[i])
		   | plt.show(block=True)
		   | plt.interactive(False)
Save image to file | plt.savefig("example.png")  # should before plt.show method plt.show()



```python
plt.plot(ages, salaries_israel, label="graph1")
plt.plot(ages, salaries_USA, label="graph2")
plt.xlabel('Ages')
plt.ylabel('Salaries')
plt.grid(true)
plt.title('Median Salary (USD) by Age')
plt.legend()
plt.show()
```

### Configuring the axis

#### Plot image without showing axis:

By default we will see the axis.

```python
plt.axis('off')
```

#### Plot image without showing axis:

```python

```
#### Linestyles
```python
plt.plot(x,y, linewidth = 4.0)
plt.plot(x,y, ls='solid')
plt.plot(x,y, ls='--')
plt.plot(x,y, ls='--')
```
### Export plot
```python
plt.savefig('my_plot.png')
```

arguments | Description
------------|-----
dpi | set the resolution of the file to a numeric value
transparent | set to True, which causes the background of the chart to be transparent.


