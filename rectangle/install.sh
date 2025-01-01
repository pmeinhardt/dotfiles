#!/bin/sh

# Configure Rectangle.app.

if [ "$(uname -s)" = "Darwin" ]; then
  src=$(realpath "$(dirname "$0")/RectangleConfig.json")
  dst="$HOME/Library/Application Support/Rectangle/RectangleConfig.json"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
fi
