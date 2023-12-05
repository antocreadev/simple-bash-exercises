#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ]
then
    echo "Vous devez passer deux paramètres au script, exemple : ./somme_param.sh 36 30"
else
    result=$(($1 + $2))
    echo "$result"
fi
