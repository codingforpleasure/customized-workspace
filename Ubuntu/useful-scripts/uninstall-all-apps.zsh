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
all_packages_names=$( adb shell pm list packages codingforpleasure | awk -F: '{ print $2 }' | dos2unix )

echo "$all_packages_names"
num_rows=$( echo "$all_packages_names" | grep com -c )

colorful_echo green "Removing :" $num_rows " packages."


for pkg_name in $all_packages_names
do
	colorful_echo yellow "Disabling package:    $pkg_name"
	adb shell pm disable $pkg_name

  	colorful_echo yellow "Clearing package:    $pkg_name"
  	adb shell pm clear $pkg_name

	colorful_echo yellow "Uninstalling package:    $pkg_name"
	res=$( adb shell pm uninstall  $pkg_name )

	if (( $? == 0 )) ;
	then
		echo "Removed $pkg_name succefully" ;
	else
		echo "Failed removing $pkg_name";
	fi
	#echo "res= $?"
done


colorful_echo yellow "Removed all $num_rows packages."
