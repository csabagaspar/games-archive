#!/bin/bash
#
CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/vars.env
CACHE=$CURRENT_ABSOLUTE_DIR/cache


#retroarch cores
for CORE in "${RA_CORES[@]}"; do
  if [ ! -f "$CACHE/$CORE.so.zip" ]; then
    curl "$RA_CORES_DOWNLOAD_URL/$CORE.so.zip" --output "$CACHE/${CORE}.so.zip"
  fi
done

#retroarch ScummVM.zip
if [ ! -f "$CACHE/$RA_SCUMMVM_FILE" ]; then
  curl "$RA_SCUMMVM_DOWNLOAD_URL/$RA_SCUMMVM_FILE" --output "$CACHE/$RA_SCUMMVM_FILE"
fi

## download cores
#for CORE in "${RA_CORES[@]}"; do
#  curl "$RA_CORES_DOWNLOAD_URL/$CORE.so.zip" --output "$RA_CORES_DIR/${CORE}.zip"
#done

#for entry in "$RA_CORES_DIR"/*.zip; do
#  rm -f "$entry"
#done

#es-de AppImage
if [ ! -f "$CACHE/$ES_DE_APP_NAME" ]; then
  curl "$ES_DE_DOWNLOAD_URL" --output "$CACHE/$ES_DE_APP_NAME"
fi

#ppsspp cheat.db
if [ ! -f "$CACHE/$PPSSPP_CHEAT_DB_NAME" ]; then
  curl "$PPSSPP_CHEAT_DOWNLOAD_URL" --output "$CACHE/$PPSSPP_CHEAT_DB_NAME"
fi

#cemu
if [ ! -f "$CACHE/$CEMU_APP_NAME" ]; then
  curl "$CEMU_DONWLOAD_URL" --output "$CACHE/$CEMU_APP_NAME"
fi
