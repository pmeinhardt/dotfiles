#!/usr/bin/env bash

config=~/.config/ghostty/config

if [ ! -f "$config" ]; then
  mkdir -p "$(dirname "$config")"
  echo "config-file = $(realpath "$(dirname "$0")")/config" > "$config"
fi
