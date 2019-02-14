#!/bin/bash

[ -z "$PS1" ] && return

shopt -s checkwinsize # Update the values of LINES and COLUMNS.
shopt -s cdable_vars
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar


#Enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

#History
shopt -s histappend # append to the history file, don't overwrite it
export HISTCONTROL=ignoreboth # don't duplicate lines or lines starting with space in the history.
export HISTSIZE=1000
export HISTFILESIZE=10000

#Default Editorys
export EDITOR=vim
export VISUAL=vim

# File to run when create an interactive shell
export ENV=${HOME}/.bashrc

## Global User Language Text Encoding
export LANG="en_US.UTF-8"

## PATH to Libraries
export LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:.

## Basic PATH for standard utilities
export PATH=/bin
export PATH=${PATH}:/sbin
export PATH=${PATH}:/usr/sbin
export PATH=${PATH}:/usr/bin
export PATH=${PATH}:/usr/local/bin

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set file creation mode mask, for NFS and unix.  Set so user has full rights
# and world has r and maybe x rights
umask 022

#Prompt
#Colors
reset="\e[0m";
bold="\e[1m";
black="\e[30m";
red="\e[31m";
green="\e[32m";
yellow="\e[33m";
blue="\e[34m";
magenta="\e[35m";
cyan="\e[36m";
light_gray="\e[37m";
yellow="\e[33m";
dark_gray="\e[90m";
light_red="\e[91m";
light_green="\e[92m";
light_yellow="\e[93m";
light_blue="\e[94m";
light_magenta="\e[95m";
light_cyan="\e[96m";
white="\e[97m";

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
  userStyle="${red}";
else
  userStyle="${orange}";
fi; # Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
  hostStyle="${bold}${red}";
else
  hostStyle="${yellow}";
fi;

# Set the terminal title to the current working directory.
PS1="\[${reset}\]";
PS1+="\[${userStyle}\]\u"; # username
PS1+="\[${light_gray}\]@";
PS1+="\[${hostStyle}\]\h"; # host
PS1+="\[${light_gray}\] in ";
PS1+="\[${green}\]\w"; # working directory
#PS1+="\$(prompt_git \"${white} on ${violet}\")"; # Git repository details
PS1+="\n";
PS1+="\[${light_gray}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1

#Functions
function cs() { cd "$@" && ls; }

#Aliases
# Enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#git Aliases
alias ga='git add'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gb='git branch'
alias gpush='git push'
alias gpull='git pull'
alias gc='git checkout'

#Load fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
