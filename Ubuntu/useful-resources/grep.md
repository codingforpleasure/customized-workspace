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

##
