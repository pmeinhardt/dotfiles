# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] )) && [ -n "$HOMEBREW_PREFIX" ]; then
  source "$HOMEBREW_PREFIX/etc/grc.zsh"
fi
