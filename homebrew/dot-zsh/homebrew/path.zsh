# Search for Homebrew in its preferred locations:
# https://docs.brew.sh/Installation
for prefix in "/opt/homebrew" "/usr/local"; do
  if [ -x "$prefix/bin/brew" ]; then
    eval "$($prefix/bin/brew shellenv)"
    break
  fi
done
