# customized-workspace


## prerequisites
- tmux (I'm using tmux 2.6)
- tmuxinator - Create and manage tmux sessions easily (I'm using tmuxinator 0.10.1)
- tmux-themepack (https://github.com/jimeh/tmux-themepack)
- fonts for the theme (https://github.com/powerline/fonts)

Hotkeys:


- Command + a = PREFIX

Command description | Hotkey
------------ | -------------
Reload the configuration file (tmux.conf) | PREFIX + r
Kill tmux server | PREFIX + k
Creates vertical split | PREFIX + \
Creates horizontal split | PREFIX + -
Run command in tmux | PREFIX + :
Navigate between panes | PREFIX + <arrows> 
Jump to the specific window number | PREFIX + <window number>
Create new window | PREFIX + c


In this repository you can find:
 - tmux.conf - Holds the configuration enviroment of tmux (should be located in the ~ directory)
 - backend-work - A template which consists multiple panes in each window for viewing easily various logs. main paurpose is to 
                  easily diagnose the system (should be located in )


For running it, enter:

tmuxinator backend-work
