# Dotfiles

My minimal, modular, and portable dotfiles setup for macOS/Linux.

## 🛠 Fresh install

1. (*only on macOS*) Init (some configs and command line tools)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/apereiroc/dotfiles/master/osx-init.sh)"
```

2. Clone the repository

```bash
git clone https://github.com/apereiroc/dotfiles.git $HOME/.dotfiles
```

3. Run the bootstrap script

```bash
sudo $HOME/.dotfiles/bootstrap.sh
```

## Docker (development)

```bash
docker buildx build --platform=linux/amd64 -f Dockerfile -t dotfiles-dev . && docker run --platform=linux/amd64 --rm -it dotfiles-dev
```
