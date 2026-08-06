# https://docs.brew.sh/Manpage#environment

# Disable sending of analytics data.
export HOMEBREW_NO_ANALYTICS=1

# Disable beer emoji in homebrew output.
export HOMEBREW_NO_EMOJI=1

# Forbid redirects from secure HTTPS to insecure HTTP.
export HOMEBREW_NO_INSECURE_REDIRECT=1

# Disable lock-file generation (these are for debugging).
export HOMEBREW_BUNDLE_NO_LOCK=1

# Require tapped repositories to be trusted before they can be used.
export HOMEBREW_REQUIRE_TAP_TRUST=1
