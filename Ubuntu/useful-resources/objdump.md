<!--ts-->
   * [Objdump](#objdump)
      * [Display the contents of the overall file header using -f option](#display-the-contents-of-the-overall-file-header-using--f-option)
      * [Display the contents of the section headers using -h option](#display-the-contents-of-the-section-headers-using--h-option)
      * [Display the contents of all headers using -x option](#display-the-contents-of-all-headers-using--x-option)
      * [Display the contents of symbol table (or tables) using the -t option](#display-the-contents-of-symbol-table-or-tables-using-the--t-option)
      * [Display the contents of <strong>dynamic</strong> symbol table using -T option](#display-the-contents-of-dynamic-symbol-table-using--t-option)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: 2020-07-31T09:01+03:00 -->

<!--te-->


# Objdump

## Display the contents of the overall file header using -f option
```bash
objdump -f <Your binary file>
```

## Display the contents of the section headers using -h option
```bash
objdump -h <Your binary file>
```

So we see that the information related to all the section headers was printed in the output. 

In the output above:
* **Size** is the size of the loaded section

* **VMA** represents the virtual memory address

* **LMA** represents the logical memory address

* File **off** is this section’s offset from the beginning of the file

* **Algn** represents alignment

*  **CONTENTS**, **ALLOC**, **LOAD**, **READONLY**, **DATA** are flags that represent that a particular section is to be LOADED or is READONLY etc.


## Display the contents of all headers using -x option

The following example displays all the sections:

```bash
objdump -x <Your binary file>
```

## Display the contents of symbol table (or tables) using the -t option

```bash
objdump -t <Your binary file>
```

##  Display the contents of **dynamic** symbol table using -T option

```bash
objdump -T <Your binary file>
```



## Reference
[Link](https://www.thegeekstuff.com/2012/09/objdump-examples/)