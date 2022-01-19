<!--ts-->
   * [Valgrind](#valgrind)

<!-- Added by: gil_diy, at: Wed 19 Jan 2022 11:57:59 IST -->

<!--te-->


# Valgrind

```bash
valgrind --tool=memcheck --leak-check=yes --track-origins=yes --log-file="dump.txt" ./my_valgrind_example
```