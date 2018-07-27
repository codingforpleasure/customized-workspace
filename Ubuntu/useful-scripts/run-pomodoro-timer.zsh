#!/usr/bin/zsh

# Script for implementing the Pomodoro Technique"

while :
do
	echo "$line"
	TIME_TO_WORK=${1:-1500} # Default time 25 minutes (1500 seconds)
	TIME_TO_WORK_in_MINUTES=$((TIME_TO_WORK/60))
	DURTION_BREAK=${2:-300} # Default time 5 minutes (300 seconds)
	NOW=$(date +%s)
	FUTURE=$((NOW + TIME_TO_WORK))

	notify-send --icon="face-glasses" --urgency=Critical \
									"`date +%T`: Ready? Go!!!" \
									 "Time Starts, take a break in ${TIME_TO_WORK_in_MINUTES} Minutes! " # ${TIME_TO_WORK_in_MINUTES}

	echo ${(%):-%F{cyan}} "Starting time: `date +"%T"`"

	UPDATE_PERIOD=300
	ITERATIONS=$((TIME_TO_WORK/UPDATE_PERIOD))

	for (( i = 1; i <= $ITERATIONS; i++ )); do
		sleep $UPDATE_PERIOD
		echo ${(%):-%F{yellow}} "$((TIME_TO_WORK-i*UPDATE_PERIOD)) seconds left."
	done

	## Icons are located in: /usr/share/icons/gnome/32x32
	# or you can specify your icon path, i.e :-i /usr/share/pixmaps/gnome-irc.png

	notify-send --icon="face-glasses" --urgency=Critical \
									 "`date +%T`: Good Job" \
									 "Time ended, take a break of ${DURTION_BREAK} Minutes! "

	sleep $DURTION_BREAK
done
