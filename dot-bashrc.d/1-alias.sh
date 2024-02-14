#!/bin/bash

# ls
# -F is flags (dirs get a slash)
# -G is colorized output (dirs are blue)
alias ls='ls -FG'
alias l='ls -1'
alias la='ls -a'
alias ll='ls -la'

# overwrite standard commands
alias cp='cp -v'
alias dim='vim -c ":set bg=dark" -c ":colorscheme solarized"'
alias find='find 2>/dev/null'
alias grep='grep -i --color'
alias jq='jq -r'
alias more='less'
alias mv='mv -v'
alias rm='rm -v'
alias tree='tree -I .git'
alias view='view -O'
alias vim='vim -O'
alias vsb='vim --cmd "set scrollbind"'

# one letter commands
# alias d='docker' # see ~/bin/d
alias h='history'
alias m='make'
alias r='repo'
alias t='tree'

# shorten commands
alias cx='chmod u+x'
alias ref='refresh'
alias repo='git repo-select'
alias tm='tmux attach || tmux'
alias ts='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
alias wl='wc -l'

# helpers
alias cdd='cd /Users/crthomas/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads'
alias today='date +%F'
alias refresh='source ~/.bashrc'

# typos
alias greo='grep'
alias biew='view'
alias bim='vim'
alias ciew='view'
alias cim='vim'
alias reop='repo'
