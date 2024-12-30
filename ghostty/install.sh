#!/usr/bin/env bash

config=~/.config/ghostty/config

if ! test -f "$config"
then
  mkdir -p "$(dirname "$config")"
  cat > "$config" <<-EOF
config-file = $(realpath $(dirname "$0"))/config
EOF
fi
