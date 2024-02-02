#!/bin/bash
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# append history, so it should be shared across sessions
shopt -s histappend

# standard bashrc
export EDITOR=vim
export HISTTIMEFORMAT="%F %T "
export LESS=-RFX
export PAGER=less

#bin
if [ -e ~/bin ]; then
    PATH=~/bin:"${PATH}"
fi

#functions
function hl() { egrep --color -ie $@ -e '$'; }
function hline() { egrep --color -e '.*'$@'.*' -e '$'; }

# mimic macOS pbcopy/pbpaste in linux
if [[ "$(uname)" != "Darwin" ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

export RIPGREP_CONFIG_PATH=~/.config/ripgrep/config

