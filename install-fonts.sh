#!/bin/sh

FONTS_DIR="$HOME/.local/share/fonts"
TMP_LOCATION="/tmp/md03"
# MY FAV FONTS:
SOURCE_CODE_PRO="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/SourceCodePro.zip"
FIRA_CODE="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/FiraCode.zip"
MESLO="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Meslo.zip"
IOSEVKA="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/Iosevka.zip"

prepare()
{
  mkdir -p $TMP_LOCATION
  mkdir -p $FONTS_DIR
}

install_font()
{
  local name="$1"
  local url="$2"
  
  echo "=======> Installing $name"
  curl -L $url > "$TMP_LOCATION/$name.zip" && unzip -o "$TMP_LOCATION/$name.zip" -d $FONTS_DIR
}

install()
{
  install_font FiraCode $FIRA_CODE
  install_font SauceCodePro $SOURCE_CODE_PRO 
  install_font Meslo $MESLO
  install_font Iosevka $IOSEVKA
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
  try_rm $FONTS_DIR/LICENSE
  try_rm $FONTS_DIR/LICENSE.md
  try_rm $FONTS_DIR/LICENSE.txt
  try_rm $FONTS_DIR/OFL.txt
  try_rm $FONTS_DIR/readme.md
}

prepare && install && clean && fc-cache $FONTS_DIR

