<!--ts-->
* [Locate](#locate)
   * [Usage examples:](#usage-examples)
      * [Re-index mlocate Database](#re-index-mlocate-database)
      * [Limit Search Queries to a Specific Number](#limit-search-queries-to-a-specific-number)
      * [Display The Number of Matching Entries](#display-the-number-of-matching-entries)
      * [Ignore Case Sensitive Locate Outputs](#ignore-case-sensitive-locate-outputs)
      * [Review Your Locate Database](#review-your-locate-database)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sun 30 Oct 2022 02:34:11 IST -->

<!--te-->

# Locate

The locate utility works better and faster than it’s find counterpart because **instead of searching the file system when a file search is initiated** – Something **find** does.

**locate** would **look through a database**. 
This database contains bits and parts of files and their corresponding paths on your system.

## Usage examples:


### Re-index mlocate Database

```bash
sudo updatedb
```

###  Limit Search Queries to a Specific Number
```bash
locate "*.html" -n 20
```

### Display The Number of Matching Entries
```bash
locate -c [tecmint]*
```
### Ignore Case Sensitive Locate Outputs
```bash
locate -i *text.txt*
```

### Review Your Locate Database
```bash
locate -S
```
