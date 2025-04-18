## -- Homebrew

if [[ "$(uname -m)" == "x86_64" ]]; then
  export HOMEBREW_PREFIX="/usr/local"
else
  export HOMEBREW_PREFIX="/opt/homebrew"
fi

eval $($HOMEBREW_PREFIX/bin/brew shellenv)

## -- prompt

export CONDA_AUTO_ACTIVATE_BASE=false
export CONDA_ALWAYS_YES=true
export VIRTUAL_ENV_DISABLE_PROMPT=0

function get_env {
 if [ $VIRTUAL_ENV ]; then
   echo "('`basename $VIRTUAL_ENV`') "
 elif [ $CONDA_DEFAULT_ENV ]; then
   echo "${CONDA_DEFAULT_ENV}"
 else
   echo "syst"
 fi
}

# disables prompt mangling in venv/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1



## -- zsh plugins

# init completions
autoload -Uz compinit
compinit

# autosuggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=241'
ZSH_AUTOSUGGEST_USE_ASYNC=1
CASE_SENSITIVE="false"
setopt MENU_COMPLETE
setopt no_list_ambiguous


# syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
