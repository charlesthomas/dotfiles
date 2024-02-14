tokenfile="${HOME}/.bw/env.sh"
if [ ! -e $tokenfile ]; then
    # without this file we can't do anything else
    echo
    echo "!!! ${tokenfile} missing !!!"
else
    # source the tokens
    source ${tokenfile}

    # do we already have a session?
    if [ -z $BW_SESSION ]; then
        # no; can we get it from /tmp?
        if [ ! -e /tmp/.bw_session ]; then
            # no; make it

            # unlock bw vault first
            export BW_SESSION=$(bw unlock --raw --passwordenv BW_PASSWORD 2>/dev/null)

            # store tokens
            echo "export BW_SESSION=${BW_SESSION}" >> /tmp/.bw_session
            echo "export GITHUB_TOKEN=$(bw get password f5943083-75ee-482b-851b-213609bf90bb)" >> /tmp/.bw_session
            echo "export QUAY_CD_USER=$(bw get username 8c54892c-c522-4a17-8498-11816b4cdfaf)" >> /tmp/.bw_session
            echo "export QUAY_CD_PASSWORD=$(bw get password 8c54892c-c522-4a17-8498-11816b4cdfaf)" >> /tmp/.bw_session
        fi

        # now we definitely have the session; source it
        source /tmp/.bw_session
    fi
fi

