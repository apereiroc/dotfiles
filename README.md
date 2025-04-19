# Dotfiles

My minimal, modular, and portable dotfiles setup for macOS/Linux.

## 🛠 Fresh install

1. Clone the repository

```bash
git clone https://github.com/apereiroc/dotfiles.git $HOME/.dotfiles
```

2. Run the bootstrap script

```bash
$HOME/.dotfiles/bootstrap.sh
```

## Docker (development)

```bash
docker buildx build --platform=linux/amd64 -f Dockerfile -t dotfiles-dev . && docker run --platform=linux/amd64 --rm -it dotfiles-dev
```
