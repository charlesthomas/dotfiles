export KUBEROOT=${HOME}/.kube/config.d/
if [ -e ${KUBEROOT}/influx.conf ]; then
    export KUBECONFIG=${KUBEROOT}/influx.conf
    export REPO_ORG=influxdata
else
    export KUBECONFIG=${KUBEROOT}/homelab.conf
fi

