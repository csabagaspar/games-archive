#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

rm -rf $ES_DE_DIR
rm $APPS_DIR/$ES_DE_APP_NAME
rm $APPS_DIR/es-de.sh
