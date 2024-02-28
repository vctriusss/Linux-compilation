#!/usr/bin/env bash

warn=70
alarm=90

cpu=$(top -bn 2 -d 0.2 | grep '^%Cpu' | tail -n 1 | awk '{printf "%d", $2+$4+$6}')

color='white'
if [ $cpu -gt $alarm ]
then
    color='red'
elif [ $cpu -gt $warn ]
then
    color='yellow'
fi
cpu="${cpu}%"

echo -e "<txt><span foreground="\'$color\'">  $cpu  </span></txt>"
echo -e "<tool>cpu: $cpu</tool>";
