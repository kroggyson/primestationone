#!/bin/bash
source "/home/pi/primestationone/reference/lib/primestation_bash_functions.sh"

#TODO: Need to add parameter for default value to display in inputbox to have existing bluetooth mac address prepopulated to make this actually user friendly

fancy_console_message "Preparing to retrieve and then allow you to change your bluetooth adapter's MAC address..." "head-in"
installBluetoothMacAddressChanger.sh
firstBluetoothAdapterMacAddress=$(bdaddr | grep address | awk '{print $3}')

isPassword=0
ask_for_user_input_and_store_result "EDIT BLUETOOTH ADAPTER MAC" "Edit your bluetooth adapter's MAC address here, since many of the less expensive ones come with many of the same addresses!" "Please enter your desired bluetooth adapter's MAC address:" $isPassword 8 60 "$firstBluetoothAdapterMacAddress"
newDesiredBluetoothAdapterMacAddress="$RESULT"

fancy_console_message "Writing desired new bluetooth adapter MAC address $newDesiredBluetoothAdapterMacAddress over old address $firstBluetoothAdapterMacAddress..." "gnu"
sudo bdaddr -i hci0 "$newDesiredBluetoothAdapterMacAddress"

fancy_console_message "Hopefully that was successful in setting your desired address $newDesiredBluetoothAdapterMacAddress, which will not take effect until the bluetooth adapter resets.  The simplest way I know to do this is to restart.  So, I recommend you restart before proceeding.  Hopefully, someday someone will enhance this script to check for success / failure, but that day is not today.  --Prime"
