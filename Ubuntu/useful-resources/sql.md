<!--ts-->
   * [SQL](#sql)
      * [Show all databases](#show-all-databases)
      * [Choose database to work with:](#choose-database-to-work-with)
      * [Show all tables in current database:](#show-all-tables-in-current-database)
      * [Group by and IN](#group-by-and-in)
      * [Order by](#order-by)
      * [Distinct](#distinct)
      * [Aggreagtion functions](#aggreagtion-functions)

<!-- Added by: gil_diy, at: 2019-11-08T13:43+02:00 -->

<!--te-->


# SQL

## Show all databases
```sql
SELECT name FROM master.sys.databases
```

## Choose database to work with:
```sql
use <DATABASE NAME>
```

## Show all tables in current database:
```sql
SELECT * FROM INFORMATION_SCHEMA.TABLES;
```

```SQL
SELECT ID, AVG(CAST(Sessions AS FLOAT)) AS average_sessions  FROM Daily_activity
GROUP By ID
ORDER by ID;
```

## Group by and IN
```SQL
SELECT CategoryID, AVG(UnitPrice) as "Average price per category"
FROM Products
WHERE CategoryID IN (1,2,6,8)
GROUP BY CategoryID;
```
## Order by
```SQL
SELECT * FROM Employees
ORDER BY BirthDate DESC;
```

## Distinct
```SQL
SELECT count(DISTINCT CategoryID)
FROM Products;
```


## Aggreagtion functions
Function | Title2
------------|-----
COUNT |
AVG |
MAX |

```SQL
SELECT COUNT(*) FROM Customers
WHERE City!='London';
```
