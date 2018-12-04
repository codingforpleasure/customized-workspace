<!--ts-->
   * [tee](#tee)
      * [Examples](#examples)
         * [Example #1: output command on the screen and write into a file](#example-1-output-command-on-the-screen-and-write-into-a-file)
         * [Example #2: Append to a given file](#example-2-append-to-a-given-file)

<!-- Added by: gil_diy, at: 2018-12-04T22:07+02:00 -->

<!--te-->

# tee

Read from standard input and to write to both a standard output and file.

## Examples

### Example #1: output command on the screen and write into a file
```bash
date | tee mylog.log
```

### Example #2: Append to a given file
```bash
date | tee -a mylog.log
```
