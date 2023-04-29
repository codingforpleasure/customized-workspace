use investigation_heist;

select * from server_logs_ready;


select * from logged_in_table;

CREATE TEMPORARY TABLE logged_in_table AS  (SELECT * FROM server_logs_ready WHERE message LIKE '%logged in%');
CREATE TEMPORARY TABLE logged_out_table AS  (SELECT * FROM server_logs_ready WHERE message LIKE '%logged out%');
CREATE TEMPORARY TABLE left_channel_table AS  (SELECT * FROM server_logs_ready WHERE message LIKE '%left the channel%');
CREATE TEMPORARY TABLE joined_channel_table AS  (SELECT * FROM server_logs_ready WHERE message LIKE '%joined the channel%');
CREATE TEMPORARY TABLE user_to_channel_table AS  (SELECT * FROM server_logs_ready WHERE message LIKE '%sent message to the channel%');

select * from left_channel_table limit 100;

# SET @myTableVariable = (SELECT message FROM server_logs limit 100);

######################################################################

CREATE TEMPORARY TABLE logged_in_table AS 
(SELECT message_time_d,
	   REGEXP_SUBSTR(message, "'(\\w+)'", 1, 1) AS user_id ,
       REGEXP_SUBSTR(message, "'([0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)'", 1, 1)  AS user_ip
from logged_in_table);

select * from logged_in_table;

######################################################################

CREATE TEMPORARY TABLE logged_out_table AS 
(SELECT message_time_d,
	   REGEXP_SUBSTR(message, "'(\\w+)'", 1, 1) AS user_id
from logged_out_table);

select * from logged_out_table;

######################################################################

CREATE TEMPORARY TABLE left_channel_table AS 
(SELECT message_time_d,
		REGEXP_SUBSTR(message, "'(\\w+)'", 1, 1) AS user_id ,
        REGEXP_SUBSTR(message, "'(\\w+)'", 1, 2)  AS channel_id
from left_channel_table);

select * from left_channel_table;

######################################################################

CREATE TEMPORARY TABLE joined_channel_table AS 
(SELECT message_time_d,
		REGEXP_SUBSTR(message, "'(\\w+)'", 1, 1) AS user_id ,
        REGEXP_SUBSTR(message, "'(\\w+)'", 1, 2)  AS channel_id
from left_channel_table);

select * from joined_channel_table;

######################################################################

CREATE TEMPORARY TABLE user_to_channel_table_final AS 
(SELECT message_time_d,
		REGEXP_SUBSTR(message, "'(\\w+)'", 1, 1) AS user_id ,
        REGEXP_SUBSTR(message, "'(\\w+)'", 1, 2)  AS channel_id
from user_to_channel_table);

select * from user_to_channel_table;

######################################################################