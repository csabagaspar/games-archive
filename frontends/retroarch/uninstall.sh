#!/bin/bash

source ./ra.env

flatpak uninstall org.libretro.RetroArch
rm $APPS_DIR/ra.sh
rm $CONFIG_RA_DIR/system
rm $CONFIG_RA_DIR/saves
rm $CONFIG_RA_DIR/states
rm $CONFIG_RA_DIR/config
rm $CONFIG_RA_DIR/overlays
rm -rf $RA_VAR_DIR
