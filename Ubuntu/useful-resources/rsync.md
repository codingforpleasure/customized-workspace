# Rsync

**Rsync only copies only what's different from last backup**

Simple examples:

| Description | Command |
| ----------------- | -------------------|
|  rsync src directory to dst directory| `rsync --archive --verbose ~/src ~/dst`|
|  rsync across the network above ssh  | `rsync --verbose -e ssh /home/$USER/example/* root@192.168.0.2:~/example` |


Few more flags which might be useful in the future:

|Useful flags | Description |
|-------------|-------------|
| `--archive`   | Recurse into directories, copy symlinks, preserve permissions,preserve group, preserve owner |
| `--verbose` | Increase verbosity|
| `--compress`  | Compress file data during the transfer (for transfering over the network, it sometimes useful to compress files)|
|`--update`| skip files that are newer on the receiver for conserving bandwidth and time|
|`--dry-run`  | Perform a trial run with no changes made, to see what an rsync command is going to do before  one  actually runs it.
| `--daemon`| Run as an rsync daemon
| `--human-readable` | Output numbers in a human-readable format
| `--progress`| Show progress during transfer
| `--delete`| if we would like to mirror, which means make sure the dst is exactly the same as the src directory. so if we would add file in the dst the mirror option will delete it since the src folder doesn't have any kind of file (**be careful with this delete option**).
