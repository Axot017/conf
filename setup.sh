#!/bin/bash

NVIM_DIR="$HOME/.config/nvim"
 [ ! -d "$NVIM_DIR" ] && git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

BASE_DIR=$( dirname -- "$0"; )
TARGET=".config"

get_abs_filename() {
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

for f in $(find . -type f -print)
do
	DIR=$( dirname -- "$f"; )
	FILENAME=$( basename -- "$f"; )
	[[ $FILENAME == "setup.sh" ]] && continue
	[[ $DIR == *".git"* ]] && continue

	TARGET_DIR="$HOME/$TARGET/$DIR"
	TARGET_FILE="$HOME/$TARGET/$f"

	mkdir -p $TARGET_DIR
	rm -f $TARGET_FILE
	ln -s $(get_abs_filename $f) $TARGET_FILE
done

