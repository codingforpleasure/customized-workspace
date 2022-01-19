<!--ts-->
   * [Valgrind](#valgrind)
      * [Examples:](#examples)

<!-- Added by: gil_diy, at: Wed 19 Jan 2022 12:00:20 IST -->

<!--te-->


# Valgrind

## Examples:

```bash
valgrind --tool=memcheck --leak-check=yes --track-origins=yes --log-file="dump.txt" ./my_valgrind_example
```