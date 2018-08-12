#!/bin/bash

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

timestamp() {
  date +"logfile.%d-%m-%Y-time-%H-oclock.txt"
}

#adb kill-server && adb start-server
#adb logcat -d >> ./gil_log.txt
name=$(timestamp)
#echo "All log files are sent to: ${name}"
colorful_echo yellow "All log files are sent to: ${name}"
adb logcat -d >> ./"${name}"
