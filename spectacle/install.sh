#!/bin/sh

# Configure Spectacle.app keyboard shortcuts.

if test -d ~/Library/Application\ Support/Spectacle
then
  sourcedir=$(dirname "$0")
  source=$(realpath "$sourcedir/shortcuts.json")
  cp "$source" ~/Library/Application\ Support/Spectacle/Shortcuts.json
fi
