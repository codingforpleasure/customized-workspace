<!--ts-->
   * [intro](#intro)
      * [Get familiar with the hotkeys:](#get-familiar-with-the-hotkeys)
      * [Tmux commands](#tmux-commands)
      * [useful commands](#useful-commands)

<!-- Added by: gil_diy, at: 2019-01-03T05:49+02:00 -->

<!--te-->

# intro
<p align="center">
  <img src="images/tmux.png" width="256" title="Some tmux love!">
</p>
*The commands and hotkeys were configured by me, i'm using tmuxinator (similiar functionality is given by tmuxp)*


## Get familiar with the hotkeys:

- Ctrl + a = PREFIX

Command description | Hotkey
------------ | -------------
Reload the configuration file (tmux.conf) | PREFIX + r
Install plugins mentioned in tmux.conf | PREFIX + I (capital i)
Kill tmux server | PREFIX + k
Creates vertical split | PREFIX + \|
Creates horizontal split | PREFIX + -
Run command in tmux ( **enter command mode** ) | PREFIX + /
Move to next window | PREFIX + n
Move to the previous window | PREFIX + p
Navigate between panes | PREFIX + &lt;arrows&gt;
Zoom in/out from active pane | PREFIX + z;
Jump to the specific window number | PREFIX + &lt;window number&gt;
Create new window | PREFIX + c (**c**reate window)
Close window | PREFIX + &
Rename window name | PREFIX + ,
Show all widows in a list | PREFIX + s
Detach from current tmux session | PREFIX + d



**Copying and pasting:**


Command description | Hotkey
------------ | -------------
Copy-mode | PREFIX + Esc
Search for text | / (in Copy mode)
marking text | v (in Copy mode)
copying/yanking text | y (in Copy mode)


## Tmux commands

Description | command | zshrc alias
------------|---------|-------------
**L**ist all **s**essions (detached + attached) | tmux ls | tls
**A**ttach to a **s**ession | tmux a -t &lt;session-name&gt; | tas &lt;session-name&gt;
**K**ill specific **s**ession | tmux a -t &lt;session-name&gt; | tks &lt;session-name&gt;

## useful commands

Command Description | Actual command
------------|-----
Resize the active pane strech it either Down/Up/Left/Right | resize-pane -D/U/L/R
Lists all current opened windows with their panes| list-windows

* **Attention:** make sure you're **in command mode** .



## Tmuixnator

```bash
sudo apt install ruby-full
```

```bash
gem install tmuxinator
```

---------------------------------------
* **On mac just switch the Ctrl with Cmd**

