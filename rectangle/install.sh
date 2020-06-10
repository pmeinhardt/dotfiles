#!/bin/sh

# Configure Rectangle.app.

if [ "$(uname -s)" = "Darwin" ]
then
  source=$(realpath "$(dirname "$0")/Rectangle.plist")
  ln -sf "$source" ~/Library/Preferences/com.knollsoft.Rectangle.plist
fi
