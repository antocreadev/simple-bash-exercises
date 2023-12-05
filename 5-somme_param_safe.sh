#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ]
then
    echo "Nombre d'arguments incorrect"
else
    result=$(($1 + $2))
    echo "$result"
fi
