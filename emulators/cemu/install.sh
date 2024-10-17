#!/bin/bash
#
CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env
DOWNLOAD_CACHE=$CURRENT_ABSOLUTE_DIR/../../download_cache


#Copy image
mkdir -p $APPS_DIR
cp $DOWNLOAD_CACHE/$CEMU_APP_NAME $APPS_DIR
chmod a+x $APPS_DIR/$CEMU_APP_NAME

#cemu.sh
cp $CURRENT_ABSOLUTE_DIR/configs/cemu.sh $APPS_DIR

#~/.local/share/Cemu
mkdir -p $HOME/.local/share/Cemu
cp $CURRENT_ABSOLUTE_DIR/files/keys.txt $HOME/.local/share/Cemu

#~/.config/Cemu
mkdir -p $HOME/.config/Cemu
mkdir -p $HOME/.config/Cemu/controllerProfiles
cp $CURRENT_ABSOLUTE_DIR/configs/controllerProfiles/*.xml $HOME/.config/Cemu/controllerProfiles

#~/.cache/Cemu

