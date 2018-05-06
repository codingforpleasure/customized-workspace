# Customized-workspace

Makes your workflow much simpler and faster

<img src="https://github.com/codingforpleasure/customized-workspace/blob/master/images/demo_tmux.gif" width="2000" height="600" />

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

The things you need to install are:


- tmux (I'm using tmux 2.6)
- tmuxinator - Create and manage tmux sessions easily (I'm using tmuxinator 0.10.1)
- tmux-themepack - [link](https://github.com/jimeh/tmux-themepack)
- tmnux-plugin manager - [link](https://github.com/tmux-plugins/tpm)
- fonts for the theme - [link](https://github.com/powerline/fonts)
- generic colouriser (brew install grc)
- Command-line productivity booster (brew install fasd)
- git Autocomplete - [link](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh)
- terminal-notifier (brew install terminal-notifier)
- multitail (brew install multitail)
- pyenv - Managing easily and switching between multiple versions of Python


Soon I'll be posting a script for doing all those installs in a snap of a finger.

### Installing

clone this repo
```
git clone https://github.com/codingforpleasure/customized-workspace.git
```

In this repository you can find:
 - tmux.conf - Holds the configuration enviroment of tmux (should be located in the ~ directory)
 - backend-work - A template which consists multiple panes in each window for viewing easily various logs. main paurpose is to 
                  easily diagnose the system (should be located in ~/.config/tmuxinamtor/backend-work.yml)
 - .zshrc - configured, works well. place it in the home directory.
 - multitail.conf - Coloring specific words by regex, should be placed in ~/.config/multitail directory.
 - git hooks (makes life easier) -  [Link](https://github.com/codingforpleasure/customized-workspace/tree/master/.my_git_hooks)
 - Some useful scripts

## Running
```
tmuxinator backend-work
```
## Bring-up unit-test environment
```
unit-tests-db
```
`You can even easily add this command to the git pre-push hook which was added here.`

## Get familiar with the hotkeys:

- Command + a = PREFIX

Command description | Hotkey
------------ | -------------
Reload the configuration file (tmux.conf) | PREFIX + r
Kill tmux server | PREFIX + k
Creates vertical split | PREFIX + \
Creates horizontal split | PREFIX + -
Run command in tmux | PREFIX + \:
Move to next window | PREFIX + n
Navigate between panes | PREFIX + \<arrows\> 
Jump to the specific window number | PREFIX + \<window number\>
Create new window | PREFIX + c
Rename window name | PREFIX + , 
Choose a session from a list | PREFIX + s

Copying and pasting:

Command description | Hotkey
------------ | -------------
Copy-mode | PREFIX + Esc
Search for text | / (in Copy mode)
marking text | v (in Copy mode)
copying/yanking text | y (in Copy mode)

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Gil Cohen** - *Initial work* - [CodingForPleasure](https://github.com/CodingForpleasure)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
