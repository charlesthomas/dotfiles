GCLOUD_BIN="${HOMEBREW_PREFIX}/share/google-cloud-sdk/bin/"
if [ -e $GCLOUD_BIN ]; then
    export PATH="${PATH}:${GCLOUD_BIN}"
fi
