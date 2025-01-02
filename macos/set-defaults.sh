#!/usr/bin/env bash

# Set macOS defaults how I like them.
#
# The original idea (and a couple settings) were grabbed from:
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

set -o errexit
set -o nounset
set -o pipefail


# Close any open "System Settings" panes to prevent them
# from overriding settings we’re about to change.
osascript -e 'tell application "System Preferences" to quit'


# User interface

# Use dark mode.
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Set Finder sidebar icon size to medium.
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Show scrollbars when scrolling.
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Enable keyboard access for controls, e.g., tab and shift+tab in modal dialogs.
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2


# Language & Region

# Set language and text formats.
defaults write NSGlobalDomain AppleLanguages -array "en-DE" "en-US" "de-DE"
defaults write NSGlobalDomain AppleLocale -string "en_DE"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"
defaults write NSGlobalDomain AppleMetricUnits -bool true


# Text input

# Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution.
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable auto-correct.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


# Keyboard

# Disable press-and-hold for keys in favor of key repeat.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15


# Finder

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Always open everything in Finder's column view. This is important.
defaults write com.apple.finder FXPreferredViewStyle -string clmv

# Show all filename extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show the ~/Library folder.
chflags nohidden ~/Library


# Dock

# Automatically show and hide the Dock
defaults write com.apple.dock autohide -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 42
