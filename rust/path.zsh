RUSTBIN="$(brew --prefix rustup)/bin"

if [ -d "$RUSTBIN" ]; then
  PATH="$RUSTBIN:$PATH"
fi
