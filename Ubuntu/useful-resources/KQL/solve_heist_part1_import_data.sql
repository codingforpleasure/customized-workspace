# SHOW VARIABLES LIKE "secure_file_priv";

create database investigation_heist;
show databases;

use investigation_heist;
drop table server_logs;

CREATE TABLE server_logs (
message_time_s VARCHAR(100),
message VARCHAR(200)
);

show tables;

LOAD DATA INFILE "/var/lib/mysql-files/log_00000.csv"
INTO TABLE server_logs
FIELDS TERMINATED BY ',';

LOAD DATA INFILE "/var/lib/mysql-files/log_00001.csv"
INTO TABLE server_logs
FIELDS TERMINATED BY ',';


# Converting from String to Datetime
CREATE TEMPORARY TABLE server_logs_ready AS 
(select STR_TO_DATE(REPLACE( message_time_s,'"',''), '%Y-%m-%d %H:%i:%s') as message_time_d , message
from server_logs);


select * from server_logs_ready limit 100;

