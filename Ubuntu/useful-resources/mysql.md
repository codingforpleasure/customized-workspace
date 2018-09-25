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
**CREATE USER** &lt;'usrname'&gt; **@** '&lt;ip_address&gt;' **IDENTIFIED WITH mysql_native_password BY** &lt;'password&gt;';

**Step #2:**
**GRANT ALL PRIVILEGES ON** &lt;database-name&gt;.&lt;table-name&gt; TO '&lt;username&gt;'@'&lt;ip-address&gt;';




**Tip:** To grant access to **all databases and tables** use:

**GRANT ALL PRIVILEGES ON** ** \*.\* ** **TO** '&lt;username&gt;' **@** '&lt;ip-address&gt;';
