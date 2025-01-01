#!/usr/bin/env bash

# Configure Neovim to use the same configuration files as Vim:
# https://neovim.io/doc/user/nvim.html#nvim-from-vim

config=~/.config/nvim/init.vim

if ! test -f "$config"
then
  mkdir -p "$(dirname "$config")"
  cat > "$config" <<-EOF
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF
fi

if hash npm 2>/dev/null
then
  npm install --global neovim
fi

if hash python3 2>/dev/null
then
  python3 -m pip install --upgrade pynvim
fi
