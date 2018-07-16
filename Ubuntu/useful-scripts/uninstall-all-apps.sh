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



#all_packages_names=`adb shell pm list packages codingforpleasure | awk -F: '{ print $2 }'`
#all_packages_names={ adb shell pm list packages codingforpleasure | awk -F: '{ print $2 }'; }
#all_packages_names={ adb shell pm list packages codingforpleasure | awk -F: '{ print $2 }'; }
all_packages_names=$( adb shell pm list packages codingforpleasure | awk -F: '{ print $2 }' )

num_rows=$( echo "$all_packages_names" | wc -l )

echo "Removing :" $num_rows " packages."


for pkg_name in $all_packages_names
do
	colorful_echo yellow "Removing package:    $pkg_name"
	adb shell pm uninstall "$pkg_name"
done


colorful_echo yellow "Removed all $num_rows packages."
