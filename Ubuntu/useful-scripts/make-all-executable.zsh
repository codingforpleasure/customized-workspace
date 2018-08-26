#!/bin/sh

# Make sure all scripts(files) in current directory are executable

colorful_echo()
{
	  local code="\033["
		case "$1" in
					red    ) color="${code}1;31m";;
					green  ) color="${code}1;32m";;
					yellow ) color="${code}1;33m";;
					blue   ) color="${code}1;34m";;
					purple ) color="${code}1;35m";;
					cyan   ) color="${code}1;36m";;
					gray   ) color="${code}0;37m";;
					*) local text="$1"
		esac
		[ -z "$text" ] && local text="$color$2${code}0m"
		echo -e "$text"
}


USER_GROUP=`whoami`
for SCRIPT in ./*
do
	if [ -f "$SCRIPT" ]
	then
		colorful_echo cyan "$SCRIPT is set to be executable file"
		chmod +x $SCRIPT
		chown $USER_GROUP $SCRIPT
		chgrp $USER_GROUP $SCRIPT
	fi
done
