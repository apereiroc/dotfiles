# Dotfiles

My minimal, modular, and portable dotfiles setup for macOS. Future developments will support Linux as well.

## 🛠 Fresh install

Install the CLI tools to get Git

```bash
xcode-select --install
```

1. Clone the repository

```bash
DOTFILES=$HOME/Projects/dotfiles
mkdir -p $DOTFILES
git clone git@github.com:apereiroc/dotfiles.git $DOTFILES
cd $DOTFILES
```

2. Run the bootstrap script

```bash
./bootstrap.sh
```
