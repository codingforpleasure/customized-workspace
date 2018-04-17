#!/bin/zsh

# I'm assuming you have installed mongodb@3.4,
# if not, you should eneter enter:
# brew install mongodb@3.4

# in case you have a different mongo version,
# you should link to the correct version:
# brew link mongodb@3.4 --force


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

if [ -n "$TMUX" ];
then
	get_time=`date | awk '{print $4}'`	

	colorful_echo yellow "[${get_time}]: Bringing down local-db ( Both mongo server and Redis-server)"

	pkill -9 mongod
	pkill -9 redis-server
	colorful_echo green "[${get_time}]: Bringing up local-db both mongo server and Redis-server."

	name='backend-work'
	window_name='db-unit-test'

	tmux new-window -t $name -n $window_name
	tmux select-window -t $name
	tmux split-window -v -t $name

	# Now run the processess
	tmux send-keys -t $window_name.1 'mongod --verbose' C-m #C-m is like pressing Enter
	tmux send-keys -t $window_name.2 'redis-server' C-m
else
	colorful_echo red "You should be in TMUX ( tmux ROCKS! ),\notherwise this script won't work."
fi