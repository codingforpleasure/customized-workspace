<!--ts-->
   * [init systems](#init-systems)
      * [sysv](#sysv)
      * [systemd (System and Service Manager)](#systemd-system-and-service-manager)

<!-- Added by: gil_diy, at: 2018-09-23T18:43+03:00 -->

<!--te-->

# init systems
## sysv

You can verify on your server by looking in the /etc/init.d folder. All the services are there.

service --status-all

```bash
ls -l /etc/init.d
```

## systemd (System and Service Manager)
It provides a system and service manager that runs as PID 1 and starts the rest of the system. systemd provides aggressive parallelization capabilities
starting services, offers on-demand starting of daemons, keeps track of processes using Linux control groups, maintains mount and automount points
Other parts include a logging daemon, utilities to control basic system configuration like the hostname, date, locale, maintain a list of logged-in users and running containers and virtual machines, system accounts, runtime directories and settings, and daemons to manage simple network configuration, network time synchronization, log forwarding, and name resolution.

* Analyzing the system state is done by **systemctl**, which is a tool for introspecting and controling the state of the systemd system and service manager (see examples in the table below).


Description | command
------------|-----
Show system status | systemctl status
List running units | systemctl
List failed units | systemctl --failed
Start a unit immediately | systemctl start <unit-name>
Stop a unit immediately | systemctl stop <unit-name>
Restart a unit | systemctl restart <unit-name>
Ask a unit to reload its configuration | systemctl reload <unit-name>
Show the status of a unit, including whether it is running or not | systemctl status unit
Mask a unit to make it impossible to start it | systemctl mask unit
 | systemctl -l --type service --all
 For root | systemctl -r --type service --all


* Determining system boot-up performance statistics and retrieve other state and tracing information from the system and service manager is done by **systemd-analyze**.


