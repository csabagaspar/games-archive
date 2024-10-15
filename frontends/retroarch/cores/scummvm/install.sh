#!/bin/bash

CURRENT_ABSOLUTE_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)
source $CURRENT_ABSOLUTE_DIR/../../../../vars.env

#Copy script
mkdir -p $APPS_DIR
cp "$CURRENT_ABSOLUTE_DIR/files/scummvm_custom.sh" $APPS_DIR

#install core
curl "$RA_CORES_DOWNLOAD_URL/$SCUMMVM_RA_CORE_NAME.so.zip" --output "$RA_CORES_DIR/$SCUMMVM_RA_CORE_NAME.zip"
unzip -q -o "$RA_CORES_DIR/$SCUMMVM_RA_CORE_NAME.zip" -d "$RA_CORES_DIR"
rm -f "$RA_CORES_DIR/$SCUMMVM_RA_CORE_NAME.zip"

#install system files
curl "$SCUMMVM_SYSTEM_FILES_DOWNLOAD_URL/$SCUMMVM_SYSTEM_ZIP_FILE" --output "$RA_SYSTEM_DIR/$SCUMMVM_SYSTEM_ZIP_FILE"
unzip -q -o "$RA_SYSTEM_DIR/$SCUMMVM_SYSTEM_ZIP_FILE" -d "$RA_SYSTEM_DIR"
rm -f "$RA_SYSTEM_DIR/$SCUMMVM_SYSTEM_ZIP_FILE"

#scummvm.ini
cp $CURRENT_ABSOLUTE_DIR/configs/scummvm.$SYSTEM.ini $RA_SYSTEM_DIR
mv $RA_SYSTEM_DIR/scummvm.$SYSTEM.ini $RA_SYSTEM_DIR/scummvm.ini
