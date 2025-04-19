# Check if a command exists
# Usage: if command_exists gcc; then ...
function command_exists {
  command -v "$1" &> /dev/null
}

# Check if a file or directory exists
# Usage: if file_or_dir_exists "$HOME/.bashrc"; then ...
function file_or_dir_exists {
  [[ -e "$1" ]]
}

# Check if a regular file exists
# Usage: if is_file_and_exists "$HOME/.bashrc"; then ...
function is_file_and_exists {
  [[ -f "$1" ]]
}

# Get current virtual environment name
# Supports: virtualenv, conda
# Usage: echo "$(get_env)"
function get_env {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "($(basename "$VIRTUAL_ENV")) "
  elif [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    echo "($CONDA_DEFAULT_ENV) "
  else
    echo "syst"
  fi
}
