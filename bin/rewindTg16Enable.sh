#!/bin/bash

message="Enabling TG16 - PCENGINE emulation rewind feature which may cause massive slowdown just being on..."
echo "$message"
cowsay -f eyes "$message"

source "/home/pi/RetroPie-Setup/scriptmodules/helpers.sh"
source "/home/pi/RetroPie-Setup/scriptmodules/inifuncs.sh"
iniConfig " = " "" "/opt/retropie/configs/pcengine/retroarch.cfg"
iniSet "rewind_enable" "true"
iniUnset "rewind_buffer_size" "20"
iniUnset "rewind_granularity" "2"
ensureRetroarchEmuConfigsIncludesAreLast.sh
