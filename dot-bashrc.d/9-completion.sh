export COMPLETION_DIR=/tmp
if [ -d $HOMEBREW_PREFIX/etc/bash_completion.d ]; then
    export COMPLETION_DIR=$HOMEBREW_PREFIX/etc/bash_completion.d
fi

# standard location
echo
echo "sourcing ${COMPLETION_DIR}/..."

for file in $(find $COMPLETION_DIR); do
    if [ -f $file ]; then
        echo -n " $(basename $file)"
        source $file
    fi
done

# asdf
if [ -e ~/.asdf/completions/asdf.bash ]; then
    source ~/.asdf/completions/asdf.bash
fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# git -> g completion
if [ -e $COMPLETION_DIR/git-completion.bash ]; then
    ___git_complete g __git_main
fi

# kubectl -> kc completion
if [ -e $COMPLETION_DIR/kubectl.bash ]; then
    complete -o default -o nospace -F __start_kubectl kc
    complete -o default -o nospace -F __start_kubectl ktail
fi
