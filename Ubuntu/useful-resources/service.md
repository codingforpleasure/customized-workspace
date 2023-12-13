<!--ts-->
   * [init systems](#init-systems)
      * [sysv](#sysv)
      * [systemd (System and Service Manager)](#systemd-system-and-service-manager)
         * [systemctl](#systemctl)
         * [systemd-analyze](#systemd-analyze)
         * [Journalctl to view and manipulate Systemd logs](#journalctl-to-view-and-manipulate-systemd-logs)

<!-- Added by: gil_diy, at: 2020-03-11T12:49+02:00 -->

<!--te-->

# init systems

First you should check which init system runs on your system:
```bash
ps -p 1
```

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


### systemctl
Analyzing the system state is done by **systemctl**, which is a tool for introspecting and controling the state of the systemd system and service manager (see examples in the table below).

Threre are different type of unit files:

* Service
* Socket
*



Description | command
------------|-----
Show system status | systemctl status
List running units | systemctl
List failed units | systemctl --failed
Start a unit immediately | **systemctl start** &lt;unit-name&gt;
Stop a unit immediately | systemctl stop &lt;unit-name&gt;
Restart a unit | systemctl restart &lt;unit-name&gt;
Ask a unit to reload its configuration | systemctl reload &lt;unit-name&gt;
Show the status of a unit, including whether it is running or not | systemctl status &lt;unit-name&gt;
Make a service start on reboot | systemctl enable &lt;unit-name&gt;
Mask a unit to make it impossible to start it | systemctl mask &lt;unit-name&gt;
 | systemctl -l --type service --all
 For root | systemctl -r --type service --all


### Where do configuration files for each process resides?

Priority order:

```bash
/etc/systemd/system
```

```bash
/usr/lib/systemd/system
```

### systemd unit files

I have created a config file, in: `/etc/systemd/system/fastapi.service`

```
[Unit]
Description=FastAPI Service
After=network.target

[Service]
ExecStart=/usr/bin/zsh -c 'source /home/gil/.local/share/virtualenvs/fastapi_robust_improvements-UxCX4V84/bin/activate && /home/gil/.local/share/virtualenvs/fastapi_robust_improvements-UxCX4V84/bin/uvicorn app.main:app --reload --host 0.0.0.0'

WorkingDirectory=/home/gil/PycharmProjects/fastapi_robust_improvements
User=gil
Group=gil
Restart=always

[Install]
WantedBy=multi-user.target
```



### systemd-analyze

Determining system boot-up performance statistics and retrieve other state and tracing information from the system and service manager is done by **systemd-analyze**.


### Journalctl to view and manipulate Systemd logs
https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs
