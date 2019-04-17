#!/bin/sh

# Configure Neovim to use the same configuration files as Vim:
# https://neovim.io/doc/user/nvim.html#nvim-from-vim

config=~/.config/nvim/init.vim

if ! test -f $config
then
  mkdir -p "$(dirname $config)"
  cat > $config <<-EOF
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF
fi

if test $(which npm)
then
  npm install --global neovim
fi

if test $(which python2)
then
  python2 -m pip install --upgrade pynvim
fi

if test $(which python3)
then
  python3 -m pip install --upgrade pynvim
fi
