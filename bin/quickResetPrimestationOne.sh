#!/bin/bash

function pause()
{
    read -p "$*"
}

cowsay -f eyes Ensuring all files here are actually owned by the Pi user!
#sudo chown -R pi /home/pi/
sudo chown -hR pi:pi /home/pi/

removeUnneededAndOutdatedAptPackages.sh

cowsay -f elephant Installing first run files...
echo Installing first run files...
installFirstRunFiles.sh

echo =====================> Installing corrected blank gamelist.xml files...
installBlankGamelists.sh

clearFoldersThatMayHaveOldScripts.sh

autoStartEmulationstationEnforce.sh

retroPieNukeAndCheckoutFresh.sh

quickUpdatePrimestationOneFiles.sh
