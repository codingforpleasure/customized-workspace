## Cron tips and tricks

Purpose | command example
------------ | -------------
List cron table entries | crontab -l
Edit crontab via your editor (according to `VISUAL` or `EDITOR` environment variables) | crontab -e
Remove the crontab | crontab -r
Edit another user crontab | sudo crontab -u &lt;username&gt;

**you can also set your editor by `select-editor` command.**


Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
0 - 59 |  0 - 23 | 1 - 31 | 1 - 12 or JAN - DEC | 0 - 7 Or SUN - SAT


Another accaptable value in all those fields are asterisk (\*),
for example:


if asterisk will appear in the minute field so it will presents
 _**all**_ minutes between 0 to 59.

**Example #1:**


Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
12,46 |  1,2,20 | 7,29 | MAR,AUG | 3,5 | job #1


**Example #2: Creating ranges**

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
34-56 |  6-12 | 7-14 | 3-8 | MON-FRI | job #1


**Example #3: Run a cron job on every minute**

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
* |  * | * | * | * | job #1

**Example #3: Run a cron job on every hour**

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
0 |  * | * | * | * | job #1

**Example #4: Run a cron job on every five minutes**

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
*/5 |  * | * | * | * | job #1

** Pay attention: here I have used a step value of 5 which generates the following series:**
0,5,10,15,20,25,30,35,40,45,50,55

** make sure the step value you pick  devides into the range you picked without any remainders, cause otherwise you'll get uneven intervals.**


**Example #5: Run a cron job on 09:30 and on 17:30, from Sunday To Thursday**

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
30 |  9,17 | * | * | SUN-THU | job #1

**Example #6: Run a cron job every 90 minutes**

Minute | Hour | Date | Month | DOW (Day Of the Week)  | command
------|----- | ----|-----|------|---------
0 |  */3 | * | * | * | job #1
30 |  1/3 | * | * | * | job #1


The first entry will start at midnight:    0		       3		6		9		12		15		18		21

The second entry will start at midnight with offset of 90 minutes from our first cron job entry:
  01:30	  04:30	07:30	10:30	13:30	16:30	19:30	22:30
