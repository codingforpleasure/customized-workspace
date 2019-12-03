
Table of Contents
=================

<!--ts-->
   * [Table of Contents](#table-of-contents)
      * [Cron tips and tricks](#cron-tips-and-tricks)
         * [Basic commands in crontab](#basic-commands-in-crontab)
         * [Delving into the cron table:](#delving-into-the-cron-table)
         * [Useful examples:](#useful-examples)
            * [Example #1: Run cronjob on specific times](#example-1-run-cronjob-on-specific-times)
            * [Example #2: Creating ranges](#example-2-creating-ranges)
            * [Example #3: Run a cron job on every minute](#example-3-run-a-cron-job-on-every-minute)
            * [Example #4: Run a cron job on every hour](#example-4-run-a-cron-job-on-every-hour)
            * [Example #5: Run a cron job on every five minutes](#example-5-run-a-cron-job-on-every-five-minutes)
            * [Example #6: Run a cron job on 09:30 and on 17:30, from Sunday To Thursday](#example-6-run-a-cron-job-on-0930-and-on-1730-from-sunday-to-thursday)
            * [Example #7: Run a cron job every 90 minutes](#example-7-run-a-cron-job-every-90-minutes)
            * [Example #8: Run a cron job on 21:30 only on the last day of each month](#example-8-run-a-cron-job-on-2130-only-on-the-last-day-of-each-month)
            * [Example #9: Setting environment properly for resolving crontab issues](#example-9-setting-environment-properly-for-resolving-crontab-issues)
            * [Example #10: Run cronjob in random times with step size of 4 hours](#example-10-run-cronjob-in-random-times-with-step-size-of-4-hours)
         * [Debugging cron jobs in failures](#debugging-cron-jobs-in-failures)
            * [Approach #1: Writing to a logfile](#approach-1-writing-to-a-logfile)
            * [Approach #2:](#approach-2)

<!-- Added by: gil_diy, at: 2019-12-04T00:06+02:00 -->

<!--te-->


## Cron tips and tricks

### Basic commands in crontab

Purpose | command example
------------ | -------------
List cron table entries | crontab -l
Edit crontab via your editor (according to `VISUAL` or `EDITOR` environment variables) | crontab -e
Remove the crontab | crontab -r
Edit another user crontab | sudo crontab -u &lt;username&gt;
re-run cron daemon | sudo service cron start

**you can also set your editor by `select-editor` command.**

**The cron jobs are ususally get logged into: `/var/log/syslog`**

### Delving into the cron table:

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
0 - 59 |  0 - 23 | 1 - 31 | 1 - 12 or JAN - DEC | 0 - 7 Or SUN - SAT


Another accaptable value in all those fields are asterisk (\*),
for example:


if asterisk will appear in the minute field so it will presents
 _**all**_ minutes between 0 to 59.


### Useful examples:
#### Example #1: Run cronjob on specific times

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
12,46 |  1,2,20 | 7,29 | MAR,AUG | 3,5 | job #1

Explanation:
The cron job will run on the following days,

March 7th and 29th
August 7th and 29th

on the folowing hours:
01:12, 01:46
02:12, 02:46
20:12, 20:46

#### Example #2: Creating ranges

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
34-56 |  6-12 | 7-14 | 3-8 | MON-FRI | job #1


#### Example #3: Run a cron job on every minute

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
\* |  * | * | * | * | job #1

#### Example #4: Run a cron job on every hour

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
0 |  * | * | * | * | job #1

#### Example #5: Run a cron job on every five minutes

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
*/5 |  * | * | * | * | job #1

*Pay attention: here I have used a step value of 5 which generates the following series:*
0,5,10,15,20,25,30,35,40,45,50,55

*make sure the step value you pick  devides into the range you picked without any remainders, cause otherwise you'll get uneven intervals.*


#### Example #6: Run a cron job on 09:30 and on 17:30, from Sunday To Thursday

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
30 |  9,17 | * | * | SUN-THU | job #1

#### Example #7: Run a cron job every 90 minutes

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
0 |  */3 | * | * | * | job #1
30 |  1/3 | * | * | * | job #1


The first entry will start at midnight:    0		       3		6		9		12		15		18		21

The second entry will start at midnight with offset of 90 minutes from our first cron job entry:
  01:30	  04:30	07:30	10:30	13:30	16:30	19:30	22:30

#### Example #8: Run a cron job on 21:30 only on the last day of each month

This task is a bit tricky since there are months which consist of 28/29/30/31 days, so i'll be adding an if statement condition before executing the shell script.

Minute | Hour | Date | Month | DOW   | command
------|----- | ----|-----|------|---------
30 |  21 | 28-31 | * | * | `test $(date -d tomorrow +%d) -eq 1 && /tmp/myscript.sh`


#### Example #9: Setting environment properly for resolving crontab issues

There are cases were crontab might fail although when you execute the script manually in runs flawlessly, so to figure it out what's wrong:
you can simulate the exact environment by:

`env --ignore-environment /bin/bash --noprofile --norc`

This current environment is empty,
then execute your script and see howcome it fails,
this should give you an idea.
Usually the reason would be some environment variables are not set:

For resolving this issue you can export variables above the actual cron table
(in the `crontab -e` screen) or in the beginning of your script:

**Resolving BUG** #1: Exporting the Path so geckodriver will be found
`export PATH=$PATH:/usr/local/bin/`

**Resolving BUG** #2: I kept getting "Error: no display specified", so you should set this:
`export DISPLAY=:0;`


You can use the `env` command (for running a program in a modified environemnt)


Minute | Hour | Date | Month | DOW   | command
------|----- | ----|-----|------|---------
\* |  * | * | * | * |  /tmp/myscript.sh


> Make sure your environment is set in the script: myscript.sh

#### Example #10: Run cronjob in random times with step size of 4 hours

Minute | Hour | Date | Month | DOW   | command
------|----- | ----|-----|------|---------
0 |  */4 | * | * | * | `delay=$(($RANDOM%60)) && sleep $delay && /tmp/myscript.sh`


I'm padding the cron job time execution with interval's size of 0-60 seconds,

you can easily put the logic in the bash script itself.


### Debugging cron jobs in failures

#### Approach #1: Writing to a logfile

```bash
/bin/bash my_script.bash > /home/gil_diy/Desktop/backup.log 2>&1
```

#### Approach #2:

Start the following command for having the same environment as the one used by crontab:
```bash
env -i /bin/bash --noprofile --norc
```
Then start your script and see why it fails. This should give you an idea.

Sometimes the environment are not setup properly so here is a wrapper script I wrote:
```bash
#!/bin/bash

# Setting up all environment variables:
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export PATH=$PATH:/usr/local/bin/

# I kept getting "Error: no display specified", so you should set this:
export DISPLAY=:0;

# Final step execute the script
cd ~/PycharmProjects/example
/usr/local/bin/pipenv run python main.py
```
