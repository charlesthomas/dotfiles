#!/bin/bash
# Set up fzf key bindings and fuzzy completion
# only works on mac for some reason
[[ "$(uname -s)" == Darwin ]] && eval "$(fzf --bash)"
