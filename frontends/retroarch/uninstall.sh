#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

flatpak uninstall org.libretro.RetroArch
rm $APPS_DIR/ra.sh
rm $RA_CONFIG_DIR/system
rm $RA_CONFIG_DIR/saves
rm $RA_CONFIG_DIR/states
rm $RA_CONFIG_DIR/config
rm $RA_CONFIG_DIR/overlays
rm -rf $RA_DIR
