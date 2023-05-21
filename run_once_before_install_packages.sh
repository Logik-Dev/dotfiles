#!/bin/bash

# Install packages
sudo dnf install neovim alacritty zsh ansible util-linux-user rbw nodejs-npm powerline-fonts
sudo dnf group install "C Development Tools and Libraries" "Development Tools"

# Install Alacritty themes
sudo npm i -g alacritty-themes

# Change default shell
chsh -s $(which zsh)

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install rbw (bitwarden cli)
source $HOME/.cargo/env
cargo install rbw
