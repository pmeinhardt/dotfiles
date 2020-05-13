# Explicitly initialize pyenv if needed to keep shell initialization snappy.

if which pyenv > /dev/null; then
  alias pyenv-init='eval "$(pyenv init -)"'
fi
