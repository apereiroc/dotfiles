#!/bin/bash

echo "Linking dotfiles..."

echo "    Linking nvim ..."
mkdir -p $HOME/.config/nvim
stow --restow --target=$HOME/.config/nvim nvim

echo "    Syncing ..."
nvim --headless +"Lazy! sync" +qa

echo "Dotfiles symlinked."
