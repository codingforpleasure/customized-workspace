<!-- TOC -->

- [KQL - Machine Learning](#kql---machine-learning)
    - [basket](#basket)
    - [autocluster](#autocluster)
    - [diffpatterns](#diffpatterns)
    - [reduce](#reduce)

<!-- /TOC -->

# KQL - Machine Learning

## basket

We will do an analysis to see which combination  of computer plus performance counters appears the most frequently.

```
Perf 
| where TimeGenerated >=ago(10d)
| project  Computer,ObjectName, CounterName,InstanceName
| evaluate basket()
```

In case we would like to improve our constraint with a threshold,
we should write:
```
let my_threshold = 0.2;
Perf 
| where TimeGenerated >=ago(10d)
| project  Computer,ObjectName, CounterName,InstanceName
| evaluate basket(my_threshold)
```
The threshold determines the minimum frequency a combination must occur in order to be considered for inclusion. KQL uses a ratio of 0 to 1, with the default being 0.05


## autocluster

autocluster finds common patterns of discrete attributes (dimensions) in the data. It then reduces the results of the original query, whether it's 100 or 100,000 rows, to a few patterns.
This is similar to the basket function except is uses a different algorithm.  

Like bucket, autocluster has a weight parameter called SizeWeight. 
It determines the balance between high coverage (less rows but more focused results) and informative (many shared values)
Value is in range of 0-1 with 0.5 being default

```
let sizeWeight = 0.3;
Event
| where TimeGenerated >= ago(10d)
| project Source 
        , EventLog 
        , Computer 
        , EventLevelName 
        , RenderedDescription 
| evaluate autocluster(sizeWeight)
```

## diffpatterns

diffpatterns takes a dataset and splits it into *two halves* based on two value in a specified column. It then returns the most common set of attributes,
showing how many were associated with the first value (A) and how many for the second value (B).

Here we're going to take a set of attributes from the Event table, and split the data based on the EventLevelName column. Side A will be  Error events, side B Warning events.

```
Event
| where TimeGenerated >= ago(5d)
| project Source, Computer, EventID, EventCategory, EventLevelName
| evaluate diffpatterns(EventLevelName, 'Error', 'Warning')
```

## reduce

reduce is used to determine **patterns in string data**. For example, let's
say you have ten computers whose names all end in .ContosoRetail.com. Reduce
will summarize them into the pattern of *.ContosoRetail.com, give you a 
count of the number of occurences for this pattern, then in the 
Representative column show one exaple of this pattern

```
Perf
| where TimeGenerated >= ago(12h)
| project Computer 
| reduce by Computer 
```

<p align="center">
  <img src="images\reduce.jpg" width="1000">
</p>