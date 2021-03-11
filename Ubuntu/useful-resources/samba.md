# Samba

In case you are setting samba between Ubuntu to Android device,
you might NOT get access to the files, although you have shared the directories in the network.

* The config file resides in the path: `/etc/samba/smb.conf`


## Check and read the config file for samba

The default conf file is: `smb.conf`

```bash
testparm
```

## Restarting Samba service

```bash
sudo service smbd restart
```

## Setting log correctly in case authentication fails 

Setting Individual Log Levels for Debug Classes, therefore you will see the relevant debug class. place it in the [global] section.

```bash
log level = 1 auth:5
```

Log file resides here: `/var/log/samba/log.smbd`

[Reference](https://wiki.samba.org/index.php/Configuring_Logging_on_a_Samba_Server)

## Reset the password (in case authentication fails)

```bash
sudo smbpasswd -a <username>
```

Here, <username> is your username. Now, you will be prompted to set and retype new password. After this restart Samba service and try again to access the files you ahve shared, it should work!