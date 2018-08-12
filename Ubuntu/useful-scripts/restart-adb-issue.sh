#!/bin/bash

adb kill-server
adb start-server

if [[ ?@ ]]; then
	echo "went well"
else
	echo "went BAD!"
fi

# Probably the resource is already has been taken,
# let's check it with strace (example of output):
# socket(PF_LOCAL, SOCK_STREAM, 0)        = 8
# unlink("/tmp/5037")                     = -1 EPERM (Operation not permitted)
# setsockopt(8, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
# bind(8, {sa_family=AF_LOCAL, sun_path="/tmp/5037"}, 12) = -1 EADDRINUSE (Address already in use)
# close(8)

port=strace adb start-server 2>&1 | grep bind


# would like to kill the processes which holds the port
if [[ ${port} ]]; then
	lsof -i :${port} | \
	awk 'NR>1 { print $2}' | \
	xargs -I '{}' kill {}
fi
