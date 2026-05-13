#!/bin/bash
export KC_DEV_EXEC=PATH

alias mg='make oldgenerate || make generate'

WORKHOSTS="crt-influx-mbp mini"
if [[ "${WORKHOSTS}" =~ "$(hostname -s)" ]]; then
    export REPO_ORG=influxdata
fi
