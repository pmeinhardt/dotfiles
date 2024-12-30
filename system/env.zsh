if (( $+commands[nvim] ))
then
  export EDITOR='nvim'
elif (( $+commands[vim] ))
then
  export EDITOR='vim'
fi
