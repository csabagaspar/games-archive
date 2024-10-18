#!/bin/bash
#
CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/vars.env
DOWNLOAD_CACHE=$CURRENT_ABSOLUTE_DIR/download_cache

#retroarch cores
for CORE in "${RA_CORES[@]}"; do
  rm "$DOWNLOAD_CACHE/${CORE}.so.zip"
done
#retroarch ScummVM.zip
rm "$DOWNLOAD_CACHE/$RA_SCUMMVM_FILE"

#es-de AppImage
rm $DOWNLOAD_CACHE/$ES_DE_APP_NAME

#ppsspp cheat.db
rm $DOWNLOAD_CACHE/$PPSSPP_CHEAT_DB_NAME

#cemu
rm $DOWNLOAD_CACHE/$CEMU_APP_NAME
