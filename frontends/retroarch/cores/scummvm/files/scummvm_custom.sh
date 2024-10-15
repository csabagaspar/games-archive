#!/bin/bash
GAMES_DIR=$HOME/Games

CORE_RETROARCH="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/cores"

GAME_FILE_NAME=$(basename "$1")
GAME_FILE_NAME="${GAME_FILE_NAME%.*}"

if [ ! -d "$GAMES_DIR/$GAME_FILE_NAME" ]; then
  unzip -d "$GAMES_DIR/$GAME_FILE_NAME" "$1"
fi

/usr/bin/flatpak run org.libretro.RetroArch -L "$CORE_RETROARCH"/scummvm_libretro.so "$GAMES_DIR/$GAME_FILE_NAME"
