#!/bin/bash
set -euo pipefail

echo "Linking dotfiles..."
cd "$HOME/.dotfiles" # stow limitation...

# ------------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------------
## supplies command_exists, get_windows_home_wsl
source zsh/.config/zsh/functions.zsh

# ------------------------------------------------------------------------
# Neovim
# ------------------------------------------------------------------------
if command_exists nvim; then
  echo "    Linking nvim ..."
  mkdir -p "$HOME/.config/nvim"
  stow --restow --target="$HOME/.config/nvim" nvim
  echo "    Syncing ..."
  nvim --headless +"Lazy! sync" +qa
fi

# ------------------------------------------------------------------------
# Kitty
# ------------------------------------------------------------------------
if command_exists kitty; then
  echo "    Linking kitty ..."
  mkdir -p "$HOME/.config/kitty"
  stow --restow --target="$HOME/.config/kitty" kitty
fi

# ------------------------------------------------------------------------
# Zsh
# ------------------------------------------------------------------------
echo "    Linking zsh ..."
if command_exists zsh; then
  stow --restow --target="$HOME" zsh
fi

# ------------------------------------------------------------------------
# fzf
# ------------------------------------------------------------------------
echo "    Linking fzf ..."
if command_exists fzf; then
  stow --restow --target="$HOME" fzf
fi

# ------------------------------------------------------------------------
# WezTerm
# ------------------------------------------------------------------------
if command_exists wezterm.exe; then
  echo "    Copying wezterm config for Windows..."

  WIN_HOME=$(get_windows_home_wsl)

  cp "wezterm/.config/wezterm.lua" \
    "$WIN_HOME/.wezterm.lua"

  echo "      Copied to $WIN_HOME/.wezterm.lua"
else
  echo "    Linking wezterm for macOS/Linux..."
  stow --restow --target="$HOME" wezterm
fi

echo "Dotfiles symlinked."
