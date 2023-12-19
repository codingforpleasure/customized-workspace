
- [PostgreSQL](#postgresql)
  - [Install Postgres](#install-postgres)
  - [Install autocomplete](#install-autocomplete)
  - [Grant access to the new user:](#grant-access-to-the-new-user)
    - [Creating user](#creating-user)
    - [Restart service](#restart-service)
    - [Create](#create)
    - [Use Password Authentication](#use-password-authentication)
    - [Connect with user to existed DB](#connect-with-user-to-existed-db)
    - [List all databases](#list-all-databases)
    - [List all tables in the current database](#list-all-tables-in-the-current-database)
    - [Create table](#create-table)
    - [Drop database](#drop-database)
    - [Remove all rows in table](#remove-all-rows-in-table)
    - [Drop table](#drop-table)
    - [Run script](#run-script)


# PostgreSQL

## Install Postgres

```bash
sudo apt install postgresql postgresql-contrib
```

## Install autocomplete

```bash
sudo apt-get install pgcli
```


After installing:

```
pgcli <local database>
```


[Reference](https://github.com/dbcli/pgcli)

## Grant access to the new user:

```bash
GRANT ALL PRIVILEGES ON DATABASE db_name to user_name;
```

### Creating user

```bash
sudo -u postgres createuser <username>
```

### Restart service

```bash
sudo /etc/init.d/postgresql restart
```

### Create

```
CREATE DATABASE yourdbname;
CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';
GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;
```

### Use Password Authentication


you can use password authentication. This involves creating a PostgreSQL user with a password and configuring your connection accordingly.

Open the sudo nano /etc/postgresql/{version}/main/pg_hba.conf

Add a line for your user with md5 authentication. For example:

```
local   all             my_username                           md5
```
Replace my_username with the PostgreSQL username you are using.

Save the file and restart PostgreSQL:

```
sudo service postgresql restart
```

### Connect with user to existed DB

```
psql -U gil -d nvox
```

### List all databases

`\l`

### List all tables in the current database

Once you are inside the psql interactive terminal, you can use the 

`\dt`


### Create table

```bash
CREATE TABLE tbl_test_takers_details (
    uid VARCHAR(10),
    private_name TEXT,
    family_name TEXT,
    gender TEXT,
    age SMALLINT CHECK (age >= 0),
    phone_number TEXT,
    email TEXT,
    registered_timestamp TIMESTAMPTZ,
    is_child BOOLEAN
);
```

### Drop database

```
drop database my_db;
```

### Remove all rows in table

```
DELETE FROM examinee_child_details;
```


### Drop table

```
DROP TABLE tbl_test_takers_details;
```


```bash
\copy tbl_test_takers_details FROM '/home/gil/PycharmProjects/db_generate_fake_data/df_tbl_test_takers_details.csv' DELIMITER ',' CSV HEADER;
```


### Run script

```
psql -U gil -d nvox -a -f create_tables.pgsql
```