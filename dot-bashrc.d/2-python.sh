# pipx stuff
PIPX_PATH=~/.local/bin
if [[ -e $PIPX_PATH ]]; then
    export PATH="${PIPX_PATH}:${PATH}"
fi

export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=~/.pip_download_cache
export FIGNORE=$FIGNORE:.pyc:.egg-info

alias black='black -S'
alias ipython='/home/crthomas/.local/bin/ipython --no-confirm-exit --no-banner'
