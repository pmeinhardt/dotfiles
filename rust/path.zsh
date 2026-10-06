RUSTBIN="$HOMEBREW_PREFIX/opt/rustup/bin"

if [ -d "$RUSTBIN" ]; then
  PATH="$RUSTBIN:$PATH"
fi
