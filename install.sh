#!/bin/bash

# Create hidden backup folder
backup_dir=~/.backup
if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir"
    echo "Created hidden backup directory at $backup_dir"
fi

# Backup existing dotfiles to the hidden backup folder
if [ -e ~/.gitconfig ]; then
    echo "Backing up existing .gitconfig to $backup_dir"
    mv ~/.gitconfig ~/.backup
fi

if [ -e ~/.bashrc ]; then
    echo "Backing up existing .bashrc to $backup_dir"
    mv ~/.bashrc ~/.backup
fi

if [ -e ~/.exports ]; then
    echo "Backing up existing .exports to $backup_dir"
    mv ~/.exports ~/.backup
fi

# Create symbolic links for dotfiles
ln -sf ~/dotfiles/.aliases ~/.aliases
ln -sf ~/dotfiles/.exports ~/.exports
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.bashrc ~/.bashrc

echo "Dotfiles have been linked!"