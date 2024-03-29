# ag
- [ag](#ag)
  - [Only print the names of files containing matches](#only-print-the-names-of-files-containing-matches)
  - [Only  print  the  number of matches in each file](#only--print--the--number-of-matches-in-each-file)
  - [Print lines before and after matches](#print-lines-before-and-after-matches)
  - [Filter files by their extensions](#filter-files-by-their-extensions)

https://github.com/ggreer/the_silver_searcher


## Only print the names of files containing matches

```bash
ag -l <word>
```

## Only  print  the  number of matches in each file

```bash
ag -c <word>
```
This is the number of matches, not the number of matching lines

## Print lines before and after matches

```bash
ag -C 5
```
Default is 2.

## Filter files by their extensions

**Get list of extensions:**

```bash
ag --list-file-types
```

**For example search for python files**:

```bash
ag --python <keyword>
```


**For example search for sql files**:

```bash
ag --sql <keyword>
```