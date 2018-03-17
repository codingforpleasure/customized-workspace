# Customized-workspace

Makes your workflow much simpler and faster

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

The things you need to install are:

```
- tmux (I'm using tmux 2.6)
- tmuxinator - Create and manage tmux sessions easily (I'm using tmuxinator 0.10.1)
- tmux-themepack (https://github.com/jimeh/tmux-themepack)
- fonts for the theme (https://github.com/powerline/fonts)
- generic colouriser (brew install grc)
- Command-line productivity booster (brew install fasd)
```

Soon I'll be posting a script for doing all those installs in a snap of a finger.

### Installing

A step by step series of examples that tell you have to get a development env running

clone this repo

```
git clone https://github.com/codingforpleasure/customized-workspace.git
```

In this repository you can find:
 - tmux.conf - Holds the configuration enviroment of tmux (should be located in the ~ directory)
 - backend-work - A template which consists multiple panes in each window for viewing easily various logs. main paurpose is to 
                  easily diagnose the system (should be located in )

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Get familiar with the hotkeys:

- Command + a = PREFIX

Command description | Hotkey
------------ | -------------
Reload the configuration file (tmux.conf) | PREFIX + r
Kill tmux server | PREFIX + k
Creates vertical split | PREFIX + \
Creates horizontal split | PREFIX + -
Run command in tmux | PREFIX + \:
Navigate between panes | PREFIX + \<arrows\> 
Jump to the specific window number | PREFIX + \<window number\>
Create new window | PREFIX + c
Choose a session from a list | PREFIX + s

Copying and pasting:

Command description | Hotkey
------------ | -------------
Copy-mode | PREFIX + Esc
marking text | v (in Copy mode)
copying/yanking text | y (in Copy mode)


### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Running

tmuxinator backend-work

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

