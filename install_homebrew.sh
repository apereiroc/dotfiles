#!/bin/bash

if [[ $(command -v brew) == "" ]]; then
  echo "🔧 Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "📦 Installing Brew packages..."
brew bundle --file=./Brewfile
