# Apple Silicon macOS brew installs things to /opt/homebrew,
# so do this now before you forget
if [ -e /opt/homebrew ]; then
    export HOMEBREW_PREFIX=/opt/homebrew
else
    export HOMEBREW_PREFIX=/usr/local
fi

export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar";
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}";
export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin:${PATH}";
export MANPATH="${HOMEBREW_PREFIX}/share/man:${MANPATH}";
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}";

if [ -x $HOMEBREW_PREFIX/bin/bat ]; then
    alias cat='bat'
    alias pat='cat -p'
fi

if [ -x $HOMEBREW_PREFIX/bin/gecho ]; then
    alias echo='gecho'
fi
if [ -x $HOMEBREW_PREFIX/bin/gmake ]; then
    alias make='gmake'
fi
