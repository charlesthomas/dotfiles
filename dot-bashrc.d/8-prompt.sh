#!/bin/bash

#colors
NONE="\[\e[0m\]"
RED="\[\e[0;31m\]"
CYAN="\[\e[0;36m\]"
GREEN="\[\e[0;32m\]"
PURPLE="\[\e[0;35m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[1;34m\]"

# enable / disable features
COLOR_PROMPT=${COLOR_PROMPT:-1}
EMOJI_PROMPT=${EMOJI_PROMPT:-1}
GIT_PROMPT=${GIT_PROMPT:-1}
K8S_PROMPT=${K8S_PROMPT:-1}
TIME_PROMPT=${TIME_PROMPT:-1}

if [[ "$(uname -s | tr '[:upper:]' '[:lower:]')" == "linux" ]]; then
    export EMOJI_PROMPT=0
fi

# set everything to empty
PRE_USER=""
POST_USER=""
PRE_HOST=""
POST_HOST=""
PRE_DIR=""
POST_DIR=""
PRE_GIT=""
IN_GIT=""
POST_GIT=""
PRE_K8S=""
IN_K8S=""
POST_K8S=""
PRE_TIME=""
POST_TIME=""

if [ $COLOR_PROMPT -eq 1 ]; then
    PRE_USER="${CYAN}"
    POST_USER="${NONE}"
    PRE_HOST="${CYAN}"
    POST_HOST="${NONE}"
    PRE_DIR="${PURPLE}"
    POST_DIR="${NONE}"
    PRE_GIT="${YELLOW}"
    POST_GIT="${NONE}"
    PRE_K8S="${RED}"
    POST_K8S="${NONE}"
fi

if [ $EMOJI_PROMPT -eq 1 ]; then
    PRE_USER="${PRE_USER}👤 "
    PRE_HOST="${PRE_HOST} 🖥 "
    PRE_DIR="${PRE_DIR} 📂 "
    IN_GIT=" 📦 "
    IN_K8S=" ☸️  "
    PRE_TIME="${PRE_TIME}🕰 "
    POST_TIME="${POST_TIME}  "
else
    PRE_HOST="${PRE_HOST}@"
    PRE_DIR="${PRE_DIR}"
    IN_GIT="${IN_GIT} on "
    IN_K8S="${IN_K8S} ⎈ "
    POST_TIME="${POST_TIME} "
fi

PS=""
PS="${PS}${PRE_USER}\u${POST_USER}"
PS="${PS}${PRE_HOST}\h ${POST_HOST}"
PS="${PS}${PRE_DIR}\w${POST_DIR}"
if [ $GIT_PROMPT -eq 1 ]; then
    # single quotes are important!
    # if they are missing, then the prompt won't update correctly
    PS="${PS}${PRE_GIT}"'$(__git_ps1 "${IN_GIT}%s")'"${POST_GIT}"
fi
if [ $K8S_PROMPT -eq 1 ]; then
    # single quotes are important!
    # if they are missing, then the prompt won't update correctly
    PS="${PS}${PRE_K8S}"'$(_k8s_prompt "${IN_K8S}%s" 2>/dev/null)'"${POST_K8S}"
fi
PS="${PS}\n"
if [ $TIME_PROMPT -eq 1 ]; then
    PS="${PS}${PRE_TIME}\d \t${POST_TIME}"
fi

function last_exit_prompt() {
    if [[ $? -eq 0 ]]; then
        PROMPTCOLOR=${GREEN}
    else
        PROMPTCOLOR=${RED}
    fi
    export PS1="${PS}${PROMPTCOLOR}\$${NONE} "
}

PROMPT_COMMAND="last_exit_prompt"
