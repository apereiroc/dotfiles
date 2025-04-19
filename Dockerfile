FROM ubuntu:22.04

RUN apt update
RUN apt install -y build-essential procps curl file git zsh
RUN chsh -s /bin/zsh

ENV HOME=/root
WORKDIR $HOME/.dotfiles
COPY . .
