#!/bin/sh

# Copy configuration for Rectangle.app.

if [ "$(uname -s)" = "Darwin" ]; then
  src=$(realpath "$(dirname "$0")/RectangleConfig.json")
  dst="$HOME/Library/Application Support/Rectangle/RectangleConfig.json"
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
fi
