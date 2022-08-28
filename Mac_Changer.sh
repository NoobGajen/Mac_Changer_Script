#!/bin/bash

OPTIONS="$(iwconfig 2>&1 | grep -oP "^\w+")"
select int in $OPTIONS; do
    
    if [ -z "$int" ] ## int variable is for interface
    then
        echo -e "\nPlease choose correct interface"
        
        
    else
        
        # ### Mac changing message accordingly interface
        echo -e "\n#######_Changing_Mac_of_( $int )_#######"
        
        
        #######Code to Vailed Mac changer######
        ouimac=$(macchanger -l | shuf -n 1 | awk '{print$3}')
        uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
        ifconfig "$int" down
        macchanger -m  "$ouimac:$uaamac" "$int"
        ifconfig "$int" up
        
        
    fi
    break
done

