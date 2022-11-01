<!--ts-->
* [KQL (Kusto Query Lanugage)](#kql-kusto-query-lanugage)
   * [Search](#search)
      * [Search whole table across all columns](#search-whole-table-across-all-columns)
      * [Search whole table on specific column](#search-whole-table-on-specific-column)
      * [Search partial keyword in a specific column](#search-partial-keyword-in-a-specific-column)
      * [Search word with wild card](#search-word-with-wild-card)
      * [Search word which appears in the end of the string](#search-word-which-appears-in-the-end-of-the-string)
   * [Where](#where)
   * [Take](#take)
   * [Count](#count)
   * [Summarize](#summarize)
   * [Extend](#extend)
   * [Project](#project)
   * [Distinct](#distinct)
   * [Scalars Operators](#scalars-operators)
      * [print](#print)
      * [now](#now)
      * [ago](#ago)
      * [sort](#sort)
      * [extract](#extract)
* [Example #1](#example-1)
* [Example #2](#example-2)
      * [parse](#parse)
      * [datetime](#datetime)
      * [Timespan Arithmetic](#timespan-arithmetic)
      * [startof ...](#startof-)
      * [endof ...](#endof-)
      * [between](#between)
      * [String operators](#string-operators)
         * [starcat](#starcat)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Tue 01 Nov 2022 10:29:33 IST -->

<!--te-->

# KQL (Kusto Query Lanugage)

## Search

The search command

### Search whole table across all columns

```KQL
Perf | search "Memory"
```

The table name is **Perf**

This symbol **|**, is called **pipe**, is a technique for passind information from one program to another program.

in our example, we are piping the content of table Perf into -the search command.

search for word "Memory" in table named **Perf**

same as:

```KQL
Perf | search "memory"
```

Therfore we can easily see, the search is not case sensitive.

### Search whole table on specific column

```KQL
Perf | search CounterName=="Available MBytes"
```

### Search partial keyword in a specific column

```KQL
Perf | search CounterName:"MBytes"
```

Use colon for **partial keyword search**

### Search word with wild card 

```KQL
Perf | search "*Bytes*"
```

`*` - means any character which may apear multiple times 

### Search word which appears in the end of the string

```KQL
Perf | search * endswith "Bytes"
```

Looking in the table **Perf** over all columns the word **Bytes** in the end of the string. 


```KQL
Perf | search * startswith "130"
```
In case, we would like to search for a prefix, we will use the **startswith** a function.

```KQL
Perf | search "Free*bytes"  and ("c:" or "d:")
```

Here we have table perf which we are searching in it,
we are looking for  "Free*bytes" and another constraint
is the rows should hold either "c:" or "d:" 

```KQL
Perf | search InstanceName matches regex "[A-D]:"
```

we are looking for in a specific column **InstanceName**, 
We are filtering the rows with regex constraint:
The constraint is all Letters between A to D and colon after.

## Where
```
Perf
| where TimeGenerated >= ago(1h) 
|  where (CounterName == "Bytes Received/sec"
        or
        CounterName == "% Processor Time"
        )
| where CounterValue > 0
```
Here we have 3 pipes after each pipe there is constraiht,
usind the **where** command we are focusing on specific columns.

The exact command can be written like this:


```
Perf
| where TimeGenerated >= ago(1h) 
   and (CounterName == "Bytes Received/sec"
        or
        CounterName == "% Processor Time"
        )
   and CounterValue > 0
```


## Take
```
Perf | take 7 
```
Here we are retrieving 7 rows randomly.
Next time, we will run the same command we will get different rows.

* The command **take** is the same as **limit**

## Count
```
Perf | count
```
Here we are counting the number of rows in table perf.

```
Perf
| where TimeGenerated >= ago(1h) 
   and (CounterName == "Bytes Received/sec"
   and CounterValue > 0
| count
```

here we are performing filtering on table perf and afterwards we check the number of rows in the end result.

## Summarize

```
Perf | summarize count() by ObjectName
```
<p align="center">
  <img src="images\summerize_example.jpg" width="1000">
</p>

Combining the summarize function with count function outputs the count of each distinct value in the column ObjectName.



**Example #2**

```
Perf | summarize column_counter=count() by ObjectName, CounterName
```

Combining the summarize function with count function outputs the count of each distinct value in the columns both ObjectName and CounterName. finally we rename the **count_** column to **column_counter**



**Example #3**

```
Perf | summarize NumberOfEntries=count()
               by bin(TimeGenerated,1h)
```

Here we are focusing on Perf table, We want to count the number of rows in each day (According to column TimeGenerated), therefore, we use the function bin to generate actuall bins. (each day represents a single bin)


**Example #4**

```
Perf | where CounterName =="% Free Space" 
| summarize NumberOfRowsAtThisPrecentLevel=count()
         by bin(CounterValue,10)
```

Here we are focusing on table **Perf**, now we apply a filter
on all rows with constraint the value of CounterName should be "% Free Space", afterwards we split the rows into buckets (bins), each bucket of size 10. Eventually, we get a histogram where all bins appear.

## Extend


**Example 1**
```
Perf | where  CounterName == "Free Megabytes"
   | extend FreeGB=CounterValue/1000

```
Here we are focusing on table **Perf**, now we apply a filter
on all rows with constraint the value of CounterName should be "Free Megabytes", afterwards we would like to add another column therefore will use the extend function.
The new column name with be FreeGB.

**Example 2**
```
Perf| where TimeGenerated >=ago(10m)
     | extend ObjectCounter = strcat(ObjectName,"-",CounterName) 
```
Here we are focusing on table **Perf**, now we apply a filter
on all rows with constraint the value of TimeGenerated should be larger than 10 minutes. afterwards, we would like to add a new column which will hold the concatenation of each value in 2 columns (ObjectName, CounterName).

## Project

**Example 1**
```
Perf | project ObjectName, SourceSystem
```
Here we are picking 2 columns from table **Perf**.



**Example 2**

```
Perf | where CounterName == "Free Megabytes"
     |  project ObjectName,
                CounterName,
                InstanceName,
                TimeGenerated,
                FreeGB= CounterValue/1000,
                FreeMB= CounterValue,
                FreeKB= CounterValue*1000
                
```                
Here we are focusing on table **Perf**, now we apply a filter
on all rows with constraint the value of CounterName should be "Free Megabytes", afterwards we pick 4 columns (ObjectName,
                CounterName,
                InstanceName,
                TimeGenerated),
                FreeMB= CounterValue,
and add 3 columns (FreeGB, FreeMB, FreeKB).

**Example 3**

The **opposite** of the function **project** is **project-away**,
it will discard the columns we have mentioned in the query.
In the example below we are discarding the following columns:
TenantId,SourceSystem , CounterPath , CounterValue.

```
Perf | where TimeGenerated > ago(1h)
     |  project-away TenantId,SourceSystem , CounterPath , MG, CounterValue
 ```

## Distinct

The command distinct returns a list of values which are not repetitive.

Example: ['Mory', 'Gil', 'Omer', 'Omer', 'Mory'] -> ['Mory', 'Gil', 'Omer'] 

```
Perf | distinct InstanceName
```

## Scalars Operators

### print

print command is used for printing messages on the screen

```
print "Mory!!"
```
evaluate mathemtical expressions:

```
print 11*18
```

### now

returns the current datetime

```
print now()
```

### ago

brings us the datetime according to the value we have passed.

Gives us yesterday:

```
print ago(1d)
```

```
print ago(1h)
```

```
print ago(1m)
```

```
print ago(1s)
```

```
print ago(1ms)
```

Gives us tomorrow:

```
print ago(-1d)
```



### sort

Sort table alphabetically the rows according to a specific column.

```
Perf | sort by Computer
```

### extract



Using the extract command we can retrieve the relevant characters 
which satisfy the constraints. 

# Example #1

In our case we requested below all characters,
which are alphabetical (numbers will get discarded).

```
print extract("([a-z]+)", 0, "454846mory455")
```

# Example #2

```
Perf | where ObjectName = "LogicalDisk" and Instancename matches regex "[A-Z]:"
| project Computer, CounterName, extract("([A-Z]):", 1, InstanceName)
```


### parse

TODO give a good example!!!!

### datetime

Here we are adding a new column which holds the amount of time past since Time-generated to now.


**Example #1:**

```
Perf | extend time_diff = now() - TimeGenerated
```




### Timespan Arithmetic

### startof ...

### endof ...

### between


### String operators

#### starcat

