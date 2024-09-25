#!/bin/bash
source ./yuzu.env

#Copy image
mkdir -p $APPS_DIR
cp ./files/$APP_NAME $APPS_DIR
chmod a+x $APPS_DIR/$APP_NAME

cp ./yuzu.sh $APPS_DIR

#~/.local/share/yuzu
mkdir -p $HOME/.local/share/yuzu/keys
cp ./keys/*.keys $HOME/.local/share/yuzu/keys

#~/.local/share/yuzu/nand/system/Contents/registered
mkdir -p $HOME/.local/share/yuzu/nand/system/Contents/registered
unzip ./files/firmware17_0_1.zip -d $HOME/.local/share/yuzu/nand/system/Contents/registered

#~/.config/yuzu
mkdir -p $HOME/.config/yuzu
mkdir -p $HOME/.config/yuzu/input
cp ./configs/qt-config.$SYSTEM.ini $HOME/.config/yuzu
mv $HOME/.config/yuzu/qt-config.$SYSTEM.ini $HOME/.config/yuzu/qt-config.ini

cp ./configs/input/steamdeck.ini $HOME/.config/yuzu/input
