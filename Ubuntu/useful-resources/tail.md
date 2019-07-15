<!--ts-->
   * [Tail](#tail)
      * [Examples:](#examples)
         * [print the last n charcters in a file:](#print-the-last-n-charcters-in-a-file)
         * [Remove the last n charcaters in a file](#remove-the-last-n-charcaters-in-a-file)

<!-- Added by: gil_diy, at: 2019-07-15T11:04+03:00 -->

<!--te-->

# Tail

## Examples:
### print the last n charcters in a file:

let's say n is 12:

```bash
tail -c 12 <fliename>
```
### Remove the last n charcaters in a file

**Attention**: it is done in place so make sure you know what you are doing!

```bash
truncate -s-5 play.txt
```


