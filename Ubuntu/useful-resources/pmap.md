<!--ts-->
   * [pmap](#pmap)
      * [pmap (report memory map of a process)](#pmap-report-memory-map-of-a-process)

<!-- Added by: gil_diy, at: Wed 20 Apr 2022 20:45:45 IDT -->

<!--te-->

# pmap

## pmap (report memory map of a process)

```bash
pmap -p <pid>
```

Result in the same output as:

```bash
cat /proc/<pid>/maps
```