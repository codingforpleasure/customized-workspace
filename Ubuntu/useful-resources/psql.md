# PostgreSQL

## Install Postgres

```bash
sudo apt install postgresql postgresql-contrib
```

## Grant access to the new user:

```bash
GRANT ALL PRIVILEGES ON DATABASE db_name to user_name;
```

### Creating user

```bash
sudo -u postgres createuser <username>
```


### Create

```
CREATE DATABASE yourdbname;
CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';
GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;
```

### Connect with user to existed DB

```
psql -U gil -d nvox
```


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

### Drop table

```
DROP TABLE tbl_test_takers_details;
```


```bash
\copy tbl_test_takers_details FROM '/home/gil/PycharmProjects/db_generate_fake_data/df_tbl_test_takers_details.csv' DELIMITER ',' CSV HEADER;
```