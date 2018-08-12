#!/bin/bash


adb kill-server
cd ~/.AndroidStudio3.1/system/log/my-logs
adb start-server
adb logcat -d > ./gil_log.txt

