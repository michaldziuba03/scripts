#!/bin/sh

NEOVIM_INSTALL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
DOWNLOAD_OUTPUT="$HOME/.local/bin"

if [ "$(id -u)" -eq 0 ]
then
  echo "Don't run this script as root!" >&2
  exit 1
fi

prepare() 
{
  mkdir -p "$DOWNLOAD_OUTPUT"
}

install() 
{
  curl -L $NEOVIM_INSTALL > "$DOWNLOAD_OUTPUT/nvim" && chmod +x "$DOWNLOAD_OUTPUT/nvim"
}

prepare && install

