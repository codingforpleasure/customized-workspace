#!/bin/zsh

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
	name='backend-work'
	window_number='7' # Should fix it, so it won't be a fixed number.
	window_name='xdebug'

	tmux new-window -t $name:$window_number -n $window_name
	tmux select-window -t $name:$window_number

	# Run:
	bzdev env xdebug C-m #C-m is like pressing Enter

else
	colorful_echo red "You should be in TMUX ( tmux ROCKS! ),\notherwise this script won't work."
fi

