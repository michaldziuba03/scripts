#!/bin/sh

VERSION="1.14.1"
DOWNLOAD_URL="https://github.com/stripe/stripe-cli/releases/download/v$VERSION/stripe_${VERSION}_linux_x86_64.tar.gz"
INSTALL_LOCALTION="$HOME/.local/bin"

prepare()
{
  mkdir -p "$INSTALL_LOCALTION"
}

install()
{
  curl -L "$DOWNLOAD_URL" | tar xvz -C "$INSTALL_LOCALTION"
}

prepare && install

