#!/bin/sh

FONTS_DIR="$HOME/.local/share/fonts"
TMP_LOCATION="/tmp/md03"
VERSION="v3.0.0" # to update just increase number
DOWNLOAD_ROOT="https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION"

if [ "$(id -u)" -eq 0 ]; then
  echo "Don't run this script as root!" >&2
  exit 1
fi

prepare()
{
  mkdir -p "$TMP_LOCATION"
  mkdir -p "$FONTS_DIR"
}

install_font()
{
  name="$1"
  url="$DOWNLOAD_ROOT/$name.zip"
  
  echo "=======> Installing $name"
  curl -L "$url" > "$TMP_LOCATION/$name.zip" && unzip -o "$TMP_LOCATION/$name.zip" -d "$FONTS_DIR"
}

install()
{
  install_font FiraCode
  install_font SourceCodePro 
  install_font Meslo
  install_font Iosevka
  install_font RobotoMono
  install_font JetBrainsMono

  fc-cache "$FONTS_DIR"
}

try_rm()
{
  # check if file exists and then remove
  [ -f "$1" ] && rm "$1"
}

clean()
{
  echo "=======> Cleaning temporary files..."
  rm -rf $TMP_LOCATION

  # remove non-font files from fonts dir
  try_rm "$FONTS_DIR/LICENSE"
  try_rm "$FONTS_DIR/LICENSE.md"
  try_rm "$FONTS_DIR/LICENSE.txt"
  try_rm "$FONTS_DIR/OFL.txt"
  try_rm "$FONTS_DIR/readme.md"
}

prepare && install ; clean

