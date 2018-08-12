#!/bin/bash

check=$(pgrep -c studio.sh)

if [ "$check" -gt 0 ]; then
 	echo "Not Invoking android-studio is already running..."
else
	echo "Invoking android-studio"
 	~/android-studio/bin/studio.sh &
fi