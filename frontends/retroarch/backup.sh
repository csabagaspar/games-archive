#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../vars.env

RA_BACKUP=$CURRENT_ABSOLUTE_DIR/../../backups/retroarch

rm -rf $RA_BACKUP
mkdir -p $RA_BACKUP

cp -r $RA_CONFIG_DIR/saves $RA_BACKUP/saves
cp -r $RA_CONFIG_DIR/states $RA_BACKUP/states
