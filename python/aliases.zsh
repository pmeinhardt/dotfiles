# Explicitly initialize pyenv if needed to keep shell initialization snappy.

if which pyenv > /dev/null; then
  alias pyenv-init='eval "$(pyenv init -)"'
fi

if which pyenv-virtualenv-init > /dev/null; then
  alias pyenv-venv-init='eval "$(pyenv virtualenv-init -)"'
fi
