<!--ts-->
<!--te-->


# man


## search for keywords in man:

This will give you a list of all man pages which relate to 'my-keywords':

```bash
man -k <my-keywords>
```

## Navigate and search in specific section:

```bash
man <section number> <keyword>
```
for example:
```bash
man 2 mmap
```

Section # | Description
------------|-----
1 | General commands
2 | System calls
3 | Library functions, covering in particular the C standard library
4 | Special files (usually devices, those found in /dev) and drivers
5 | File formats and conventions
6 | Games and screensavers
7 | Miscellanea
8 | System administration commands and daemons

