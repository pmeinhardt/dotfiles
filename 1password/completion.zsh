# https://1password.com/downloads/command-line/

if (( $+commands[op] ))
then
  eval "$(op completion zsh)"; compdef _op op
fi
