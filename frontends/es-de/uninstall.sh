#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

rm $ES_DE_DIR/downloaded_media
rm $ES_DE_DIR/gamelists
rm $ES_DE_DIR/custom_systems

rm -rf $ES_DE_DIR
rm $APPS_DIR/$ES_DE_APP_NAME
rm $APPS_DIR/es-de.sh
