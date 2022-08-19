for i in $(iwconfig 2>&1 | grep -oP "^\w+" | grep -v lo)
do
	
### Mac changing message accordingly interface
echo -e "\n#######_Changing_Mac_for_( $i )_#######"

########Code to Vailed Mac changer######
ouimac=$(macchanger -l | shuf -n 1 | awk '{print$3}')
uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
ifconfig "$i" down
macchanger -m  "$ouimac:$uaamac" "$i"
ifconfig "$i" up
done

