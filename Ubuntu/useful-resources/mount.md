<!--ts-->
   * [Mount](#mount)
      * [Examples:](#examples)
         * [Mounting all filesystems mentioned in fstab](#mounting-all-filesystems-mentioned-in-fstab)

<!-- Added by: gil_diy, at: 2019-01-16T08:22+02:00 -->

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
mount -a
```
