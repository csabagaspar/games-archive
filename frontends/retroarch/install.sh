#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

#install
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.libretro.RetroArch
flatpak update --user org.libretro.RetroArch

cp $CURRENT_ABSOLUTE_DIR/files/ra.sh $APPS_DIR

#CORES
mkdir -p "$RA_CORES_DIR"
## download cores
for CORE in "${RA_CORES_TO_DOWNLOAD[@]}"; do
  curl "$RA_CORES_DOWNLOAD_URL/$CORE.so.zip" --output "$RA_CORES_DIR/${CORE}.zip"
done

## extract cores
for entry in "$RA_CORES_DIR"/*.zip; do
  unzip -q -o "$entry" -d "$RA_CORES_DIR"
done

for entry in "$RA_CORES_DIR"/*.zip; do
  rm -f "$entry"
done

#retroarch.cfg
mkdir -p $RA_CONFIG_DIR
cp $CURRENT_ABSOLUTE_DIR/configs/retroarch.$SYSTEM.cfg $RA_CONFIG_DIR
mv $RA_CONFIG_DIR/retroarch.$SYSTEM.cfg $RA_CONFIG_DIR/retroarch.cfg

#retroarch-core-options.cfg
cp $CURRENT_ABSOLUTE_DIR/configs/retroarch-core-options.cfg $RA_CONFIG_DIR



#saves and states
#TODO do not save?
ln -s $CURRENT_ABSOLUTE_DIR/symlinks/saves $RA_CONFIG_DIR/saves
ln -s $CURRENT_ABSOLUTE_DIR/symlinks/states $RA_CONFIG_DIR/states


#overlays
#TODO download
ln -s $CURRENT_ABSOLUTE_DIR/symlinks/overlays $RA_CONFIG_DIR/overlays

#config
#TODO download
ln -s $CURRENT_ABSOLUTE_DIR/symlinks/config $RA_CONFIG_DIR/config

#system, bios etc.
#TODO download
ln -s $CURRENT_ABSOLUTE_DIR/symlinks/system $RA_CONFIG_DIR/system
