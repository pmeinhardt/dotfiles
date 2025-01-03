# Explicitly initialize pyenv if needed to keep shell initialization snappy.

if (( $+commands[pyenv] )); then
  function pyenv-init {
    # Add pyenv executable to PATH and enable shims:
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"

    # Load pyenv into the shell:
    eval "$(pyenv init -)"
  }
fi
