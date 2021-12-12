<!--ts-->
   * [Split](#split)

<!-- Added by: gil_diy, at: Sun 12 Dec 2021 23:53:41 IST -->

<!--te-->


# Split

Linux systems provide a very easy-to-use command for breaking files into pieces. 

##

The split command does not remove your original file, just creates the chunks. If you want to specify the size of the file chunks, you can add that to your command using the -b option. For example:

split -b100M bigfile