#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

flatpak uninstall org.libretro.RetroArch

rm $APPS_DIR/ra.sh
rm $APPS_DIR/scummvm_custom.sh

rm -rf $RA_DIR
