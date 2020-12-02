<!--ts-->
   * [fstab (file system table)](#fstab-file-system-table)
         * [Checking command before inserting entry into to fstab](#checking-command-before-inserting-entry-into-to-fstab)
         * [Example #1: Mounting NAS](#example-1-mounting-nas)
         * [Example #2: Mounting external Solid Stata Drive](#example-2-mounting-external-solid-stata-drive)
         * [Mount automatically a device during boot to my linux filesystem:](#mount-automatically-a-device-during-boot-to-my-linux-filesystem)

<!-- Added by: gil_diy, at: Wed Dec  2 15:55:07 IST 2020 -->

<!--te-->



# fstab (file system table)
fstab is a system configuration file which exists at: `/etc/fstab`,
it lists all available disk partitions and other types of file systems and data
sources that are not necessarily disk-based, and indicates how they are to be initialized or otherwise integrated into the larger file system structure.

The fstab file is read by the mount command, which happens automatically at boot time to determine the overall file system structure, and thereafter when a user executes the mount command to modify that structure.

### Checking command before inserting entry into to fstab

* You can retrieve the gid and uid of a spcific user from `cat /etc/passwd`.

### Example #1: Mounting NAS

we can easily mount the NAS with:
```bash
sudo mount 192.168.1.8:/mnt/WD_backup ~/my-nas --options gid=1000,uid=1000,fmask=117,dmask=007
```

### Example #2: Mounting external Solid Stata Drive

we can easily mount the SSD with:
```bash
sudo mount UUID=17F30CD71ED138A1 ~/my_external_sandisk --options gid=1000,uid=1000,fmask=117,dmask=007
```

* For mounting a SSD or a Thumbdrive it is recommended to use the device's UUID
For mapping hard-drive with uuid, you need to get the uuid: [Link](https://linuxconfig.org/how-to-retrieve-and-change-partitions-universally-unique-identifier-uuid-on-linux)

### Mount automatically a device during boot to my linux filesystem:

but the problem of mounting partitions from command line is once you reboot your system that NAS drives are no more mounted.

I'll be adding this to the last line of the file `/etc/fstab`
```bash
192.168.1.8:/mnt/WD_backup        /home/gil_diy/my-nas    nfs    defaults   0 0
```

**Great tip #1:**

For mounting to specifc user you should NOT use the `defaults`, you should set the options correctly.


**Great tip #2:**
For avoiding a situation of getting stack during boot,
check the entry you recently entered by using the command `mount -a`, all filesystems will get mounted following their order in fstab.




Attention: a great explanation is written in fstab manual, take a look.



