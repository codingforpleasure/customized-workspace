#!/bin/zsh

name='backend-work'
window_name='xdebug'

# Append xdebug window (window number is incremented by one after the last window)
tmux new-window -t $name -n $window_name
tmux select-window -t $name

# Now run the processes
tmux send-keys -t $name 'bzdev env xdebug' C-m
