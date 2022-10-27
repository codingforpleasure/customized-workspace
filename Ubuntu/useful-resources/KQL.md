<!--ts-->
   * [KQL](#kql)
      * [Search](#search)
      * [Where](#where)
      * [take](#take)
      * [count](#count)
      * [summarize](#summarize)
      * [extend](#extend)
      * [project](#project)
      * [distinct](#distinct)
      * [top](#top)

<!-- Added by: gil_diy, at: Thu 27 Oct 2022 18:54:13 IDT -->

<!--te-->

# KQL 

The Kusto Query Language, is used to query Azure's services


## Search


* Will search all columns in the perf table for the value "Memory"

```
Perf
| search "Memory"
```

* Search is not case sesintive by default

```
Perf
| search "memory"
```

* Although you can make it sensitive using a switch

```
Perf
| search kind=case_sensitive "memory"
```

* A better choice is to limit the search to specific tables

search in (Perf, Event, Alert) "Contoso"


* The syntax : `Perf | search "Contoso"`
   Is the same as: `search in (Perf) "Contoso"`


* Within a table, you can search a specific column for the **exact match**

```
Perf
| search CounterName=="Available MBytes"
```


* Within a table, you can search for the **value anywhere** in the text in the specified column.

```
Perf
| search CounterName: "MBytes"
```

* Can also search across all columns using wildcards

 ```
 Perf
 | search "*Bytes*"
 ```



* Begins with Bytes then any text after it

 ```
 Perf
 | search * startswith "Bytes"
 ```


* Ends with Bytes

 ```
 Perf
 | search * endswith "Bytes"
 ```
 
* Ends with Bytes

 ```
 Perf
 | search * endswith "Bytes"
 ```
 
* Begins with Free, and with Bytes, anything between

```
Perf
| search "Free*bytes"
```

* Search can be combined logically
```
Perf
| search "Free*bytes" and ("C:" or "D:")
```

* Search also supports regex in specific column name
```
Perf
| search InstanceName matches regex "[A-Z]:"
```


## Where


```
Perf
| where TimeGenerated >= ago(1h)
```


```
Perf
| where TimeGenerated >= ago(1h) 
   and CounterName == "Bytes Received/sec"
```


```
Perf
| where TimeGenerated >= ago(1h) 
   and CounterName == "Bytes Received/sec"
   and CpunterValue > 0
```


```
Perf
| where TimeGenerated >= ago(1h) 
   and (CounterName == "Bytes Received/sec"
        or
   		CounterName == "% Processor Time"
   		)
```


```
Perf
| where TimeGenerated >= ago(1h) 
   and (CounterName == "Bytes Received/sec"
        or
   		CounterName == "% Processor Time"
   		)
   and CounterValue > 0 
```

same as:

```
Perf
| where TimeGenerated >= ago(1h) 
|  where (CounterName == "Bytes Received/sec"
        or
   		CounterName == "% Processor Time"
   		)
| where CounterValue > 0 
```




* You can simulate search using where, Here it searches all columns the keyword Bytes
```
Perf
| where * has "Bytes"
```

## take

## count

## summarize

## extend

## project

## distinct

## top




## 