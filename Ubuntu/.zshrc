# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$

# Adding some scripts for increasing my productivity
PATH=$PATH:$HOME/my_useful_scripts

# Adding some anconda to my path
PATH="/home/gil_diy/anaconda3/bin:$PATH"

# Adding my documentations to my path
export DOC_MD_PATH="/home/gil_diy/myGitRepositories/customized-workspace/Ubuntu/useful-resources/"

# Path to your oh-my-zsh installation.
export ZSH=/home/gil_diy/.oh-my-zsh

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
  )

source $ZSH/oh-my-zsh.sh

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

# A great extension for colorizing tools
# should install download the "Generic Colouriser" installer
# taken from here: http://korpus.juls.savba.sk/~garabik/software/grc/

if [ -e /usr/bin/grc ]; then
	alias netstat='grc netstat'
	alias ping='grc ping'
	alias tail='grc tail'
	alias ps='grc ps aux'
else
	echo -e "\n${BWhite}For colorizing linux tools (ping/netstat/tail/ps) ${NC},"  \
  "\n${BRed}you should install \"grc\" by entering:\"apt-get install grc\" ${NC}\n"
fi

# Download the appropriate completion file from here:
# https://github.com/tmuxinator/tmuxinator/tree/master/completion
# and source the file:
source ~/.bin/tmuxinator.zsh

######## Aliases ########

alias r=rotate_image                # Rotate image
alias s=source_me
alias c=count_lines
alias i=get_info                    # Get size and dpi of image
alias ag='ag --hidden'              # Search in hidden directories too (assuming .agignore was respected).

alias ll="ls -la --color \
                 --human-readable \
                 --group-directories-first" # list files nicely

alias pdfgrep="pdfgrep  --recursive \
                        --page-number \
                        --include \"*.pdf\" "

alias run="pipenv run python "      # Executing python script faster with pipenv
alias rm="rm -i"				            # Prompt before permanently remove files
alias cp="cp -i"               			# Prompt before overwrite
alias scp="scp -r"                  # Secure copy with recursively copy so it means entire directories.
alias ssh="ssh -x"                  # Ssh with enabled X11 forwarding
alias 'crontab -r'='crontab -i' 		# Prompt before actually removing the crontab
#alias make=my-make 		              #

alias histg="history | grep "			  # Combine history with grep
alias history=" history -E"
alias lsg="ll | grep "              # Combine list files with grep

alias pgrep="pgrep --list-full"			# lookup a process
alias psg="pgrep --list-full"       # lookup a process

alias top="htop"                    # Execute the interactive process viewer
alias locate="sudo updatedb; locate --ignore-case "

alias locateh=locate-here           # locate here under the current folder
alias watchl='watch --color ls -la --color'	# list and watch files and folders with color

alias sublime="subl"				        # Execute sublime editor
alias {pycharm,charm}="nohup charm  > /dev/null &"
alias firefox="firefox --ProfileManager &" # For setting my current working profile

alias android="~/android-studio/bin/studio.sh &" # Execute Android-studio easily
alias adb='~/Android/Sdk/platform-tools/adb' 	 # Execute Android Debug Bridge (adb)

# Prints all android packages
# (Great reference: https://developer.android.com/studio/command-line/adb#pm)
alias ls-my-android-packages='adb shell pm list packages codingforpleasure'
alias rm-android-app='adb shell pm uninstall '
alias straceg=strace-and-grep $1 $2

alias exif="EXIF.py "				        # extract Exif metadata from tiff and jpeg files
alias dis='display '
alias tes='tesseract '
alias du='du --summarize --human-readable' # Disk space usage nicer output

alias display='feh -i' #impressive_display

alias rsync="rsync --verbose \
              --progress \
              --human-readable \
              --archive"

alias toc-markdown-generate='gh-md-toc --insert '  # Generates Table-Of-Content for a given markdown

# My documentation tweaks
alias help=helper                 # Assuming tldr client in installed on your system
alias doc-view=helper
alias doc-edit=documentation-edit $1
alias doc-ls=documentation-list

### some git aliases ###
alias cdg='cd $(git rev-parse --show-toplevel)' # jump to repo's root directory (where the .git resides)
alias hookg='cd $(git rev-parse --show-toplevel)/.git/hooks'
alias ghook='hookg'
alias ga="git add --interactive"		# Add modified contents in the working tree interactively to the index
alias gadd="git add --interactive"    # Add modified contents in the working tree interactively to the index
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gap='git apply'
alias master='git checkout master'
alias dev='git checkout dev'
alias back='git checkout -'
alias new='git checkout -b'
alias checkout='git checkout'
alias branch='git branch'
alias branches='git branch -a'
alias rmbranch='git branch -D'
alias unstage='git reset HEAD'
alias unstageall='git reset HEAD .'
alias undo='git reset --soft HEAD^'
alias undopush='git push -f origin HEAD^:master'
alias gc='git commit'
alias gca='git commit --amend -m'
alias push='git push'
alias stash='git stash -k -u'
alias stashall='git stash --include-untracked'
alias pop='git stash pop'

# Aliases for paths
alias ubuntu='cd ~/myGitRepositories/customized-workspace/Ubuntu'
alias myscripts='cd ~/my_useful_scripts'
alias gitrep='cd ~/myGitRepositories'   # Go to my repos collection
alias snippe{t,s}='cd ~/.config/sublime-text-3/Packages/User'
alias rsnippet='cd ~/.R/snippets'

# Execute tmuxinator on startup
tmuxinator android-setup

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


###### Functions ######

function rotate_image(){
  convert $1 -rotate $2 rotated_$2_$1
  echo "Output image: rotated_$2_$1"
}

function get_info() {
  identify -format "Image size:%w x %h \nImage DPI: %x x %y\n" $1
}

function source_me() {
   echo $fg_bold[yellow]"Sourcing ~\.zshrc"
   source ~/.zshrc
}

function count_lines() {
  num=$(ll | wc -l)
  echo $fg_bold[green] "Number of lines: $num"
}

function strace-and-grep(){

  # since strace prints its traces on standard error, not on standard output
  # if [[ $1=="adb" ]]; then
  #   echo "Grepping: $3"

  # fi

  echo "Binary file: $1"
  echo "Grepping: $2"
}

function documentation-list(){
	echo $fg_bold[cyan]"All documentations listed below:"$fg_bold[white]
	echo ""
	ls -1 ${DOC_MD_PATH}
	echo ""
}

function documentation-edit(){
	if [ $# -eq 0 ]; then
		echo $fg_bold[red] "add argument!!"
		exit 1
	fi

	# search for file in directory if found the execute then edit it.

	local FILENAME=$1.md
	/usr/bin/subl ${DOC_MD_PATH}/"${FILENAME}"
}


function locate-here(){
  # Locate files under the current directory
  locate $1 | grep $PWD
}

function helper(){
    if [ $# -eq 0 ]; then
      echo $fg_bold[red] "add argument!!"
      exit 1
    fi

    python `which doc-helper.py` $1
    tldr $1
}

function ask_yes_or_no() {
    read "answer?$1 ([y]es or [N]o): "
    case $(echo $answer | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

#
# TODO function description
# @param  TODO The first parameter
# @return
#function_impresive_display() {
#  feh -l | awk '{ print $3" "$4" "$8 }'
#
#}


# function my-make(){
#   if [ $# -eq 0 ]; then
#     /usr/bin/make --just-print
#     echo $fg_bold[red] "\n Attention: just ran dry-run (Printed the commands that would be executed)"
#     echo $fg_bold[white]
#     if [[ "no" == $(ask_yes_or_no " Would you like now to run make, now?") ]]
#     then
#       echo "Skipped."
#       exit 0
#     fi
#     /usr/bin/make
#   else
#     /usr/bin/make "$@"
#   fi
# }
