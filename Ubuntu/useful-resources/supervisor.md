<!--ts-->
   * [supervisor](#supervisor)
      * [installation:](#installation)
      * [Configuration file](#configuration-file)
         * [Create config file](#create-config-file)
         * [Run the server](#run-the-server)
         * [Viewing server's log file](#viewing-servers-log-file)
         * [Supervisor client in interactive mode](#supervisor-client-in-interactive-mode)

<!-- Added by: gil_diy, at: 2019-01-01T18:43+02:00 -->

<!--te-->


# supervisor

Supervisor is a client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems.

## installation:
```bash
$ pip install git+https://github.com/Supervisor/supervisor
```
This way we we will make sure it uses **python3** (see the github repo)

otherwise with:
```bash
$ pip install supervisor
```
it will use **python 2** and NOT 3.

## Configuration file

### Create config file
The config file is quite self explanatory,
for creating new one just follow the instructions here: [Link]: http://supervisord.org/installing.html#creating-a-configuration-file

### Run the server
Assuming the executable file is on your PATH environment variable, there should not be any problem. just enter:
```bash
$ supervisord
```

### Viewing server's log file
```bash
$ tail -f /tmp/supervisord.log
```


### Supervisor client in interactive mode
```bash
$ supervisorctl -i
```
Enter `help` for getting all commands available.
