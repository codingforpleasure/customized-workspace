<!--ts-->
<!--te-->

# Locate
The locate utility works better and faster than it’s find counterpart because instead of searching the file system when a file search is initiated – Something find does – locate would look through a database. This database contains bits and parts of files and their corresponding paths on your system.

## Usage examples:

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
### Refresh mlocate Database
```bash
sudo updatedb
```

### Review Your Locate Database
```bash
locate -S
```
