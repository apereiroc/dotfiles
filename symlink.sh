#!/bin/bash

echo "Linking dotfiles..."

# stow limitation ...
cd $HOME/.dotfiles
# get command_exists
source zsh/functions.zsh

if command_exists nvim; then
  echo "    Linking nvim ..."
  mkdir -p $HOME/.config/nvim
  stow --restow --target=$HOME/.config/nvim nvim

  echo "    Syncing ..."
  nvim --headless +"Lazy! sync" +qa
fi

if command_exists kitty; then
  echo "    Linking kitty ..."
  mkdir -p $HOME/.config/kitty
  stow --restow --target=$HOME/.config/kitty kitty
fi

echo "    Linking zsh ..."
if command_exists zsh; then
  stow --restow --target=$HOME zsh
fi

echo "Dotfiles symlinked."
