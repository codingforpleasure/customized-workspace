<p align="center">
  <img src="images/mysql.png" width="256" title="Some mysql love!">
</p>

<!--ts-->
   * [mysql cheetsheat](#mysql-cheetsheat)
      * [Creating tables](#creating-tables)
      * [Populating data into tables](#populating-data-into-tables)
      * [Joins](#joins)
         * [Inner join](#inner-join)
         * [Left join](#left-join)
         * [Right join](#right-join)
         * [Right outer join](#right-outer-join)
         * [Left outer join](#left-outer-join)
         * [Full outer Join ( Using "Union" Mysql does't have Full outer Join)](#full-outer-join--using-union-mysql-doest-have-full-outer-join)
      * [Aggregate functions](#aggregate-functions)
      * [sub-queries](#sub-queries)
         * [Subqueries in the SELECT clause](#subqueries-in-the-select-clause)
         * [Subqueries in the FROM clause](#subqueries-in-the-from-clause)
         * [Subqueries in the WHERE clause](#subqueries-in-the-where-clause)
         * [Subqueries in the HAVING clause](#subqueries-in-the-having-clause)
         * [LIMIT function](#limit-function)
            * [Example #1: Find the earliest/latest birthday within a calendar year](#example-1-find-the-earliestlatest-birthday-within-a-calendar-year)
            * [Example #2 : Retrieve rows from <strong>middle</strong> result set, use the <strong>two-argument</strong> form of LIMIT.](#example-2--retrieve-rows-from-middle-result-set-use-the-two-argument-form-of-limit)
      * [Table Management](#table-management)
         * [Cloning a whole table](#cloning-a-whole-table)
         * [Cloning part of a table which matches a specific condition:](#cloning-part-of-a-table-which-matches-a-specific-condition)
         * [Create table with columns by specifying the other table's columns:](#create-table-with-columns-by-specifying-the-other-tables-columns)
         * [Copy specific columns to another table:](#copy-specific-columns-to-another-table)
         * [Using temporary tables](#using-temporary-tables)
            * [Add a COLUMN for an existing table   and adding AUTO_INCREMENT](#add-a-column-for-an-existing-table--and-adding-auto_increment)
            * [Changing the order of the columns in a table? (Swapping columns in existed table)](#changing-the-order-of-the-columns-in-a-table-swapping-columns-in-existed-table)
            * [Rename a column in a existed table](#rename-a-column-in-a-existed-table)
         * [Generating unique table names](#generating-unique-table-names)
   * [Partitions](#partitions)
      * [(a) Range partitioning](#a-range-partitioning)
      * [(b) List column partitioning](#b-list-column-partitioning)
      * [(c) List partitioning](#c-list-partitioning)
      * [(d) Columns range partitioning](#d-columns-range-partitioning)
      * [(e) Hash partitioning](#e-hash-partitioning)
      * [(f) Composite partitioning (Subpartitioning)](#f-composite-partitioning-subpartitioning)
   * [Indexes](#indexes)
      * [B-Tree indexes](#b-tree-indexes)
         * [Create table with index](#create-table-with-index)
         * [Create indexing on existing table](#create-indexing-on-existing-table)
         * [Drop indexing on existing table](#drop-indexing-on-existing-table)
   * [INFORMATION_SCHEMA](#information_schema)
      * [Finding specific column among all tables](#finding-specific-column-among-all-tables)
      * [Show tables schema of specific database](#show-tables-schema-of-specific-database)
      * [Get table name and the table_type as : system_view, base table, view](#get-table-name-and-the-table_type-as--system_view-base-table-view)
      * [Get the number of tables in the database](#get-the-number-of-tables-in-the-database)
      * [Finding all partitions](#finding-all-partitions)
      * [Get the index information for a given table](#get-the-index-information-for-a-given-table)
   * [User-Defined Functions (UDF)](#user-defined-functions-udf)
      * [Create function](#create-function)
      * [Delete function](#delete-function)
      * [Execute function](#execute-function)
   * [User-Defined Variables (UDV)](#user-defined-variables-udv)
      * [Example of using Variables](#example-of-using-variables)
   * [REGEXP](#regexp)
      * [List the books names which starts with specific word](#list-the-books-names-which-starts-with-specific-word)
      * [List the books names which ends with specific word](#list-the-books-names-which-ends-with-specific-word)
      * [Number of books we have in the "book_name_in_english" column](#number-of-books-we-have-in-the-book_name_in_english-column)
      * [Cutting the user mail address to pieces - by using "SUBSTRING_INDEX" function](#cutting-the-user-mail-address-to-pieces---by-using-substring_index-function)
      * [Here we used the REGEXP and the like function in the select statement  - very nice](#here-we-used-the-regexp-and-the-like-function-in-the-select-statement----very-nice)

<!-- Added by: gil, at: 2018-12-31T16:09+02:00 -->

<!--te-->

# mysql cheetsheat


## Creating tables

```sql
CREATE TABLE profile
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	birth DATE,
	color ENUM('blue','red','green','brown','black','white'),
	foods SET('lutefisk','burrito','curry','eggroll','fadge','pizza'),
	cats INT,
	PRIMARY KEY (id)
);
```
Explanation between the difference between "ENUM" to "SET":

**ENUM** = radio fields (may only choose one)

**SET** = checkbox fields (may choose multiple)


## Populating data into tables

## Joins

<p align="center">
  <img src="images/tables_author_genre.png" width="500" title="Some mysql love!">
</p>

### Inner join
```sql
	select author_name,genre_name
	from author_tb
	inner join genre_tb
	on author_tb.genre_id = genre_tb.genre_id;
```
**output**

author_name | genre_name
----- | --------- 
shay cohen	|Drama
Gil cohen	|Romance
gil cohen	|Science fiction
Yossi Levi	|Urban fiction
shay cohen	|Drama


### Left join
```sql
	select *
	from author_tb
	left join genre_tb
	on author_tb.genre_id = genre_tb.genre_id;
```
**output**

author_name | genre_id | genre_id | genre_name
----- | ---|---|--- 
shay cohen|	|7	|7	|Drama
Gil cohen|	8	|8	|Romance
gil cohen|	4	|4	|Science fiction
Yossi Levi|	1	|1	|Urban fiction
shay cohen|	7	|7	|Drama
Omri Ror|	22	|	|

### Right join
```sql
	Select *
	from author_tb
	right join genre_tb
	on author_tb.genre_id = genre_tb.genre_id;
```
**output**

author_name | genre_id | genre_id | genre_name
----- | ---|---|--- 
shay cohen	|7	|7	|Drama
Gil cohen	|8	|8	|Romance
gil cohen	|4	|4	|Science fiction
Yossi Levi	|1	|1	|Urban fiction
shay cohen	|7	|7	|Drama
			||	2	|Tragedy
			||	3	|Fantasy
			||	5	|Adventure
			||	6	|Mystery
			||	9	|Horror
			||	10	|Dystopia
			||	11	|Action


### Right outer join
```sql 
	select *
	from author_tb
	right outer join genre_tb
	on author_tb.genre_id = genre_tb.genre_id
	where author_tb.author_name is Null;
```

**output**

author_name | genre_id | genre_id | genre_name
----- | ---|---|--- 
	||2	|Tragedy
	||3	|Fantasy
	||5	|Adventure
	||6	|Mystery
	||9	|Horror
	||10	|Dystopia
	||11	|Action


### Left outer join
```sql  
	select *
	from author_tb
	left outer join genre_tb
	on author_tb.genre_id = genre_tb.genre_id
	Where genre_tb.genre_name is Null;
```

**output**

author_name | genre_id | genre_id | genre_name
----- | ---|---|--- 
Omri Ror |	22	||	

### Full outer Join ( Using "Union" Mysql does't have Full outer Join)
```sql
	select *
	from author_tb
	left join genre_tb
	on author_tb.genre_id = genre_tb.genre_id
	Union
	select *
	from author_tb
	right join genre_tb
	on author_tb.genre_id = genre_tb.genre_id;
```

## Aggregate functions
```sql
SELECT publisher,
      COUNT(pages) AS n,
      IFNULL(SUM(pages),0) AS total,
      IFNULL(AVG(pages),0) AS average,
      IFNULL(MAX(pages),'Unknown') AS highest
FROM simania_books_table
WHERE pages IS not  NULL and year_published = '2018'
GROUP BY publisher
order by n desc;
```
## sub-queries

### Subqueries in the SELECT clause 


### Subqueries in the FROM clause 
```sql
select *
from (select *
      from Book_details
      where author_id > 5) as book_dit;
```
### Subqueries in the WHERE clause
```sql
select *
from Book_details
where book_id in (select book_id
                  from Book_details
                  WHERE book_id > 7);
```
### Subqueries in the HAVING clause

### LIMIT function
When should we use the "LIMIT"?
In case we want only certain rows from a result set, such as the first row, the last five rows, or rows
21 through 40. 
Here we will Use a LIMIT with an ORDER BY.

#### Example #1: Find the earliest/latest birthday within a calendar year
```sql
SELECT name, DATE_FORMAT(birth,'%m-%d') AS birthday
FROM profile 
ORDER BY birthday LIMIT 1;
```

#### Example #2 : Retrieve rows from **middle** result set, use the **two-argument** form of LIMIT. 

First Argument indicates how many rows to skip
Second Argument indicates how many to rows to retrieve
**What is the third-smallest or third-largest value?**
```sql
SELECT * 
FROM profile 
ORDER BY birth LIMIT 2,1;
```
Example number 3 :

Calculating LIMIT Values from Expressions -- ask gil page 125

##  Table Management

### Cloning a whole table
<!-- ```sql
CREATE TABLE new_table LIKE original_table; 
``` -->
Cloning the contents to be the same as the original table:
```sql
INSERT INTO new_table SELECT * FROM original_table;; 
```

### Cloning part of a table which matches a specific condition:
If I want to copy part of the table use the "where":
```sql
CREATE TABLE mail2 LIKE mail;
INSERT INTO mail2 SELECT * FROM mail WHERE srcuser = 'barb';
```
<!-- **Important to remember:** --
Using "CREATE TABLE … LIKE"  :

1) Doesn't copy *foreign key definitions* 

2) Doesn't copy any *DATA DIRECTORY* 

3) Doesn't copy *INDEX DIRECTORY table options* that the table might use saving a Query Result in a Table -->

### Create table with columns by specifying the other table's columns:
```sql
CREATE TABLE book_name_tb SELECT book_id,title  FROM simania_books_table;
```

### Copy specific columns to another table:
```sql
INSERT INTO dst_tbl(column1_dst, column2_dst) SELECT val, name FROM src_tbl;
```


### Using temporary tables

#### Add a COLUMN for an existing table + and adding AUTO_INCREMENT 
```sql
ALTER TABLE foreign_author_tb
ADD COLUMN foreign_author_id INT AUTO_INCREMENT PRIMARY KEY;
```
The "AUTO_INCREMENT" would  work only after adding a PRIMARY KEY over the specific column "foreign_author_id"

#### Changing the order of the columns in a table? (Swapping columns in existed table)
```sql
ALTER TABLE Employees MODIFY COLUMN empName VARCHAR(50) AFTER department;
```
#### Rename a column in a existed table
```sql
ALTER TABLE foreign_author_tb RENAME COLUMN author TO author_name;
```

### Generating unique table names

# Partitions

## (a) Range partitioning

Selects a partition by determining if the partitioning **key is inside a certain range**. An example could be a partition for all rows where the column zipcode has a value between 70000 and 79999.

```sql
CREATE TABLE employees
(
  id         int,#unsigned auto_increment primary key,
  first_name VARCHAR(30),
  hired      DATE NOT NULL DEFAULT '1970-01-01',
  separated  DATE NOT NULL DEFAULT '2001-12-31',
  store_id   INT
)
  PARTITION BY RANGE (year(separated))(
    PARTITION p0 VALUES LESS THAN (1968),
    PARTITION p1 VALUES LESS THAN (1981),
    PARTITION p2 VALUES LESS THAN (2001),
    PARTITION p3 VALUES LESS THAN MAXVALUE
    );
```
```sql
INSERT INTO employees (first_name, hired, separated, store_id)
  VALUES
  ('shay', '1970-01-01', '1979-01-01', 11),
  ('Gil', '1949-01-01', '1959-01-01', 4),
  ('Yossi', '1949-01-01', '1967-01-01', 7),
  ('Omri', '1989-01-01', '1998-01-01', 5),
  ('Michal', '1984-01-01', '1989-06-01', 12);
```
```sql
select * from employees partition(p0);
```


## (b) List column partitioning

This is a variant of LIST partitioning BUT:
1. Enables the use of **multiple columns** as partition keys
2. The columns of data types **can be other than integer types** to be used as partitioning columns.

## 
```sql
CREATE TABLE employee_4
(
  id           INT,
  first_name   VARCHAR(25),
  joining_year INT,
  designation  VARCHAR(100)
  #age VARCHAR(10)
)
  PARTITION BY LIST COLUMNS (joining_year, designation) (
    PARTITION pRegion_1 VALUES IN ((2008, 'Sustainability Analyst'), (2009, 'Accounting Assistant')),
    PARTITION pRegion_2 VALUES IN ((2007, 'Linux Engineer'), (2003, 'Application Developer')));
```

```sql

INSERT INTO employee_4 (id, first_name, joining_year, designation)
  VALUES
  (5, 'shay', '2008', 'Sustainability Analyst'),
  (7, 'Gil', '2009', 'Accounting Assistant'),
  (22, 'Yossi', '2003', 'application Developer'),
  (22, 'Yossi', '2007', 'Linux Engineer');
```
```sql
select *
from employee_4 partition (pRegion_2);
```

## (c) List partitioning

A partition is assigned a list of values. If the partitioning **key has one of these values**, the partition is chosen. For example, all rows where the column Country is either Iceland, Norway, Sweden, Finland or Denmark could build a partition for the Nordic countries.


**Attention:** In MySQL 8.0, it is possible to match against **only a list of integers** 

```sql
CREATE TABLE employees_2 (
    id INT ,#NOT NULL,
    first_name VARCHAR(30),
    hired DATE NOT NULL DEFAULT '1970-01-01',
    separated DATE NOT NULL DEFAULT '9999-12-31',
    store_id INT
)
PARTITION BY LIST(store_id) (
    PARTITION pNorth VALUES IN (3,5,6,9,17),
    PARTITION pEast VALUES IN (1,2,10,11,19,20),
    PARTITION pWest VALUES IN (4,12,13,14,18),
    PARTITION pCentral VALUES IN (7,8,15,16)
);
```

```sql
INSERT INTO employees_2 (id,first_name, hired, separated, store_id)
  VALUES
  (5,'shay', '1970-01-01', '1979-01-01', 11),
  (7,'Gil', '1949-01-01', '1959-01-01', 4),
  (22,'Yossi', '1949-01-01', '1967-01-01', 7),
  (1,'Omri', '1989-01-01', '1998-01-01', 5),
  (14,'Michal', '1984-01-01', '1989-06-01', 12);
```
```sql
select * from employees_2 partition(pWest);
```

## (d) Columns range partitioning
```sql
CREATE TABLE employees_3 (
    id INT ,
    first_name VARCHAR(30),
    hired DATE NOT NULL DEFAULT '1970-01-01',
    separated DATE NOT NULL DEFAULT '9999-12-31',
    store_id INT
)
PARTITION BY RANGE COLUMNS(id,store_id)(
PARTITION partition0 VALUES LESS THAN (3,6),
PARTITION partition1 VALUES LESS THAN (6,12),
PARTITION partition2 VALUES LESS THAN (12,18),
PARTITION partition3 VALUES LESS THAN (MAXVALUE, MAXVALUE));
```
```sql
INSERT INTO employees_3 (id,first_name, hired, separated, store_id)
  VALUES
  (5,'shay', '1970-01-01', '1979-01-01', 11),
  (7,'Gil', '1949-01-01', '1959-01-01', 4),
  (22,'Yossi', '1949-01-01', '1967-01-01', 7),
  (1,'Omri', '1989-01-01', '1998-01-01', 5),
  (14,'Michal', '1984-01-01', '1989-06-01', 12);
```
```sql
select *
from employees_3 partition(partition1);
```

## (e) Hash partitioning

Applies a hash function to some attribute that yields the partition number. This strategy allows exact-match queries on the selection attribute to be processed by exactly one node and all other queries to be processed by all the nodes in parallel.

```sql
CREATE TABLE employees_5 (
    id INT ,#NOT NULL,
    first_name VARCHAR(30),
    hired DATE NOT NULL DEFAULT '1970-01-01',
    separated DATE NOT NULL DEFAULT '9999-12-31',
    store_id INT
)
PARTITION BY HASH(store_id)
PARTITIONS 4;
```

```sql
INSERT INTO employees_5 (id,first_name, hired, separated, store_id)
  VALUES
  (5,'shay', '1970-01-01', '1979-01-01', '11'),
  (7,'Gil', '1949-01-01', '1959-01-01', '4'),
  (22,'Yossi', '1949-01-01', '1967-01-01', '7'),
  (1,'Omri', '1989-01-01', '1998-01-01', '5'),
  (14,'Michal', '1984-01-01', '1989-06-01', '12');
```
**Attention:** for retrieving the partitions names in all tables you can use the INFORMATION SCHEMA.
including a [link to the header](#finding-all-partitions). 
By default the partition names are given as: p0,..,pn


```sql
select *
from  employees_5 partition(p0);
```



## (f) Composite partitioning (Subpartitioning)

Allows for certain combinations of the above partitioning schemes, by for example first applying a range partitioning and then a hash partitioning

```sql
CREATE TABLE purchase_tb (id INT, purchased DATE)
PARTITION BY RANGE( YEAR(purchased) )
SUBPARTITION BY HASH( TO_DAYS(purchased) )
SUBPARTITIONS 2 (
PARTITION p0 VALUES LESS THAN (1990),
PARTITION p1 VALUES LESS THAN (2000),
PARTITION p2 VALUES LESS THAN MAXVALUE
);
```
```sql
INSERT INTO purchase_tb (id,purchased)
  VALUES
  (1, '2001-01-24'),
  (2, '1999-11-21'),
  (3, '1989-10-11'),
  (4, '2018-09-18');
```

```sql
select *
from purchase_tb partition (p1);
```


# Indexes

<!-- ## Sparse indexes

## Dense indexes

## Hash indexes -->

## B-Tree indexes

For indexing a database mysql can use an underline structure called b-tree.
The b-tree creates under the hood a tree of **intermediate nodes** which assist the engine to retrieve the relevant row(s). at the bottom of the tree are the **leafs of the tree which are the actual data rows**, each of the leaf node is also known as a **page (8KB)** in sql server. The data is stored in **sorted order by cluster key**. by default the primary key of a table will be the cluster key in sql server.


<p align="center">
  <img src="images/clustered-index-structure.png" width="700" title="Some mysql love!">
</p>

* In case we execute a query on a table which **was not indexed**, the operation will be **costly (CPU,IO)**  - this scan is named: **Full Scan (All)**.

* In case we execute a query on a table which **was indexed with btree**, the operation will be much more efficient - this scan is named: **Unique Index scan (ref)**.


### Create table with index
```sql
CREATE TABLE books_table
(
  id                 int unsigned auto_increment primary key,
  title              varchar(200),
  author             varchar(200),
  publisher          varchar(100),
  INDEX index_title(title)
);
```

**Attention:** in the round brackets comes the column'(s) names.

Moreover you can composite(group) index on few columns together, i.e:

```sql
INDEX index_composite(title,author)
```

### Create indexing on existing table

```sql
CREATE INDEX index_title ON books_table(title);
```
### Drop indexing on existing table
```sql
DROP INDEX index_title ON books_table;
```



# INFORMATION_SCHEMA

## Finding specific column among all tables

```sql
SELECT TABLE_NAME
FROM   AdventureWorks2012_Data.INFORMATION_SCHEMA.COLUMNS
WHERE  COLUMN_NAME = 'BusinessEntityID'
```

## Show tables schema of specific database
```sql
SELECT * ##`table_schema`
FROM `information_schema`.`tables`
WHERE table_schema = 'db_playground';
```

## Get table name and the table_type as : system_view, base table, view
```sql
SELECT   TABLE_NAME, TABLE_TYPE
FROM     INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_NAME;
```

## Get the number of tables in the database
```sql
SELECT count(*) AS totalTables
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'db_playground';
```

## Finding all partitions 

```sql
SELECT TABLE_NAME,PARTITION_NAME,TABLE_ROWS,AVG_ROW_LENGTH,DATA_LENGTH
FROM INFORMATION_SCHEMA.PARTITIONS
where PARTITION_NAME <> "";
```

## Get the index information for a given table

```sql
SELECT DISTINCT TABLE_NAME,INDEX_NAME
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_NAME = 'author_name';
```

# User-Defined Functions (UDF)
## Create function
```sql
DELIMITER |
CREATE FUNCTION my_dummy_function(author_id INT)
  RETURNS VARCHAR(10)
  DETERMINISTIC
BEGIN
  DECLARE rv_in_letters VARCHAR(10);
  IF author_id = 1
  THEN
    SET rv_in_letters = 'One';
  ELSEIF author_id = 2
  THEN
    SET rv_in_letters = 'Two';
  ELSE
    SET rv_in_letters = 'Larger';
  END IF;
  RETURN rv_in_letters;
END |
```
## Delete function
```sql
drop function my_dummy_function;
```

## Execute function
```sql
SELECT book_id, book_name,author_id, my_dummy_function(author_id)
FROM book_info;
```

# User-Defined Variables (UDV)
## Example of using Variables

```sql
SELECT @min_year_published:=MIN(year_published),@max_year_published:=MAX(year_published)
FROM simania_books_table;

SELECT title , author , pages , year_published
FROM simania_books_table
WHERE year_published=@min_year_published OR
      year_published=@max_year_published;
```



# REGEXP
## List the books names which starts with specific word 
```sql
SELECT book_name_in_english
FROM simania_and_crawler_foreign_tb
WHERE book_name_in_english REGEXP '^rain';
```
*Pay attention it's case insensitive

## List the books names which ends with specific word
```sql
SELECT book_name_in_english
FROM simania_and_crawler_foreign_tb
WHERE book_name_in_english REGEXP 'God$';
```

## Number of books we have in the "book_name_in_english" column 
```sql
SELECT distinct (book_name_in_english)
FROM simania_and_crawler_foreign_tb
WHERE book_name_in_english REGEXP '[a-z]'
```


## Cutting the user mail address to pieces - by using "SUBSTRING_INDEX" function 
```sql
SET @email = 'shaycohen@hotmail.com';
SELECT @email,
SUBSTRING_INDEX(@email,'@',1) AS user,
SUBSTRING_INDEX(@email,'@',-1) AS host;
```

## Here we used the REGEXP and the like function in the select statement  - very nice
```sql
SELECT book_name_in_hebrew, book_name_in_hebrew LIKE 'בית%', book_name_in_hebrew REGEXP 'בית'
FROM simania_and_crawler_foreign_tb;
```


