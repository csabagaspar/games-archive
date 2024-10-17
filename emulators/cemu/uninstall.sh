#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

rm $APPS_DIR/$CEMU_APP_NAME
rm $APPS_DIR/cemu.sh

rm -rf $HOME/.local/share/Cemu
rm -rf $HOME/.config/Cemu
