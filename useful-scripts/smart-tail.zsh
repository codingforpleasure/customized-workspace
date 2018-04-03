#!/bin/zsh

# This script is wrapper to multitail,
# which notifies you while tailing on your logs,
# when an error or warning message was mentioned.
# I'm using the built-in say command (text to audible speech),
# this way you will notice the error/warning much easily


# Should install first multitail:
# http://macappstore.org/multitail/

log_file='tmp.txt'
multitail -ex "warning|error" "say $2;say php_error" -i $log_file