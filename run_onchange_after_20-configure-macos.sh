#!/bin/sh

set -eu

[ "$(uname -s)" = "Darwin" ] || exit 0

# Keyboard
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

# Dock
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock tilesize -int 34

# Finder: list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
