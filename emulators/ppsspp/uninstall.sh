#!/bin/bash
source ./ppsspp.env

flatpak uninstall org.ppsspp.PPSSPP
rm $APPS_DIR/ppsspp.sh
rm $PPSSPP_CONFIG_DIR/TEXTURES
rm -rf $PPSSPP_VAR_DIR
