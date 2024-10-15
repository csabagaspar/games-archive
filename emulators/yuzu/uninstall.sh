#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

rm $APPS_DIR/$YUZU_APP_NAME
rm $APPS_DIR/yuzu.sh

rm -rf $HOME/.local/share/yuzu
rm -rf $HOME/.config/yuzu
