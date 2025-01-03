# Use "nvim" for browsing man pages if available, otherwise use "bat" for
# colorizing man pages if installed.
if (( $+commands[nvim] )); then
  export MANPAGER="nvim +Man!"
elif (( $+commands[bat] )); then
  export MANPAGER="sh -c 'col -bx | bat -l man -p --pager=\"less -FR\"'"
fi
