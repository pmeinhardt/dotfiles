if (( $+commands[kubectl] ))
then
  eval "$(kubectl completion zsh)"
  compdef k='kubectl'
fi
