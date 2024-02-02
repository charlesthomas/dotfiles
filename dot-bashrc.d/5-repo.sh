#!/bin/bash
export REPO_EDITOR=tmux
export REPO_TMUX=1

function repo() {
    dir=$(git repo-select $@ | tail -1)
    if [[ "" != "${dir}" ]]; then
        last=$(echo $dir | rev | cut -f 1 -d / | rev)

        if [ $REPO_TMUX -eq 1 ]; then
            n=$(tmux list-sessions -F \#S 2>/dev/null | grep $last | wc -l)
            if [ $n -eq 0 ]; then
                tmux new-session -c $dir -s $last &> /dev/null
            elif [ $n -eq 1 ]; then
                tmux attach -t $last &> /dev/null
            else
                echo ERROR too many sessions with name "$last"
            fi
        fi
    fi
}
