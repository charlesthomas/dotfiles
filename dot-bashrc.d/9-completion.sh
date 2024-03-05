# linux
export COMPLETION_DIR=/usr/share/bash-completion/completions

# macOS
if [ -d ${HOMEBREW_PREFIX}/etc/bash_completion.d ]; then
    export COMPLETION_DIR=${HOMEBREW_PREFIX}/etc/bash_completion.d
fi

for file in $(find $COMPLETION_DIR -type f -o -type l); do
    source $file 2>/dev/null
done

# asdf
[ -f ~/.asdf/completions/asdf.bash ] && source ~/.asdf/completions/asdf.bash

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# git (linux; it's in $COMPLETION_DIR in macOS)
[ -f /etc/bash_completion.d/git-prompt ] && source /etc/bash_completion.d/git-prompt

# git -> g completion
#                       macOS                                         linux
if [ -f $COMPLETION_DIR/git-completion.bash ] || [ -f $COMPLETION_DIR/git ]; then
    ___git_complete g __git_main
fi

# kubectl -> kc completion
#                       macOS                                  linux
if [ -f $COMPLETION_DIR/kubectl.bash ] || [ -f $COMPLETION_DIR/kubectl ]; then
    complete -o default -o nospace -F __start_kubectl kc
    complete -o default -o nospace -F __start_kubectl ktail
fi
