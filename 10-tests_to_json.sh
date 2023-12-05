#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <path>"

else 
    cd "$1"
    touch teraterm_output.json

    # Déclarer un tableau pour stocker les éléments success
    success_elements=()
    failure_elements=()

    for eachfile in ./*.log
    do
        if grep -q "TEST SUCCEEDED" "$eachfile"
        then
            date_line=$(grep -A 1 "SIM800 IMEI is:" "$eachfile" | head -n 1)
            date1=$(echo $date_line | cut -d' ' -f1 | tr -d '[')
            date2=$(echo $date_line | cut -d' ' -f2 | tr -d ']')
            date="$date1 $date2"

            imei_line=$(grep -A 1 "SIM800 IMEI is:" "$eachfile" | tail -n 1)
            imei=$(echo $imei_line | tr -d '\n\r' |  awk -F '] ' '{print $2}')

            rssi_virgule=$(grep "GSM SIGNAL IS GOOD AND RSSI IS:" "$eachfile" | awk -F'[: ]' '{print $NF}' | tr -d '\n\r')
            rssi="${rssi_virgule/,/}"

            success_elements+=("{ \"date\": \"$date\", \"imei\": \"$imei\", \"rssi\": \"$rssi\" }")
        else 
            date_line=$(grep -A 1 "SIM800 IMEI is:" "$eachfile" | head -n 1)
            date1=$(echo $date_line | cut -d' ' -f1 | tr -d '[')
            date2=$(echo $date_line | cut -d' ' -f2 | tr -d ']')
            date="$date1 $date2"

            imei_line=$(grep -A 1 "SIM800 IMEI is:" "$eachfile" | tail -n 1)
            imei=$(echo $imei_line | tr -d '\n\r' |  awk -F '] ' '{print $2}')

            failure_elements+=("{ \"date\": \"$date\", \"imei\": \"$imei\" }")

        fi
        
    done

    IFS=$','
    echo "{" > teraterm_output.json

    echo  "\"success\" : [ ">> teraterm_output.json
    echo  "${success_elements[*]}" >> teraterm_output.json
    echo  "],">> teraterm_output.json

    echo  "\"failure\" : [ ">> teraterm_output.json
    echo "${failure_elements[*]}" >> teraterm_output.json
    echo  "]">> teraterm_output.json

    echo "}" >> teraterm_output.json
fi
