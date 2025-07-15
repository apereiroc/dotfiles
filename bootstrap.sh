#!/bin/bash
set -euo pipefail

# run homebrew installation
# will install command line tools
if [[ $(command -v brew) == "" ]]; then
  echo "🔧 Installing Homebrew ..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Setup brew shellenv based on platform
  source $HOME/.dotfiles/brew.sh
else
  echo "Found a Homebrew installation!"
fi

echo "📦 Installing Brew packages..."
brew bundle --file=$HOME/.dotfiles/Brewfile

# run symlinks
$HOME/.dotfiles/symlink.sh
