#!/bin/bash

# Install Homebrew + packages
echo "Installing Homebrew and packages..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file=~/dotfiles/Brewfile

echo "Done ✅"
