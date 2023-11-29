#!/usr/bin/env bash
# Install script for the dotfiles

set -e

function doSync(){
    ln -s ~/.dotfiles/.config/tmuxp/ ~/.config/
    ln -s ~/.dotfiles/.config/nvim/ ~/.config/
    ln -s ~/.dotfiles/.config/alacritty/ ~/.config/
    ln -s ~/.dotfiles/.idevimrc ~/.idevimrc
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doSync
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doSync
    else
        printf "Skipped.\n\n"
    fi
fi

unset doSync

# Install tmux plugins
read -p "Install tmux plugins? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing tmux plugins.."
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi;
