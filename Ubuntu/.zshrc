# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$

# Adding java support
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin

# Adding elasticsearch support
export PATH=$PATH:/usr/share/elasticsearch/bin

# Adding some scripts for increasing my productivity
export PATH=$PATH:$HOME/my_useful_scripts

# Adding PyCharm to my path
export PATH=$PATH:/opt/pycharm-community-2018.2.4/bin

# Adding CLion to my path
export PATH=$PATH:/opt/clion-2018.3.2/bin


# Adding inteliji-idea, Datagrip and flutter
export PATH=$PATH:/opt/idea-IC-182.4129.33/bin/
export PATH=$PATH:/opt/DataGrip-2018.2.4/bin/
export PATH=$PATH:~/flutter/bin/

# Adding some anconda to my path
# export PATH="/home/gil_diy/anaconda3/bin:$PATH"

# Adding my documentations to my path
export DOC_MD_PATH=$HOME/myGitRepositories/customized-workspace/Ubuntu/useful-resources/

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# goodreads:
export alias total_shelfs_4M=$HOME/PycharmProjects/get_info_from_goodreads/all_shelves_on_goodreads/01_raw_data


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"

ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  web-search
  copybuffer
  history-substring-search
  extract
  systemd
  debian
  pip
  pipenv
  zsh-completions
  docker-compose
  )

source $ZSH/oh-my-zsh.sh

# For activating bunch of new completion scripts in zsh which are located in:
# ~/.oh-my-zsh/custom/plugins/zsh-completions
autoload -U compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# subl fail with editor
export EDITOR='vim'
export SHELL='/usr/bin/zsh'

# Take a look here, as a reference:
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/history.zsh
HISTSIZE=50000
SAVEHIST=10000

# I would like the MAN pages to be colorful. so should export
# enviroment variable make sure most is installed if not,
# install it via:  apt-get install most.
# I'm invoking most with -c switch for conducting a search in a manual with case sesitive manner.
if [ -e /usr/bin/most ]; then
	export PAGER="most -c"
else
	echo -e "\n${BWhite}For color manual pages, install \"most\" by entering: ${NC}"  \
  "\n${BRed}\"apt-get install most\" ${NC}\n"
fi

# Download the appropriate completion file from here:
# https://github.com/tmuxinator/tmuxinator/tree/master/completion
# and source the file:
source ~/.bin/tmuxinator.zsh


if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
else
    print ".zsh_aliases was not found."
fi


if [ -f ~/.zsh_functions ]; then
    source ~/.zsh_functions
else
    print ".zsh_functions was not found."
fi


if [ -d ~/.cargo ]; then
  source $HOME/.cargo/env
else
  print "Cargo – Rust's build automation system was not found on your system."
  print "Check if Rust installed on your system (rustc --version)."
fi

# Execute tmuxinator on startup
#tmuxinator android-setup

# Assuming you have fzf (A command-fuzzy liner) installed on your workstation:
# https://github.com/junegunn/fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# Assuming fs is installed on your environment:
# Taken from here: https://github.com/sharkdp/fd
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# A great tool for bash scripting:
# ShellCheck, a static analysis tool for shell scripts, should install for sure!
# A nice demonstration is here: https://www.youtube.com/watch?v=lbMsFXMnqNY
# https://github.com/koalaman/shellcheck

# A great tool which provides display and control of Android devices connected on USB,
# is "scrcpy" (go to the github repo and install it).


#$LD_LIBRARY_PATH:/usr/lib:
#export LD_LIBRARY_PATH=/home/gil_diy/.local/lib/python3.6/site-packages:/usr/lib/x86_64-linux-gnu/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
