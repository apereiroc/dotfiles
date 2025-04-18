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
FPATH=$HOMEBREW_PREFIX/share/zsh-completions:$FPATH
autoload -Uz compinit
compinit
