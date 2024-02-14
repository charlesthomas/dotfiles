export FIGNORE=$FIGNORE:.pyc:.egg-info

# pipx stuff
PIPX_PATH=~/.local/bin
if [[ -e $PIPX_PATH ]]; then
    export PATH="${PATH}:${PIPX_PATH}"
fi

export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=~/.pip_download_cache

alias black='black -S'
alias ipython='/home/crthomas/.local/bin/ipython --no-confirm-exit --no-banner'
