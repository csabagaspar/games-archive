#!/bin/bash

source ./es-de.env

#install
mkdir -p $APPS_DIR
cp ./es-de.sh $APPS_DIR

wget -O ./$APP_NAME https://gitlab.com/es-de/emulationstation-de/-/package_files/$VERSION/download
mv ./$APP_NAME $APPS_DIR
chmod a+x $APPS_DIR/$APP_NAME

#config copy
mkdir -p $HOME/ES-DE/settings
mkdir -p $HOME/ES-DE/custom_systems

cp ./configs/settings/es_settings.$SYSTEM.xml $HOME/ES-DE/settings
mv $HOME/ES-DE/settings/es_settings.$SYSTEM.xml $HOME/ES-DE/settings/es_settings.xml

cp -r ./configs/custom_systems/* $HOME/ES-DE/custom_systems

#links
ln -s `readlink -f ./files/gamelists` $HOME/ES-DE/gamelists
ln -s `readlink -f ./files/downloaded_media` $HOME/ES-DE/downloaded_media
