#!/bin/bash
set -euo pipefail

echo "Linking dotfiles..."
cd "$HOME/.dotfiles" # stow limitation...

# ------------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------------
source zsh/.config/zsh/functions.zsh # supplies command_exists

in_wsl() {
  # true if running under WSL
  grep -qi microsoft /proc/version 2>/dev/null
}

get_windows_home_wsl() {
  # return /mnt/c/Users/<username> from inside WSL
  if in_wsl; then
    # shellcheck disable=SC2002
    local win_user
    win_user=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
    echo "/mnt/c/Users/${win_user:-YOUR_WINDOWS_USERNAME}"
  fi
}

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
if command_exists wezterm; then
  echo "    Linking wezterm ..."
  if in_wsl; then
    echo "      Linking wezterm for WSL/Windows..."
    WIN_HOME=$(windows_home_wsl)
    mkdir -p "$WIN_HOME"

    # link all lua files next to wezterm.lua
    for file in "wezterm/.config/wezterm/"*.lua; do
      ln -sf "$file" "$WIN_HOME/$(basename "$file")"
    done

    echo "      (WSL) -> linked all .lua files to $WIN_HOME"
  else
    # macOS / native Linux
    echo "      Linking wezterm for macOS/Linux ..."
    mkdir -p "$HOME/.config/wezterm"
    stow --restow --target="$HOME/.config/wezterm" wezterm
  fi
fi

echo "Dotfiles symlinked."
