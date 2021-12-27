#!/bin/bash
 
# Tkae 200 screenshots
for i in {1..200}
do
	# Take screenshot every 60 seconds
   scrot -d 60 "img${i}_%Y-%m-%d-%H:%M:%S.png" -e 'mv $f ~/Pictures/Daniel_mobileye_test';
done