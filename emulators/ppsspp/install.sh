#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

#apps copy
mkdir -p $APPS_DIR
cp $CURRENT_ABSOLUTE_DIR/files/ppsspp.sh $APPS_DIR

#install
flatpak install --user flathub org.ppsspp.PPSSPP
flatpak update --user org.ppsspp.PPSSPP

#cheat setup
mkdir -p $PPSSPP_PSP_DIR/Cheats/
wget -O $PPSSPP_PSP_DIR/Cheats/cheat.db https://raw.githubusercontent.com/Saramagrean/CWCheat-Database-Plus-/master/cheat.db

#config setup (controls.ini, ppsspp.ini )
mkdir -p $PPSSPP_PSP_DIR/SYSTEM/
cp $CURRENT_ABSOLUTE_DIR/configs/controls.ini $PPSSPP_PSP_DIR/SYSTEM
cp $CURRENT_ABSOLUTE_DIR/configs/ppsspp.$SYSTEM.ini $PPSSPP_PSP_DIR/SYSTEM
mv $PPSSPP_PSP_DIR/SYSTEM/ppsspp.$SYSTEM.ini $PPSSPP_PSP_DIR/SYSTEM/ppsspp.ini

#textures setup
mkdir -p $PPSSPP_PSP_DIR
ln -s $CURRENT_ABSOLUTE_DIR/symlinks/TEXTURES $PPSSPP_PSP_DIR/TEXTURES

#download textures
#TODO
