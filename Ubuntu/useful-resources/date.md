<!--ts-->
<!--te-->

date functions:

in the .zsh_history the first column is saved as a number, to convert it try using `date -d`:

```bash
date -d @1532435499 +"%Y.%m.%d %H:%M:%S"
```
output:
`2018.07.24 15:31:39`
