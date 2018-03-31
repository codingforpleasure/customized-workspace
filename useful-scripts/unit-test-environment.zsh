#!/bin/zsh

# Restarting services:

brew services stop mongodb@3.4
pkill -9 redis-server

# brew services start mongodb@3.4
tmux new-window -t backend-work:7 -n 'unit-test' 'redis-server'
tmux select-window -t backend-work:7
tmux split-window -v 'brew services start mongodb@3.4'
