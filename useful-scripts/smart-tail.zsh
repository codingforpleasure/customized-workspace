#!/bin/zsh

# This script notifies you while tailing on your logs,
# the moment an error or warning message has arrived.
# I'm using the built-in say command (text to audible speech),
# this way you will NOTICE the error/warning much easily,
# and avoid wasting valueable time.

# If you have a connection to some host which gets automatically disconnected when
# nothing happens for a while, MultiTail moves the cursor around the screen generating
# traffic, keeping your line up.

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

heartbeat_interval=20

ALLOW_POPUP="enable-popup"
ALLOW_TEXT_TO_SPEECH="enable-text-2-speech"
MULTITAIL_CONF_PATH="~/.config/multitail/multitail.conf"

keyword=$1 
popup_notifier_state=$2
audio_notifier_state=$3


handler_on_match="";

if [ -z ${keyword} ];
then
	keyword="(error)"
	colorful_echo cyan "Keyword was not set, so looking for the default keyword: error"
else
	keyword="(${keyword})"
fi

if [ "$popup_notifier_state" = "$ALLOW_POPUP" ];
then
	handler_on_match="terminal-notifier -message 'Error was found in php_errors!'"
	colorful_echo green "Popup notifier is enabled."
else
	colorful_echo cyan "Popup notifier is not activated."
fi

if [ "$audio_notifier_state" = "$ALLOW_TEXT_TO_SPEECH" ];
then
	handler_on_match="${handler_on_match} ; say php"
	colorful_echo green "Text-2-speech is enabled."
else
	colorful_echo cyan "Text-2-speech is not activated."
fi

if [ -z ${handler_on_match} ];
then
	colorful_echo yellow "No notifier was set (both popup and text-2-speech) ."
	handler_on_match="say nothing"
fi


# TODO: should use: ${MULTITAIL_CONF_PATH}

multitail --config ~/.config/multitail/multitail.conf \
	-cS blazeColors -eX ${keyword} ${handler_on_match} \
	-j \
	-H ${heartbeat_interval}