#!/bin/sh

NVM_DIR="$HOME/.nvm"

if test ! -d "$NVM_DIR"; then
  git clone "https://github.com/nvm-sh/nvm.git" "$NVM_DIR"
fi
