<!--ts-->
<!--te-->

# grep

## search multiple words:

```bash
grep 'warning\|error\|critical' /var/log/messages
```

or with the `e` option (without the backslashes):

```bash
grep -e 'warning|error|critical' /var/log/messages
```

## options

Description | flag
------------|-----
whole word | -w
negative matching (invert-match select non-matching lines)  | -v
Show line numbers where the matches were found | -n
Show the number of matches on each file | -c
No case sensitive | -i
See serounding lines of codes **before** | -B <number of lines>
See serounding lines of codes **after** | -A <number of lines>
See serounding lines of codes **after and before** | -C <number of lines>
Search all subdirectories (recursive search)| -r

## regular expression

Description | Title2
------------|-----
Any character | .
Any digit | \d
number of appearances | {<number of appearances>}
