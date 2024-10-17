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
  curl "$RA_CORES_DOWNLOAD_URL/$CORE.so.zip" --output "$DOWNLOAD_CACHE/${CORE}.so.zip"
done

#retroarch ScummVM.zip
curl "$RA_SCUMMVM_DOWNLOAD_URL/$RA_SCUMMVM_FILE" --output "$DOWNLOAD_CACHE/$RA_SCUMMVM_FILE"

## download cores
#for CORE in "${RA_CORES[@]}"; do
#  curl "$RA_CORES_DOWNLOAD_URL/$CORE.so.zip" --output "$RA_CORES_DIR/${CORE}.zip"
#done

#for entry in "$RA_CORES_DIR"/*.zip; do
#  rm -f "$entry"
#done

#es-de AppImage
curl "$ES_DE_DOWNLOAD_URL" --output "$DOWNLOAD_CACHE/$ES_DE_APP_NAME"

#ppsspp cheat.db
curl "$PPSSPP_CHEAT_DOWNLOAD_URL" --output "$DOWNLOAD_CACHE/$PPSSPP_CHEAT_DB_NAME"

#cemu
curl "$CEMU_DONWLOAD_URL" --output "$DOWNLOAD_CACHE/$CEMU_APP_NAME"
