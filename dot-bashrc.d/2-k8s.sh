alias cc='kc config current-context | cut -f 1 -d /'
alias ks='kc'
alias mk='minikube'

function _k8s_prompt() {
    if [[ "" != $(which kubectl) ]]; then
        context=$(kubectl config current-context | sed 's/\//-/g')
        namespace=$(kubectl config view --minify --output "jsonpath={..namespace}" 2>/dev/null)
        if [[ "" == $namespace ]]; then
            namespace=default
        fi
        if [[ "" != $context ]]; then
            echo -e "$1" | tr -d '/' | sed s/%s/$context:$namespace/
        fi
    fi
}

if [ -e $COMPLETION_DIR/kubectl ] && [ -e ~/bin/kc ]; then
    if [[ $(type -t compopt) = "builtin" ]]; then
        complete -o default -F __start_kubectl kc
    else
        complete -o default -o nospace -F __start_kubectl kc
    fi
fi

function ns() {
    if [ -z $1 ]; then
        echo $(kubectl config view --minify --output "jsonpath={..namespace}" 2>/dev/null)
    else
        kubectl config set-context --current --namespace=$1
    fi
}

# k8s autocomplete craps out on macOS out of the box
# found these scripts here:
# https://github.com/scop/bash-completion/blob/2.10/bash_completion

_filedir()
{
    local IFS=$'\n'

    _tilde "$cur" || return

    local -a toks
    local reset

    if [[ "$1" == -d ]]; then
        reset=$(shopt -po noglob); set -o noglob
        toks=( $(compgen -d -- "$cur") )
        IFS=' '; $reset; IFS=$'\n'
    else
        local quoted
        _quote_readline_by_ref "$cur" quoted

        # Munge xspec to contain uppercase version too
        # http://thread.gmane.org/gmane.comp.shells.bash.bugs/15294/focus=15306
        # local xspec=${1:+"!*.@($1|${1^^})"} plusdirs=()

        # Use plusdirs to get dir completions if we have a xspec; if we don't,
        # there's no need, dirs come along with other completions. Don't use
        # plusdirs quite yet if fallback is in use though, in order to not ruin
        # the fallback condition with the "plus" dirs.
        local opts=( -f -X "$xspec" )
        [[ $xspec ]] && plusdirs=(-o plusdirs)
        [[ ${COMP_FILEDIR_FALLBACK-} ]] || opts+=( "${plusdirs[@]}" )

        reset=$(shopt -po noglob); set -o noglob
        toks+=( $(compgen "${opts[@]}" -- $quoted) )
        IFS=' '; $reset; IFS=$'\n'

        # Try without filter if it failed to produce anything and configured to
        [[ -n ${COMP_FILEDIR_FALLBACK:-} && -n "$1" && ${#toks[@]} -lt 1 ]] && {
            reset=$(shopt -po noglob); set -o noglob
            toks+=( $(compgen -f "${plusdirs[@]}" -- $quoted) )
            IFS=' '; $reset; IFS=$'\n'
        }
    fi

    if [[ ${#toks[@]} -ne 0 ]]; then
        # 2>/dev/null for direct invocation, e.g. in the _filedir unit test
        compopt -o filenames 2>/dev/null
        COMPREPLY+=( "${toks[@]}" )
    fi
} # _filedir()

_tilde()
{
    local result=0
    if [[ $1 == \~* && $1 != */* ]]; then
        # Try generate ~username completions
        COMPREPLY=( $(compgen -P '~' -u -- "${1#\~}") )
        result=${#COMPREPLY[@]}
        # 2>/dev/null for direct invocation, e.g. in the _tilde unit test
        [[ $result -gt 0 ]] && compopt -o filenames 2>/dev/null
    fi
    return $result
}

_quote_readline_by_ref()
{
    if [[ $1 == \'* ]]; then
        # Leave out first character
        printf -v $2 %s "${1:1}"
    else
        printf -v $2 %q "$1"
    fi

    # If result becomes quoted like this: $'string', re-evaluate in order to
    # drop the additional quoting.  See also: http://www.mail-archive.com/
    # bash-completion-devel@lists.alioth.debian.org/msg01942.html
    [[ ${!2} == \$* ]] && eval $2=${!2}
} # _quote_readline_by_ref()
