#!/bin/zsh

multitail --config /home/gil_diy/.config/multitail/multitail.conf \
			-cS my-cron-color-scheme \
			-e "gil_diy" \
			-f \
			-i /var/log/syslog


# -e    Filtering using regular expressions, the coressponding lines which match are shown
# -f 	This makes MultiTail follow the file
# -i 	This shows the file 'file' in your terminal-window, i.e: -i <file-path>
