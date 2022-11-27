<!--ts-->
* [KQL (Kusto Query Lanugage)](#kql-kusto-query-lanugage)
   * [Add comment in KQL](#add-comment-in-kql)
   * [Search](#search)
      * [Search whole table across all columns](#search-whole-table-across-all-columns)
      * [Search whole table on specific column](#search-whole-table-on-specific-column)
      * [Search partial keyword in a specific column](#search-partial-keyword-in-a-specific-column)
      * [Search word with wild card](#search-word-with-wild-card)
      * [Search word which appears in the end of the string](#search-word-which-appears-in-the-end-of-the-string)
   * [Logical operators](#logical-operators)
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
      * [parse](#parse)
      * [datetime](#datetime)
      * [Timespan Arithmetic](#timespan-arithmetic)
      * [startof ...](#startof-)
         * [Start of year](#start-of-year)
         * [Start of hour](#start-of-hour)
      * [endof ...](#endof-)
         * [end of year](#end-of-year)
         * [end of hour](#end-of-hour)
      * [between](#between)
      * [format_datetime](#format_datetime)
      * [format_timespan](#format_timespan)
      * [if Condition](#if-condition)
      * [Top](#top)
      * [String operators](#string-operators)
         * [strcat](#strcat)
   * [Advanced Aggregation](#advanced-aggregation)
      * [arg_max and arg_min](#arg_max-and-arg_min)
      * [Max](#max)
      * [Sum](#sum)
      * [Sumif](#sumif)
      * [Countif](#countif)
      * [Pick random row from table](#pick-random-row-from-table)
      * [Pick random value from specific column](#pick-random-value-from-specific-column)
      * [Percentiles](#percentiles)
   * [Working with Datasets](#working-with-datasets)
      * [let](#let)
      * [join](#join)
         * [Example 1:](#example-1)
         * [Example 2:](#example-2)
      * [union](#union)
         * [Example #1:](#example-1-1)
         * [Example #2:](#example-2-1)
      * [datatable](#datatable)
      * [Prev/Next](#prevnext)
         * [Example1](#example1)
         * [Example2](#example2)
      * [toscalar](#toscalar)
      * [row_cumsum](#row_cumsum)
      * [materialize](#materialize)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sun 27 Nov 2022 16:19:55 IST -->

<!--te-->

# KQL (Kusto Query Lanugage)

## Add comment in KQL

```
# This is a comment
```

To comment out or uncomment mulltiple lines, mark them all and press `Ctrl + /`

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

## Logical operators

| Meaning      | Symbol | Example | result|
| ----------- | ----------- |----| -----|
| Not      | `!` or `not`     | `print not (5>3)` | `false`
| And   | `and`       | `print (5>3) and (6<7)` | `true`
| Or    | `or` | `print  ((5>3) or (3>10))` | `true`



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

Here we are creating histogram by two columns (Computer, KubeEventType) and afterwards we sort by Computer and  KubeEventType by ascending order

```
KubeEvents
| project Computer, KubeEventType
| summarize count() by Computer, KubeEventType
| sort by Computer asc, KubeEventType asc
```


**Example #4**

```
Perf | summarize NumberOfEntries=count()
               by bin(TimeGenerated,1d)
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

Gives us yesterday at the hour and minute, which means **exactly 24 hours before**:

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

You can use the keyword:

* `asc` - Ascending order

* `desc` - Descending order

### extract



Using the extract command we can retrieve the relevant characters 
which satisfy the constraints. 

**Example #1**

In our case we requested below all characters,
which are alphabetical (numbers will get discarded).

```
print extract("([a-z]+)", 0, "454846mory455")
```

**Example #2**

```
Perf | where ObjectName = "LogicalDisk" and Instancename matches regex "[A-Z]:"
| project Computer, CounterName, extract("([A-Z]):", 1, InstanceName)
```


### parse

The parse command is very helpful for splitting a string 
into multiple columns.
you should pipe the string and then parse it with columns names.
In our examples the columns' names are: 
* *age_column* 
* *weight_column*
* *name_column*

so all values after the keywords:
* "Age:"
* ",weight:"
* ",name:"

are set into the corresponding columns.


```
print my_value = 'Age:15,weight:35Kg ,name:Roni'
| parse my_value with  "Age:" age_column 
                    ",weight:" weight_column
                    ",name:" name_column
```


<p align="center">
  <img src="images\parse_example.jpg" width="1000">
</p>


### datetime

Here we are adding a new column which holds the amount of time past since Time-generated to now.


**Example #1:**

```
Perf | extend time_diff = now() - TimeGenerated
```

**Example #2:**

```
Perf |
extend hour=datetime_part("Hour", TimeGenerated) |
extend isAfternoon = hour > 7 |
summarize count() by isAfternoon
```


### Timespan Arithmetic

### startof ...

#### Start of year

```
Perf | extend beginning_of_year = startofyear(TimeGenerated)
```

#### Start of hour

````
Perf | extend beginning_of_hour = startofhour(TimeGenerated)
````

### endof ...

#### end of year

```
Perf | extend end_of_year = endofyear(TimeGenerated)
```

#### end of hour

```
Perf | extend end_of_hour = endofhour(TimeGenerated)
```

### between

We can use between while using where,
for retrieving rows which staisfy the between constraint.

```
Perf 
| where CounterName == "% Free Space" 
| where CounterValue between (70.0..100.0)
```

### format_datetime

```
Perf 
| take 100
| project CounterName,
          CounterValue,
          TimeGenerated,
          format_datetime(TimeGenerated,"y-M-d"),
          format_datetime(TimeGenerated,"yyyy-MM-dd")
```

<p align="center">
  <img src="images\format_date_time_example.jpg" width="1000">
</p>

### format_timespan

### if Condition

We can easily use an if condition, 
in the example below we check the value `CounterValue`,
if it's below 50 then the value would be: **"You might want to look at this"** otherwise the value would be: **You're OK!**

```
Perf 
| where CounterName == "% Free Space"
| extend FreeState = iif(CounterValue <50, 
                        "You might want to look at this",
                        "You're OK!")
| project Computer , CounterName, CounterValue, FreeState 
```

### Top

In Perf table, we would like to sort in desc order by `CounterValue` and get the top 20 rows.
which means the 20 largest value of `CounterValue`.

```
Perf | top 20 by CounterValue
```

### String operators

#### strcat

## Advanced Aggregation

### arg_max and arg_min

**Example #1:**
In case we would like to retrieve the whole row, which holds the minimum CounterValue. we will write:

```
Perf | summarize  arg_min(CounterValue,*)
```

**Reminder:** For getting the whole row of either minimum or maximum value we use `arg_min` or `arg_max`.

**Example #2:**

Here we are focusing on Perf table,
we would like to group all rows with the same `CounterName`, therefore we have used:
summarize ____ by CounterName
from each group we would like to get the row with max **CounterValue** , after we got all maximums of all groups we sort the rows by CounterName.



```
Perf 
| summarize arg_max(CounterValue, *) by CounterName
| sort by CounterName asc
```

### Max

Here after applying constraint on column `CounterName`, we would like to get the row which consists the maximum value of
`CounterValue` .

```
Perf 
| where CounterName == "Free Megabytes" 
| summarize max(CounterValue)
```

### Sum


Here after applying constraint on column `CounterName`, we would like to get the sum of column:
`CounterValue` 

```
Perf 
| where CounterName == "Free Megabytes" 
| summarize sum(CounterValue)
```

### Sumif


Here we calculate the sum of cells only if the same row satisfies the constriant: `CounterName == "Free Megabytes" `
```
Perf
| summarize sumif(CounterValue, CounterName == "Free Megabytes" )
```

### Countif

We would like to create an histogram only for the CounterName which contains "Bytes".

```
Perf
| summarize RowCount= countif(CounterName  contains "Bytes") by CounterName
| sort by CounterName asc 
```

### Pick random row from table

```
Perf 
| summarize any(*)
```

### Pick random value from specific column

Here we would like to pick a random cell from the column
`Computer`.

```
Perf | summarize  any(Computer)
```

Takes a random value from both columns:

```
Perf | summarize  any(Computer,CounterName)
```


Here we return a random row for each distinct value
in the clumn adter the by clause

```
Perf 
| summarize any(*) by CounterName
| sort by CounterName asc
```

### Percentiles

Run this example,
here we are renaming the generated columns 
(`percentile_CounterValue_5`, `percentile_CounterValue_30`, `percentile_CounterValue_95` )

```
Perf
| where CounterName == "Available MBytes"
| summarize percentiles(CounterValue, 5,30,95) by Computer
| project-rename Percent05 = percentile_CounterValue_5
                 ,Percent30 = percentile_CounterValue_30
                 ,Percent95 = percentile_CounterValue_95
```

## Working with Datasets

### let

**Important**: to run the code in `Microsoft Azure` select all the code and then press `Run`.   

let means to store a value in a variable

```
let minCounterValue = 300;
let countername ="Free Megabytes";

Perf 
| project Computer,
         TimeGenerated,
         CounterName,
         CounterValue
| where CounterName  == countername and CounterValue <= minCounterValue
```

* We can easily write a function using a `let` statement,
here we write a function named: `dateDiffInDays` 
The functions recieves two arguments (`date1`, `date2`), and then in the body of the function we calculate the difference between those dates in days.

```
let dateDiffInDays = (date1: datetime , date2: datetime =datetime(2018-01-01))
                     { (date1-date2)/1d}
                     ;

print dateDiffInDays(now(), todatetime("2018-05-01"))
```

* We can easily write a function using a let statement, here we write a function named: get_earlier_date The functions recieves two arguments (date1, date2), and then in the body of the function we find which date is earlier and return the date

```
let get_earlier_date = (date1: datetime , date2: datetime)
                     {iif(date1>date2,date2,date1)}
                     ;

print get_earlier_date(todatetime("2017-05-01"), todatetime("2002-01-01"))
```

### join

#### Example 1:

Here we are joining the two tables which have common column named `Computer`, 

```
Perf 
| where  TimeGenerated >= ago(30d)
| take 1000
| join (VMComputer) on Computer
```

#### Example 2:

```
let startTime= ago(1d);
let endTime = now();
let procData= (
 Perf 
 | where TimeGenerated between (startTime..endTime)
 | where CounterName == "% Processor Time"
 | where ObjectName == "Processor"
 | where InstanceName =="_Total"
 | summarize PctCpuTime = avg(CounterValue)
    by Computer, bin(TimeGenerated, 1h)
 );

 let MemData=(
 Perf
  | where TimeGenerated between (startTime..endTime)
  | where CounterName == "Available MBytes"
  | summarize AvailableMB = avg(CounterValue)
    by Computer, bin(TimeGenerated, 1h)
);

procData | join kind= inner (MemData) 
on Computer, TimeGenerated
| project TimeGenerated, Computer, PctCpuTime , AvailableMB
| sort by TimeGenerated desc, Computer asc
```


### union

#### Example #1:

Here we conduct union between two tables:
`UpdateSummary`, `Update`. the union will output all rows one table below the other. For understanding which row came from which table we have added the `withsource="SourceTable"`
```
UpdateSummary 
| union withsource="SourceTable" Update
```

#### Example #2:

Attention the default value of the union operation is `inner`.

**Union outer**

**Returns all columns from both tables:**

```
union kind=outer withsource="SourceTable"
UpdateSummary,
Update
```

### datatable

Here we are creating a sample table, with 4 columns and the data inside it.

```
datatable (ID:int , TimeGenerated:datetime , YouTubeName:string, YouTubeURL:string)
[
1,datetime(2018-04-01),'Rocket','www.Rocket.com',
2,datetime(2018-04-01),'Dog','www.Dog.com',
3,datetime(2018-04-01),'Cat','www.Cat.com'
]
```

### Prev/Next

For using the prev or next function we must use the `serialize` function.

#### Example1

```
let SomeData = datatable (rowNum:int , rowVal:string )
[
1,"Value 01",
2,"Value 02",
3,"Value 03",
4,"Value 04",
5,"Value 05",
];

SomeData 
| serialize 
| extend prVal = strcat("Previous Value was ", prev(rowVal))
| extend nextVal = strcat("Next Value was ", next(rowVal))
```


#### Example2

Here we are calculating the moving average on `PctCpuTime` for three consecutive rows.

```
let startTime = ago(1d);
let endTime = now();

Perf
| where TimeGenerated between (startTime .. endTime)
| where Computer == "Contosoweb"
| where CounterName == "% Processor Time"
| where ObjectName == "Processor"
| where InstanceName == " Total"
| summarize PctCpuTime = avg(CounterValue) by bin(TimeGenerated, 1h)
| sort by TimeGenerated asc
| extend movAvg = (PctCpuTime + prev(PctCpuTime,1,0)+ prev(PctCpuTime,2,0))/3.0
```


### toscalar

### row_cumsum

For calculating the Cumulative sum we must use the function `serialize`.

```
datatable  (a:long)
[1,2,3,4,5,6,7,8,9,10] | serialize cumulativesum= row_cumsum(a)
```

### materialize

Captures the value of a tabular expression for the duration of the query execution so that it can be **referenced multiple times by the query without recalculation**.

https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/materializefunction

