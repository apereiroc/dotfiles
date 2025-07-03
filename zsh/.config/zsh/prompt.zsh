
export CONDA_AUTO_ACTIVATE_BASE=false
export CONDA_ALWAYS_YES=true
export VIRTUAL_ENV_DISABLE_PROMPT=0

env_name=$(get_env)

# disables prompt mangling in venv/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1
