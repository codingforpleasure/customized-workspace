create database investigation_heist;
show databases;
use investigation_heist;

drop table server_logs;

CREATE TABLE server_logs (
message_time VARCHAR(100),
message VARCHAR(200)
);

show tables;
# SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE "/var/lib/mysql-files/log_00001.csv"
INTO TABLE server_logs
FIELDS TERMINATED BY ',';

select * from server_logs limit 100;

CREATE TEMPORARY TABLE logged_in_table AS  (SELECT * FROM server_logs WHERE message LIKE '%logged in%');
CREATE TEMPORARY TABLE logged_out_table AS  (SELECT * FROM server_logs WHERE message LIKE '%logged out%');
CREATE TEMPORARY TABLE left_channel_table AS  (SELECT * FROM server_logs WHERE message LIKE '%left the channel%');
CREATE TEMPORARY TABLE joined_channel_table AS  (SELECT * FROM server_logs WHERE message LIKE '%joined the channel%');
CREATE TEMPORARY TABLE user_to_channel_table AS  (SELECT * FROM server_logs WHERE message LIKE '%sent message to the channel%');

select * from left_channel_table limit 100;

# SET @myTableVariable = (SELECT message FROM server_logs limit 100);

######################################################################

CREATE TEMPORARY TABLE logged_in_table_final AS 
(SELECT message_time,
	   REGEXP_SUBSTR(message, "'(\\w+)'", 1, 1) AS user_id ,
       REGEXP_SUBSTR(message, "'([0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)'", 1, 1)  AS user_ip
from logged_in_table);

select * from logged_in_table_final;

######################################################################

CREATE TEMPORARY TABLE logged_out_table_final AS 
(SELECT message_time,
	   REGEXP_SUBSTR(message, "'(\\w+)'", 1, 1) AS user_id
from logged_out_table);

select * from logged_out_table_final;

######################################################################

CREATE TEMPORARY TABLE left_channel_table_final AS 
(SELECT message_time,
		REGEXP_SUBSTR(message, "'(\\w+)'", 1, 1) AS user_id ,
        REGEXP_SUBSTR(message, "'(\\w+)'", 1, 2)  AS channel_id
from left_channel_table);

select * from left_channel_table_final;

######################################################################

CREATE TEMPORARY TABLE joined_channel_table_final AS 
(SELECT message_time,
		REGEXP_SUBSTR(message, "'(\\w+)'", 1, 1) AS user_id ,
        REGEXP_SUBSTR(message, "'(\\w+)'", 1, 2)  AS channel_id
from left_channel_table);

select * from joined_channel_table_final;

######################################################################

CREATE TEMPORARY TABLE user_to_channel_table_final AS 
(SELECT message_time,
		REGEXP_SUBSTR(message, "'(\\w+)'", 1, 1) AS user_id ,
        REGEXP_SUBSTR(message, "'(\\w+)'", 1, 2)  AS channel_id
from user_to_channel_table);

select * from user_to_channel_table_final;

######################################################################