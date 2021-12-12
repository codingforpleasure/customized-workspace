<!--ts-->
   * [Split](#split)
      * [split into chunks of equal size](#split-into-chunks-of-equal-size)
      * [split into groups of the same number of lines](#split-into-groups-of-the-same-number-of-lines)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: Sun 12 Dec 2021 23:58:37 IST -->

<!--te-->


# Split

Linux systems provide a very easy-to-use command for breaking files into pieces. 

## split into chunks of equal size

The split command does not remove your original file, just creates the chunks. If you want to specify the size of the file chunks, you can add that to your command using the -b option. For example:

```bash
split -b100M bigfile
```

File sizes can be specified in kilobytes, megabytes, gigabytes, terabytes:  K, M, G, T ...

## split into groups of the same number of lines

```bash
split -l 500 myfile segment
```

This will output six 500-line files: segmentaa, segmentab, segmentac, segmentad, segmentae, and segmentaf.


## Reference

[Link](https://kb.iu.edu/d/afar)