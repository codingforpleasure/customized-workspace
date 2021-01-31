<!--ts-->
   * [Mount](#mount)
      * [Examples:](#examples)
         * [Mounting all filesystems mentioned in fstab](#mounting-all-filesystems-mentioned-in-fstab)
         * [Unmount](#unmount)

<!-- Added by: gil_diy, at: Wed Dec  2 12:26:27 IST 2020 -->

<!--te-->


# Mount
## Examples:

###
```bash
mount -l
```


### Mounting all filesystems mentioned in fstab
Mount all filesystems (of the given types) mentioned in fstab (except for those whose line contains the noauto keyword).  The filesystems are mounted following their order in fstab
```bash
mount --all
```

### Unmount

```bash
sudo umount /media/data
```
