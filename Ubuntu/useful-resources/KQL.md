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

<!-- Added by: gil_diy, at: Thu 20 Oct 2022 17:35:23 IDT -->

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

## take

## count

## summarize

## extend

## project

## distinct

## top




## 

{
  "sessionId": "8c09b3903a27454cb01298fd0cb0c64a",
  "errors": [
    {
      "errorMessage": "AADSTS16000: User account '{EmailHidden}' from identity provider 'live.com' does not exist in tenant 'Microsoft Services' and cannot access the application '6e00b31f-06d4-4c93-8b14-e08b568b4a04'(Microsoft_OperationsManagementSuite_Workspace) in that tenant. The account needs to be added as an external user in the tenant first. Sign out and sign in again with a different Azure Active Directory user account.\r\nTrace ID: afec9f3f-7bee-4705-81ac-0fcf94ab0e00\r\nCorrelation ID: 0542114b-d2ac-4f42-aafa-9205f3d0b783\r\nTimestamp: 2022-10-20 13:52:49Z",
      "clientId": "6e00b31f-06d4-4c93-8b14-e08b568b4a04",
      "scopes": [
        "ca7f3f0b-7d91-482c-8e09-c5d840d0eac5/.default"
      ]
    },
    {
      "errorMessage": "AADSTS16000: User account '{EmailHidden}' from identity provider 'live.com' does not exist in tenant 'Microsoft Services' and cannot access the application '6e00b31f-06d4-4c93-8b14-e08b568b4a04'(Microsoft_OperationsManagementSuite_Workspace) in that tenant. The account needs to be added as an external user in the tenant first. Sign out and sign in again with a different Azure Active Directory user account.\r\nTrace ID: f75eb384-6ea9-44fd-810c-58bf492b0e00\r\nCorrelation ID: cf6d2325-50a4-4d5b-a68c-41685eb6b69a\r\nTimestamp: 2022-10-20 13:52:49Z",
      "clientId": "6e00b31f-06d4-4c93-8b14-e08b568b4a04",
      "scopes": [
        "4c011fb8-5afd-4a16-9283-8bee6e25cb33/.default"
      ]
    }
  ]
}

