#!/bin/bash

source ./ppsspp.env

#apps copy
mkdir -p $APPS_DIR
cp ./ppsspp.sh $APPS_DIR

#install
flatpak install --user flathub org.ppsspp.PPSSPP
flatpak update --user org.ppsspp.PPSSPP

#cheat setup
mkdir -p $PPSSPP_CONFIG_DIR/Cheats/
wget -O $PPSSPP_CONFIG_DIR/Cheats/cheat.db https://raw.githubusercontent.com/Saramagrean/CWCheat-Database-Plus-/master/cheat.db

#config setup (controls.ini, ppsspp.ini )
mkdir -p $PPSSPP_CONFIG_DIR/SYSTEM/
cp ./configs/controls.ini $PPSSPP_CONFIG_DIR/SYSTEM
cp ./configs/ppsspp.$SYSTEM.ini $PPSSPP_CONFIG_DIR/SYSTEM
mv $PPSSPP_CONFIG_DIR/SYSTEM/ppsspp.$SYSTEM.ini $PPSSPP_CONFIG_DIR/SYSTEM/ppsspp.ini

#textures setup
mkdir -p $PPSSPP_CONFIG_DIR
ln -s `readlink -f .files/TEXTURES` $PPSSPP_CONFIG_DIR/TEXTURES
