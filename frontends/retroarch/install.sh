#!/bin/bash

source ./ra.env

#install
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.libretro.RetroArch
flatpak update --user org.libretro.RetroArch

cp ./ra.sh $APPS_DIR

#CORES
mkdir -p "$CORES_DIR"
## download cores
for CORE in "${CORES_TO_DOWNLOAD[@]}"; do
  curl "$CORES_DOWNLOAD_URL$CORE.so.zip" --output "$CORES_DIR/${CORE}.zip"
done

## extract cores
for entry in "$CORES_DIR"/*.zip; do
  unzip -q -o "$entry" -d "$CORES_DIR"
done

for entry in "$CORES_DIR"/*.zip; do
  rm -f "$entry"
done

#retroarch.cfg
mkdir -p $CONFIG_RA_DIR
cp ./configs/retroarch.$SYSTEM.cfg $CONFIG_RA_DIR
mv $CONFIG_RA_DIR/retroarch.$SYSTEM.cfg $CONFIG_RA_DIR/retroarch.cfg
cp ./configs/retroarch-core-options.cfg $CONFIG_RA_DIR

#system
ln -s `readlink -f ./files/system` $CONFIG_RA_DIR/system

#saves and states
ln -s `readlink -f ./files/saves` $CONFIG_RA_DIR/saves
ln -s `readlink -f ./files/states` $CONFIG_RA_DIR/states

#config
ln -s `readlink -f ./files/config` $CONFIG_RA_DIR/config

#overlays
ln -s `readlink -f ./files/overlays` $CONFIG_RA_DIR/overlays
