#!/bin/bash
# By ESSPEE
# Initial Build: 23rd Dec, 2015

(
app=$(zenity --entry --text='Enter the application name (whatever you remember) :' --entry-text='facebook'  --height=100 --width=450 --title="Uninstall Android Application");
filter=$(adb shell pm list packages | cut -d":" -f2 | grep -i "$app" | dos2unix);
counter=$(echo "$filter" | wc -l);


if [[ "`adb shell pm list packages | cut -d":" -f2 | grep -i "$app"`" == "" ]]; then
zenity --error --title="Uninstall Android Application" --text="No such application installed on the android device.\nEither it is not installed or you don't have permission.\n\n<b>=> It might be possible that you want to uninstall system\napplication and your device is not rooted.</b> " --no-wrap
exit 1
fi

if [[ "$counter" -eq 1 ]]; then
zenity --question --title="Application to be uninstalled" --text="You have selected $counter package to be uninstalled.\nDo you really want to uninstall :-\n\n<b><i>$filter</i></b>" --no-wrap
if [[ $? == 0 ]]; then
  adb shell pm disable $filter
  adb shell pm clear $filter
  adb shell pm uninstall $filter
  echo "10" ; sleep 1
  echo "# $counter application being uninstalled from android device ..." ; sleep 1

else
  exit 1
fi
elif [[ "$counter" -gt 1 ]]; then
zenity --question --title="$counter Application to be uninstalled" --text="<b>NOTICE:</b>  You have selected $counter applications to be uninstalled.\nDo you really want to uninstall the following packages :-\n\n<b><i>$filter</i></b>" --no-wrap
  if [[ $? == 0 ]]; then
  echo "10" ; sleep 1
  echo "# $counter Android applications being uninstalled from android device ..." ; sleep 1
  for file in $filter ;
  do
    adb shell pm disable $file;
    adb shell pm clear $file;
    adb shell pm uninstall $file;
  done
else
  exit 1
fi
fi

notify-send --icon=/usr/share/icons/SSB/scalable/apps/apk.png "Uninstall Android Application" "$counter Applications uninstalled."

echo "100" ; sleep 1
) |
zenity --progress --pulsate --auto-close --title="Uninstall Android Application" --text="Application being uninstalled from android device ..." --width=500 --height=100

exit 0
