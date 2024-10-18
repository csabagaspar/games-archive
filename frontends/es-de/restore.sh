#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

ES_DE_BACKUP=$CURRENT_ABSOLUTE_DIR/../../backups/es-de

cp -r $ES_DE_BACKUP/downloaded_media $ES_DE_DIR/downloaded_media 
cp -r $ES_DE_BACKUP/gamelists $ES_DE_DIR/gamelists

rm -rf $ES_DE_BACKUP
