#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

RA_BACKUP=$CURRENT_ABSOLUTE_DIR/../../backups/retroarch

cp -r $RA_BACKUP/saves $RA_CONFIG_DIR/saves 
cp -r $RA_BACKUP/states $RA_CONFIG_DIR/states

rm -rf $RA_BACKUP
