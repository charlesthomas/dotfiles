#!/bin/bash
WORKHOSTS="crt-influx-mbp ct-dev-box"
INFLUXKCFG=~/.kube/config.d/influx.conf

if [[ "${WORKHOSTS}" =~ "$(hostname -s)" ]]; then
    export REPO_ORG=influxdata
    if [ -f $INFLUXKCFG ]; then
        export KUBECONFIG=$INFLUXKCFG
    fi
fi
