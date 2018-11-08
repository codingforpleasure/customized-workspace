#!/bin/sh

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


for MARKDOWN in ./*toc*
do
	colorful_echo purple "${MARKDOWN}"
	rm -f "${MARKDOWN}"
done

for MARKDOWN in ./*orig*
do
	colorful_echo purple "${MARKDOWN}"
	rm -f "${MARKDOWN}"
done


for MARKDOWN in ./*html
do
	colorful_echo purple "${MARKDOWN}"
	rm -f "${MARKDOWN}"
	rm -f "${MARKDOWN}"
done
