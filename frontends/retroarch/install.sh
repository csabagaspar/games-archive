#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

CACHE=$CURRENT_ABSOLUTE_DIR/../../cache

#install
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.libretro.RetroArch
flatpak update --user org.libretro.RetroArch

#dirs
mkdir -p $RA_CONFIG_DIR
mkdir -p $RA_CORES_DIR
mkdir -p $RA_SYSTEM_DIR

#ra.sh
cp $CURRENT_ABSOLUTE_DIR/configs/ra.sh $APPS_DIR

#scummvm_custom.sh
cp $CURRENT_ABSOLUTE_DIR/configs/scummvm_custom.sh $APPS_DIR

#retroarch.cfg
cp $CURRENT_ABSOLUTE_DIR/configs/retroarch.$SYSTEM.cfg $RA_CONFIG_DIR
mv $RA_CONFIG_DIR/retroarch.$SYSTEM.cfg $RA_CONFIG_DIR/retroarch.cfg

#retroarch-core-options.cfg
cp $CURRENT_ABSOLUTE_DIR/configs/retroarch-core-options.cfg $RA_CONFIG_DIR

#scummvm.ini
cp $CURRENT_ABSOLUTE_DIR/configs/scummvm.$SYSTEM.ini $RA_SYSTEM_DIR
mv $RA_SYSTEM_DIR/scummvm.$SYSTEM.ini $RA_SYSTEM_DIR/scummvm.ini

#bios
for SYSTEM in "${RA_SYSTEMS[@]}"; do
  unzip -q -o "$CACHE/$SYSTEM" -d "$RA_SYSTEM_DIR"
done

#cores
for CORE in "${RA_CORES[@]}"; do
  unzip -q -o "$CACHE/$CORE.so.zip" -d "$RA_CORES_DIR"
done

