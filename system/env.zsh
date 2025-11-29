# Set the default editor
if (( $+commands[nvim] )); then
  export EDITOR='nvim'
elif (( $+commands[vim] )); then
  export EDITOR='vim'
fi

# Disable tracking
export DO_NOT_TRACK=1
