<!--ts-->
   * [nm](#nm)
      * [Display Object Files that Refer to a Symbol](#display-object-files-that-refer-to-a-symbol)
      * [Display all Undefined Symbols in an Executable](#display-all-undefined-symbols-in-an-executable)
      * [Display all Symbols in an Executable](#display-all-symbols-in-an-executable)
      * [Search for a Symbols and Display its Size](#search-for-a-symbols-and-display-its-size)
      * [Display Dynamic Symbols in an Executable](#display-dynamic-symbols-in-an-executable)
      * [Sort the nm Output by the Symbol Size](#sort-the-nm-output-by-the-symbol-size)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: 2020-07-31T09:12+03:00 -->

<!--te-->

# nm

The nm commands provides information on the symbols being used in an object file or executable file

The characters that identify symbol type describe :


```
A :  Global absolute symbol.
a  :  Local absolute symbol.
B : Global bss symbol.
b : Local bss symbol.
D : Global data symbol.
d : Local data symbol.
f : Source file name symbol.
L : Global thread-local symbol (TLS).
l : Static thread-local symbol (TLS).
T : Global text symbol.
t  : Local text symbol.
U : Undefined symbol.
```


## Display Object Files that Refer to a Symbol

```bash
nm  -A ./*.o | grep func
```

Note that the -A flag is used to display the file name along with other information.
So we see that in the output we get all the object files where the **symbol ‘func’ is being used**. 

**Use case:** This could be extremely useful in cases we want know how which object files are using a particular symbol.

## Display all Undefined Symbols in an Executable

The following command lists all the undefined symbols in an executable file

```bash
nm -u <Your binary file>
```

**Note**: flag ‘-u’ is used in this case for listing only the undefined symbols

**Use case:** This could be extremely useful in cases where one may want to know about the undefined symbols being used in the code that could either really be unresolved or could be resolved on run time through shared libraries.

## Display all Symbols in an Executable

Lists all the symbols in the executable file but in sorted order of their addresses:

```bash
nm -n <Your binary file>
```


## Search for a Symbols and Display its Size


```bash
nm  -S <Your binary file> | grep abc
```

## Display Dynamic Symbols in an Executable

```bash
nm  -D <Your binary file>
```

## Sort the nm Output by the Symbol Size

```bash
nm -g --size-sort <Your binary file>
```

## Reference

[Link](https://www.thegeekstuff.com/2012/03/linux-nm-command/)