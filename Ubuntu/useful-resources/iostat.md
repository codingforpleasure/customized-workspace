<!--ts-->
   * [iostat](#iostat)

<!-- Added by: gil_diy, at: Sun 02 Oct 2022 09:17:51 IDT -->

<!--te-->

# iostat

An easy way to get IOPS with dd is to use `iostat` 

```bash
iostat -d /dev/sdc 1
```

the iostat output will repeat itself for every second until a Ctrl-C is issued to cancel the operation.

```bash
while true; do clear && iostat -d /dev/sdc/ && sleep 1; done
```