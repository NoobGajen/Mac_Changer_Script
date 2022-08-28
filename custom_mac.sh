#!/bin/bash
read -p "Enter your mac address: " mac
OPTIONS="$(iwconfig 2>&1 | grep -oP "^\w+")"
select int in $OPTIONS; do
    
    if [ -z "$int" ] ## int variable is for interface
    then
        echo -e "\nPlease choose correct interface"
        
        
    else
        
        # ### Mac changing message accordingly interface
        echo -e "\n#######_Changing_Mac_of_( $int )_#######"
        
        
        #######Code to Vailed Mac changer######
        ifconfig "$int" down
        macchanger -m  "$mac" "$int"
        ifconfig "$int" up
        
    fi
    break
done

