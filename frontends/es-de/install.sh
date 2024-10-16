#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env
DOWNLOAD_CACHE=$CURRENT_ABSOLUTE_DIR/../../download_cache

#dirs
mkdir -p $APPS_DIR
mkdir -p $ES_DE_DIR/settings
mkdir -p $ES_DE_DIR/custom_systems

#es-de.sh
cp $CURRENT_ABSOLUTE_DIR/configs/es-de.sh $APPS_DIR

#AppImage
cp $DOWNLOAD_CACHE/$ES_DE_APP_NAME $APPS_DIR
chmod a+x $APPS_DIR/$ES_DE_APP_NAME

#es_settings.xml
cp $CURRENT_ABSOLUTE_DIR/configs/es_settings.$SYSTEM.xml $ES_DE_DIR/settings
mv $ES_DE_DIR/settings/es_settings.$SYSTEM.xml $ES_DE_DIR/settings/es_settings.xml

#es_find_rules.xml
cp $CURRENT_ABSOLUTE_DIR/configs/es_find_rules.xml $ES_DE_DIR/custom_systems

#es_systems.xml
cp $CURRENT_ABSOLUTE_DIR/configs/es_systems.xml $ES_DE_DIR/custom_systems
