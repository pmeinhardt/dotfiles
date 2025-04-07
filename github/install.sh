#!/usr/bin/env bash

if command -v gh &> /dev/null; then
  gh extension install github/gh-copilot
  gh extension install github/gh-models
fi
