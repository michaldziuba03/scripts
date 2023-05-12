#!/bin/sh

NEOVIM_INSTALL="https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
DOWNLOAD_OUTPUT="$HOME/.local/bin"

prepare() 
{
  mkdir -p $DOWNLOAD_OUTPUT
}

install() 
{
  curl -L $NEOVIM_INSTALL > $DOWNLOAD_OUTPUT/nvim && chmod +x $DOWNLOAD_OUTPUT/nvim
}

prepare && install

