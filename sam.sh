#!/bin/bash

cpu=$(grep 'cpu' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}' )
echo "$cpu"
tmp=$(echo "$cpu * 100" | bc -l | cut -d'.' -f1)

if [ "$tmp" -ge 20 ]; 
then
    echo "CPU ALLERT"
else
echo "normal"
fi
