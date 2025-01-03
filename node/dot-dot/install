#!/bin/sh

NVM_DIR="$HOME/.nvm"

if test ! -d "$NVM_DIR"; then
  git clone "https://github.com/nvm-sh/nvm.git" "$NVM_DIR"
fi

if test ! -s "$NVM_DIR/default-packages"; then
  ln -s "$(realpath "$(dirname "$0")/default-packages")" "$NVM_DIR/default-packages"
fi
