bwroot="${HOME}/.bw"
[ ! -e $bwroot ] && mkdir -p $bwroot

datadir="${HOME}/.config/Bitwarden CLI"
datafile="${datadir}/data.json"

tokendir="${HOME}/.tokens"
[ ! -e $tokendir ] && mkdir -p $tokendir

command -v bw >/dev/null
if [ $? -ne 0 ]; then
    echo
    echo "!!! bw missing !!!"
    return
fi

bwcreds="${bwroot}/creds.sh"
if [ ! -e $bwcreds ]; then
    echo
    echo "!!! ${bwcreds} missing !!!"
    return
fi
source $bwcreds

bwsession="${bwroot}/session.sh"
if [ ! -e "${bwsession}" ]; then
    if [ ! -e ${bwroot}/.configuredserver ]; then
        bw config server $BW_SERVER
        touch ${bwroot}/.configuredserver
    fi
    if [ ! -e ${bwroot}/.loggedin ]; then
        bw login --apikey
        touch ${bwroot}/.loggedin
    fi
    export BW_SESSION=$(bw unlock --raw --passwordenv BW_PASSWORD)
    if [ -z $BW_SESSION ]; then
        echo
        echo "!!! failed to load BW_SESSION !!!"
        return
    fi
    echo "export BW_SESSION=${BW_SESSION}" >> ${bwsession}
fi
source $bwsession

tokencsv="${bwroot}/tokens.csv"
if [ ! -e $tokencsv ]; then
    echo
    echo "!!! ${tokencsv} missing !!!"
    return
fi

for line in $(cat $tokencsv); do
    name=$(echo $line | cut -d , -f 1)
    kind=$(echo $line | cut -d , -f 2)
    item=$(echo $line | cut -d , -f 3)
    file="${tokendir}/${name}.sh"

    if [ ! -f $file ]; then
        token=
        token=$(bw get $kind $item)
        if [ -n $token ]; then
            echo "export ${name}=${token}" >> $file
        fi
    fi
done

for tokenfile in $(find $tokendir -type f); do
    source $tokenfile
done
