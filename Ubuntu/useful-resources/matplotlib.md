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

ages_x = list(range(25:36))

developer_salary_y = [38496,42000,46752, 49320, 53200, 56000, 62316, 64928, 67317, 68748, 73752]

# The label metioned is for the legend
plt.plot(agex_x, developer_salary_y, label = 'All Devs')

python_developer_salary_y = [45732, 48876, 53850, 57287, 63016, 65998, 70003, 70000, 71496, 75370, 83640]

plt.plot(agex_x, python_developer_salary_y, label = 'Python Devs')

plt.xlabel('Ages')
plt.ylabel('Median Salary (USD)')
plt.title('Median Salary (USD) by Age')

plt.legend()

#Showing what we've plotted
plt.show()

```

### Bar Charts
### Pie Charts
### Stack Plots
### Histograms
### Scatter Plots
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
Save image to file |plt.savefig("example.png")  # should before plt.show method plt.show()


plt.plot(ages, salaries_israel, label="graph1")
plt.plot(ages, salaries_USA, label="graph2")
plt.xlabel('Ages')
plt.ylabel('Salaries')
plt.grid(true)
plt.title('Median Salary (USD) by Age')
plt.legend()
plt.show()
