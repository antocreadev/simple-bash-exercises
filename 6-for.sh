#!/bin/bash

if [ -z "$1" ]
then
    echo "Nombre d'arguments incorrect"
else
    for (( i=0; i<=$1; i++ ))
    do  
        echo "$i"
    done
fi