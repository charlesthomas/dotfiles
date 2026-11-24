tokendir="${HOME}/.tokenz"
[ ! -e $tokendir ] && mkdir -p $tokendir

for tokenfile in $(find $tokendir -type f); do
    source $tokenfile
done

