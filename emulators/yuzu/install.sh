#!/bin/bash
#
CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env
CACHE=$CURRENT_ABSOLUTE_DIR/../../cache


#Copy image
mkdir -p $APPS_DIR
cp $CACHE/$YUZU_APP_NAME $APPS_DIR
chmod a+x $APPS_DIR/$YUZU_APP_NAME

#yuzu.sh
cp $CURRENT_ABSOLUTE_DIR/configs/yuzu.sh $APPS_DIR

#~/.local/share/yuzu
mkdir -p $HOME/.local/share/yuzu/keys
cp $CURRENT_ABSOLUTE_DIR/files/*.keys $HOME/.local/share/yuzu/keys

#~/.local/share/yuzu/nand/system/Contents/registered
mkdir -p $HOME/.local/share/yuzu/nand/system/Contents/registered
unzip $CACHE/$YUZU_FIRMWARE_FILE -d $HOME/.local/share/yuzu/nand/system/Contents/registered

#~/.config/yuzu
mkdir -p $HOME/.config/yuzu
mkdir -p $HOME/.config/yuzu/input
cp $CURRENT_ABSOLUTE_DIR/configs/qt-config.$SYSTEM.ini $HOME/.config/yuzu
mv $HOME/.config/yuzu/qt-config.$SYSTEM.ini $HOME/.config/yuzu/qt-config.ini

cp $CURRENT_ABSOLUTE_DIR/configs/input/steamdeck.ini $HOME/.config/yuzu/input
