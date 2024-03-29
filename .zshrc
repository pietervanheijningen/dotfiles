# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
DISABLE_UPDATE_PROMPT=true
# Path to your oh-my-zsh installation.
export ZSH="/Users/pvh/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="candy"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#####################################################
########## Custom stuff beyond this point ###########
#####################################################

# make default dir ~/_~
if [[ $PWD == $HOME ]]; then
    cd ~/_
fi

# make default editor vim
export EDITOR=vim

# use gnu based programs instead of freebsd
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/curl/bin:$PATH"
PATH="/usr/local/Cellar/python@3.9/3.9.8/bin:$PATH"
export PATH="/usr/local/opt/curl-openssl/bin:$PATH"

# zsh plugin(s)
source /Users/pvh/.oh-my-zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# fixes some errors with less
export LC_ALL=en_US.UTF-8

# make go work
export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin

# run in a pipe to open html in chrome
alias chrome='base64 -w 0 | read val; chrome-cli open "data:text/html;base64,$val" >/dev/null'

# common directory shortcuts
# home
alias h="cd ~/_"
# git repos
alias g="cd ~/_repos"
# java practice thats not on git
alias i="cd ~/IdeaProjects"

# start working on a repository w/ intellij
ide() {
  if [ -d "$1" ]; then
    idea $1 && cd $1 && git status;
  elif [ -f "$1" ]; then
    idea $1;
  else
    echo "$1 is not a directory or a file \n"
  fi
}

# stop homebrew from autoupdating every nanosecond of its existence
export HOMEBREW_NO_AUTO_UPDATE=1

# stop zsh from prompting me every nanosecond of its existence
export DISABLE_UPDATE_PROMPT=true
export DISABLE_AUTO_UPDATE="true"

# make ls have colors
alias ls="ls --color=yes"

# stop docker-compose typo's lol
docker() {
    if [[ $1 == "compose" ]]; then
        command docker-compose "${@:2}"
    else
        command docker "${@:1}"
    fi
}

# mysql login cmd
alias sql="mysql -u root -ptest123"

pcp() {
    bash -c '
    read -ep "Commit message: " message

    git pull && \
    git add -u && \
    git commit -m "${message}" && \
    git push'
}
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"


# Load Angular CLI autocompletion.
source <(ng completion script)
