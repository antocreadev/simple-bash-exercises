#!/bin/bash


# FAIT SUR MAC 
# https://stackoverflow.com/questions/4247068/sed-command-with-i-option-failing-on-mac-but-works-on-linux

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <ServerName> <DBHost> <DBUser>"
else
    echo "$1"
    echo "$2"
    echo "$3"
    sed -i '' -e "s|ServerName.*|ServerName $1|g" ./9-config.conf
    sed -i '' -e "s|DBHost.*|DBHost $2|g" ./9-config.conf
    sed -i '' -e "s|DBUser.*|DBUser $3|g" ./9-config.conf
fi