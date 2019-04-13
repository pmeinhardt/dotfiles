config=~/.config/nvim/init.vim

if ! test -f $config
then
  mkdir -p $(dirname $config)
  cat > $config <<-EOF
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF
fi
