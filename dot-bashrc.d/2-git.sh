export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_ASKPASS=~/bin/git-askpass

alias reb='rebase'

function rebase() {
    num=2
    if [ ! -z $1 ]; then
        num=$1
    fi
    git rebase -i HEAD~$num
}
