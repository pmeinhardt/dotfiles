# Explicitly initialize pyenv if needed to keep shell initialization snappy.

if (( $+commands[pyenv] )); then
  alias pyenv-init='eval "$(pyenv init -)"'
fi
