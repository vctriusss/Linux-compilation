#!/usr/bin/env bash

warn=$((10*1024))
alarm=$((1*1024))
# mount path
path="/" && [[ $# -ne 0 ]] && path=$1

free=$(df -BM | grep "\s$path$" | awk '{printf "%d", $4}')
used=$(df -BM | grep "\s$path$" | awk '{printf "%d", $3}')

free_gb=$(bc -l <<<"${free}/1024" | awk '{printf "%.2f", $0}')
used_gb=$(bc -l <<<"${used}/1024" | awk '{printf "%.2f", $0}')

color='white'
if [ $alarm -gt $free ]
then
    color='red'
elif [ $warn -gt $free ]
then
    color='yellow'
fi

echo "<txt><span foreground="\'$color\'"> $free_gb Gb</span></txt>"
echo -e "<tool>Mount:\t$path\nUsed:\t$used_gb GB\nFree:\t$free_gb GB</tool>"
