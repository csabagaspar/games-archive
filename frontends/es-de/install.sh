#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

#install
mkdir -p $APPS_DIR
cp $CURRENT_ABSOLUTE_DIR/files/es-de.sh $APPS_DIR

curl "$ES_DE_DOWNLOAD_URL" --output "$APPS_DIR/$ES_DE_APP_NAME"
chmod a+x $APPS_DIR/$ES_DE_APP_NAME

#copy settings
mkdir -p $ES_DE_DIR/settings
cp $CURRENT_ABSOLUTE_DIR/configs/settings/es_settings.$SYSTEM.xml $ES_DE_DIR/settings
mv $ES_DE_DIR/settings/es_settings.$SYSTEM.xml $ES_DE_DIR/settings/es_settings.xml

#links
ln -s $CURRENT_ABSOLUTE_DIR/symlinks/custom_systems $ES_DE_DIR/custom_systems
ln -s $CURRENT_ABSOLUTE_DIR/symlinks/gamelists $ES_DE_DIR/gamelists
ln -s $CURRENT_ABSOLUTE_DIR/symlinks/downloaded_media $ES_DE_DIR/downloaded_media
