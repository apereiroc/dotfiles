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


# Multiline prompt source:
# https://gist.github.com/romkatv/2a107ef9314f0d5f76563725b42f7cab

# Usage: fill-line LEFT RIGHT
#
# Prints LEFT<spaces>RIGHT with enough spaces in the middle
# to fill a terminal line.
function _fill_line() {
  emulate -L zsh
  local left_len=$(_prompt_length $1)
  local right_len=$(_prompt_length $2 9999)
  local pad_len=$((COLUMNS - left_len - right_len - ${ZLE_RPROMPT_INDENT:-1}))
  if (( pad_len < 1 )); then
    # Not enough space for the right part. Drop it.
    echo -E - ${1}
  else
    local pad=${(pl.$pad_len.. .)}  # pad_len spaces
    echo -E - ${1}${pad}${2}
  fi
}


# Usage: _prompt_length TEXT [COLUMNS]
#
# If you run `print -P TEXT`, how many characters will be printed
# on the last line?
#
# Or, equivalently, if you set PROMPT=TEXT with prompt_subst
# option unset, on which column will the cursor be?
#
# The second argument specifies terminal width. Defaults to the
# real terminal width.
#
# Assumes that `%{%}` and `%G` don't lie.
#
# Examples:
#
#   _prompt_length ''            => 0
#   _prompt_length 'abc'         => 3
#   _prompt_length $'abc\nxy'    => 2
#   _prompt_length '❎'          => 2
#   _prompt_length $'\t'         => 8
#   _prompt_length $'\u274E'     => 2
#   _prompt_length '%F{red}abc'  => 3
#   _prompt_length $'%{a\b%Gb%}' => 1
#   _prompt_length '%D'          => 8
#   _prompt_length '%1(l..ab)'   => 2
#   _prompt_length '%(!.a.)'     => 1 if root, 0 if not
function _prompt_length() {
  emulate -L zsh
  local COLUMNS=${2:-$COLUMNS}
  local -i x y=$#1 m
  if (( y )); then
    while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
      x=y
      (( y *= 2 ));
    done
    local xy
    while (( y > x + 1 )); do
      m=$(( x + (y - x) / 2 ))
      typeset ${${(%):-$1%$m(l.x.y)}[-1]}=$m
    done
  fi
  echo $x
}

function in_wsl() {
  # true if running under Windows Subsystem for Linux
  grep -qi microsoft /proc/version 2>/dev/null
}

function get_windows_home_wsl() {
  # return /mnt/c/Users/<username> from inside WSL
  if in_wsl; then
    # shellcheck disable=SC2002
    local win_user
    win_user=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
    echo "/mnt/c/Users/${win_user:-YOUR_WINDOWS_USERNAME}"
  fi
}
