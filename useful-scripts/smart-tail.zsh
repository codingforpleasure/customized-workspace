#!/bin/zsh

# This script is wrapper to multitail,
# which notifies you while tailing on your logs,
# when an error or warning message was mentioned.
# I'm using the built-in say command (text to audible speech),
# this way you will NOTICE the error/warning much easily,
# and avoid valueable time.


# Should install first multitail:
# http://macappstore.org/multitail/

multitail_conf_path="~/.config/multitail/multitail.conf"

# If you have a connection to some host which gets automatically disconnected when
# nothing happens for a while, MultiTail moves the cursor around the screen generating
# traffic, keeping your line up.

heartbeat_interval=20
keyword=$1


# if [ -z ${keyword} ];
# then
#	keyword="\"(error)\""
# else
# 	keyword="\"($keyword)\""
# fi

# echo "${multitail_conf_path}"
# echo "${keyword}"

multitail --config ~/.config/multitail/multitail.conf \
	-cS blazeColors -eX "(error)" "say php" -j \
	-H ${heartbeat_interval}