#!/bin/bash
if [ -z $1 ]
then
    echo "Vous devez passer un paramètre au script, exemple : ./bonjour_param.sh antocreadev"
else
    echo "Bonjour $1"
fi 