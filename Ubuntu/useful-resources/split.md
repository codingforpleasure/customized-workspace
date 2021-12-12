<!--ts-->
   * [Split](#split)
      * [split into chunks](#split-into-chunks)

<!-- Added by: gil_diy, at: Sun 12 Dec 2021 23:55:01 IST -->

<!--te-->


# Split

Linux systems provide a very easy-to-use command for breaking files into pieces. 

## split into chunks

The split command does not remove your original file, just creates the chunks. If you want to specify the size of the file chunks, you can add that to your command using the -b option. For example:

```bash
split -b100M bigfile
```

File sizes can be specified in kilobytes, megabytes, gigabytes, terabytes:  K, M, G, T ...