<!--ts-->
   * [mysql common operations](#mysql-common-operations)
      * [mysql admin operations:](#mysql-admin-operations)
         * [Grant access to another person from your local network:](#grant-access-to-another-person-from-your-local-network)
         * [Dump csv file into mysql table](#dump-csv-file-into-mysql-table)

<!-- Added by: gil_diy, at: 2018-10-01T03:47+03:00 -->

<!--te-->

# mysql common operations

## mysql admin operations:
### Grant access to another person from your local network:

**Step #1:**
```sql
CREATE USER '<usrname>'@'<ip_address>' IDENTIFIED WITH mysql_native_password BY '<password>';
```
**Step #2:**

```sql
GRANT ALL PRIVILEGES ON <database_name>.<table_name> TO '<username>'@'<ip-address>';
```


**Tip:** For granting access to **all databases and tables** use `*.*`:

```sql
GRANT ALL PRIVILEGES ON *.* TO '<username>'@'<ip-address>';
```

### Dump csv file into mysql table

```sql
LOAD DATA INFILE '<full-path-to-file>'
INTO TABLE <table-name>
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
(<colunm-name1>, <colunm-name2>)
SET id = NULL;
```

**Attention**: In case you're getting an issue such as `Operation not permitted` (with `secure_file_priv`),
change the value of the variable `secure_file_priv`:

Check the variable's value:
```sql
SELECT @@global.secure_file_priv;
```
make sure the variable value is **empty** by inserting last line:

`secure_file_priv=""`

in the file: `/etc/mysql/mysql.conf.d/mysqld.cnf`

and finally simply restart the service:
`sudo service mysql restart`
