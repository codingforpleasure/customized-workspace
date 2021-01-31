<!--ts-->
   * [inotify](#inotify)
      * [Get info about system's inotify:](#get-info-about-systems-inotify)
      * [Get a list of the pids that have a inotify fd registered:](#get-a-list-of-the-pids-that-have-a-inotify-fd-registered)

<!-- Added by: gil_diy, at: 2020-10-03T18:47+03:00 -->

<!--te-->

# inotify

## Get info about system's inotify:

```bash
sysctl fs.inotify
```


## Get a list of the pids that have a inotify fd registered:

```bash
sudo ls -l /proc/*/fd/* | grep notify
```