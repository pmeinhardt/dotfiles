#!/bin/sh

if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

exit 0
