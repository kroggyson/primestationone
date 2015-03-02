#!/bin/bash

cowsay -f hellokitty Installing binsnroms_large archive...
echo =====================> Installing binsnroms_large archive...

pushd ~

rm binsnroms_large.7z
rm -rf binsnroms_large
megadl 'https://mega.co.nz/#!BU9z3Z6Y!lbkXTNwzf7EpiyK1WIKhgs7UxnuhxZ0zVIpqVciP7n8'
echo Extracting 7z archive.....
7z -d binsnroms_large.7z
cd binsnroms_large
echo Installing....
./installToPrimestationOne.sh
cd ..

echo Cleaning up...
rm binsnroms_large.7z
rm -rf binsnroms_large
echo Resetting permissions on roms and BIOS folders...
sudo chmod -R 777 ~/RetroPie

popd
echo If you saw any errors, you might consider running a quickUpdatePrimestationOneFiles.sh to ensure you have the latest mega dl link in this script...
