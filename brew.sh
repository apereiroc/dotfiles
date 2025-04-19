# Homebrew auto-detect & setup
if [ -x /opt/homebrew/bin/brew ]; then
  # macOS apple silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  # macOS intel
  eval "$(/usr/local/bin/brew shellenv)"
elif [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  # Linuxbrew
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
