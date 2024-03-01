bwroot="${HOME}/.bw"
blankdata="${bwroot}/data.json"

datadir="${HOME}/.config/Bitwarden CLI"
datafile="${datadir}/data.json"

command -v bw >/dev/null
if [ $? -ne 0 ]; then
    echo
    echo "!!! bw missing !!!"
    return
fi

bwtokens="${bwroot}/bw_tokens.sh"
if [ ! -e $bwtokens ]; then
    echo
    echo "!!! ${bwtokens} missing !!!"
    return
fi
source $bwtokens

if [ ! -e "${datafile}" ]; then
    mkdir -p "${datadir}"
    cp -v $blankdata "${datafile}"
fi

bwsession="${bwroot}/bw_session.sh"
if [ ! -e "${bwsession}" ]; then
    export BW_SESSION=$(bw login $(echo -n $BW_USER) --raw --passwordenv BW_PASSWORD 2>/dev/null || bw unlock --raw --passwordenv BW_PASSWORD 2>/dev/null)
    if [ -z $BW_SESSION ]; then
        echo
        echo "!!! failed to load BW_SESSION !!!"
        return
    fi
    echo "export BW_SESSION=${BW_SESSION}" >> ${bwsession}
fi
source $bwsession

tokendir="${bwroot}/tokens/"
mkdir -p $tokendir

tokencsv="${bwroot}/tokens.csv"
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
