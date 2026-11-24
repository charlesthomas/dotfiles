#!/bin/bash
export REPO_CODE_DIR=${HOME}/code
export REPO_EDITOR=tmux
export REPO_HOST=github.com
export REPO_TMUX=1

alias reop='repo'

function repo() {
    dir=$(git repo-select $@ | tail -1)
    if [[ "" != "${dir}" ]]; then
        cd "$dir"
    fi
}
