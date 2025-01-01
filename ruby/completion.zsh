if (( $+commands[brew] )); then
  completion="$(brew --prefix rbenv)/completions/rbenv.zsh"

  if test -f $completion; then
    source $completion
  fi
fi
