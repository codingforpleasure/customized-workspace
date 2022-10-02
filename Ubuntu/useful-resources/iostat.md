<!--ts-->
   * [iostat](#iostat)

<!-- Added by: gil_diy, at: Sun 02 Oct 2022 09:18:56 IDT -->

<!--te-->

# iostat

An easy way to get IOPS with dd is to use `iostat` 

```bash
iostat -d /dev/sdc 1
```

the iostat output will repeat itself for every second until a Ctrl-C is issued to cancel the operation.
The second column in the output is **tps**, which stands for transactions per second and is the same as IOPS.

```bash
while true; do clear && iostat -d /dev/sdc/ && sleep 1; done
```