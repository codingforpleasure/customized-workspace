<!--ts-->
   * [mysql common operations](#mysql-common-operations)
      * [mysql admin operations:](#mysql-admin-operations)
         * [Grant access to another person from your local network:](#grant-access-to-another-person-from-your-local-network)

<!-- Added by: gil_diy, at: 2018-09-25T20:07+03:00 -->

<!--te-->

# mysql common operations

## mysql admin operations:
### Grant access to another person from your local network:

** Step #1: **
```sql
CREATE USER '<usrname>'@'<ip_address>' IDENTIFIED WITH mysql_native_password BY '<password>';
```
**Step #2:**

```sql
GRANT ALL PRIVILEGES ON <database_name>.<table_name> TO '<username>'@'<ip-address>';
```


**Tip:**For granting access to **all databases and tables** use `*.*`:

```sql
GRANT ALL PRIVILEGES ON *.* TO '<username>'@'<ip-address>';
```
