FROM ubuntu:22.04
RUN apt update
RUN apt install -y build-essential curl git sudo

# Create a non-root user
RUN useradd -ms /bin/bash dev-user && \
    echo "dev-user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER dev-user
ENV HOME=/home/dev-user
WORKDIR $HOME/.dotfiles

COPY . .

# Set permissions (since we're copying files as root)
RUN sudo chown -R dev-user:dev-user $HOME

# Run the bootstrap script (install homebrew packages and run symlinks)
RUN ["/bin/bash", "./bootstrap.sh"]

# Set homebrew zsh as default shell
# RUN echo "/home/linuxbrew/.linuxbrew/bin/zsh" | sudo tee -a /etc/shells && \
#     sudo chsh -s /home/linuxbrew/.linuxbrew/bin/zsh dev-user
CMD ["/home/linuxbrew/.linuxbrew/bin/zsh"]
