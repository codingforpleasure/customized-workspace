<!--ts-->
   * [mkfs](#mkfs)
      * [Types of file system:](#types-of-file-system)
      * [Examples:](#examples)
         * [To format drive with the FAT32 file system format:](#to-format-drive-with-the-fat32-file-system-format)
         * [To set a file system label for your pen drive in the process:](#to-set-a-file-system-label-for-your-pen-drive-in-the-process)

<!-- Added by: gil_diy, at: 2018-12-01T11:36+02:00 -->

<!--te-->
# mkfs
mkfs is a command used to format a block storage device with a specific filesystem

## Types of file system:

* mkfs.bfs
* mkfs.cramfs
* mkfs.ext2
* mkfs.ext3
* mkfs.ext4
* mkfs.ext4dev
* mkfs.fat
* mkfs.minix
* mkfs.msdos
* mkfs.ntfs
* mkfs.vfat

## Examples:
###  To format drive with the FAT32 file system format:
```bash
mkfs.vfat /dev/sdb
```

###  To set a file system label for your pen drive in the process:
```bash
mkfs.vfat -n 'gil_thumbdrive' /dev/sdb
```
