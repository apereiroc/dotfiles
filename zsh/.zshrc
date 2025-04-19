DOTFILES=$HOME/.dotfiles
ZDOTFILES=$DOTFILES/zsh

## -- Functions
source $ZDOTFILES/functions.zsh


## -- Aliases 
source $ZDOTFILES/aliases.zsh

## -- Homebrew

if is_file_and_exists $DOTFILES/brew.sh; then
  source $DOTFILES/brew.sh
fi

## -- prompt

if is_file_and_exists $ZDOTFILES/prompt.sh; then
  source $ZDOTFILES/prompt.sh
fi


## -- zsh plugins

# init completions
autoload -Uz compinit
compinit

# autosuggestions
if is_file_and_exists $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh; then
  source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=241'
  ZSH_AUTOSUGGEST_USE_ASYNC=1
  CASE_SENSITIVE="false"
  setopt MENU_COMPLETE
  setopt no_list_ambiguous
else
  echo "Skipping zsh autosuggestions (not installed)"
fi


# syntax highlighting
if is_file_and_exists $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; then
  source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "Skipping zsh syntax highlighting (not installed)"
fi
