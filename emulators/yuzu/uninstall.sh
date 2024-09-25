#!/bin/bash

source ./yuzu.env

rm $APPS_DIR/$APP_NAME
rm $APPS_DIR/yuzu.sh

rm -rf $HOME/.local/share/yuzu
rm -rf $HOME/.config/yuzu
