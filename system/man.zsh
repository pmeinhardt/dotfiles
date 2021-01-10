# Use "bat" for colorizing man pages if available
if (( $+commands[bat] ))
then
  export MANPAGER="sh -c 'col -bx | bat -l man -p --pager=\"less -FR\"'"
fi
