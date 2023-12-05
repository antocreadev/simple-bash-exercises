#!/bin/bash

if [ -z "$1" ]
then
    echo "Nombre d'arguments incorrect"
else
    cd ./TP_ex8
    mylogs=`ls ./*.log`

    if [ $1 == "ERROR" ]
    then
        for eachfile in $mylogs
            do
            grep $1 $eachfile
        done
    fi

    if [ $1 == "WARNING" ]
    then
        for eachfile in $mylogs
            do
            grep -e ERROR -e WARNING $eachfile
        done
    fi


    if [ $1 == "INFO" ]
    then
        for eachfile in $mylogs
            do
            grep -e ERROR -e WARNING -e INFO $eachfile
        done
    fi

fi

