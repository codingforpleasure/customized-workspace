<!--ts-->
   * [intro](#intro)
      * [Get familiar with the hotkeys:](#get-familiar-with-the-hotkeys)
      * [useful commands](#useful-commands)

<!-- Added by: gil_diy, at: 2018-09-26T11:36+03:00 -->

<!--te-->

# intro
<p align="center">
  <img src="images/tmux.png" width="256" title="Some tmux love!">
</p>
_The commands and hotkeys were configured by me, i'm using tmuxinator (similiar functionality is given by tmuxp)_


## Get familiar with the hotkeys:

- Command + a = PREFIX

Command description | Hotkey
------------ | -------------
Reload the configuration file (tmux.conf) | PREFIX + r
Kill tmux server | PREFIX + k
Creates vertical split | PREFIX + \|
Creates horizontal split | PREFIX + -
Run command in tmux ( **enter command mode** ) | PREFIX + \:
Move to next window | PREFIX + n
Move to the previous window | PREFIX + l
Navigate between panes | PREFIX + &lt;arrows&gt;
Jump to the specific window number | PREFIX + &lt;window number&gt;
Create new window | PREFIX + c (**c**reate window)
Close window | PREFIX + &
Rename window name | PREFIX + ,
Choose a session from a list | PREFIX + s


**Copying and pasting:**


Command description | Hotkey
------------ | -------------
Copy-mode | PREFIX + Esc
Search for text | / (in Copy mode)
marking text | v (in Copy mode)
copying/yanking text | y (in Copy mode)

## useful commands

Command Description | Actual command
------------|-----
Resize the active pane strech it either Down/Up/Left/Right | resize-pane -D/U/L/R
Lists all current opened windows with their panes| list-windows

* **Attention:** make sure you're **in command mode** .

