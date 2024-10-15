#!/bin/bash
CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../../../vars.env

rm $APPS_DIR/scummvm_custom.sh
rm $RA_SYSTEM_DIR/scummvm.ini
rm $RA_CORES_DIR/scummvm_libretro.so
rm -rf $RA_SYSTEM_DIR/scummvm
