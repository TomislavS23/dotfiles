#!/bin/bash

# Backup directory
backup_dir=~/.backup

# Create hidden backup folder
if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir"
    echo "Created hidden backup directory at $backup_dir"
else
    echo "Backup directory already exists at $backup_dir"
fi

# List of all dotfiles
dotfiles=(.gitconfig .bashrc .exports .aliases)

# Backup existing dotfiles
for dotfile in "${dotfiles[@]}"; do
    if [ -e ~/$dotfile ]; then
        echo "Backing up existing ~$dotfile to $backup_dir"
        mv ~/$dotfile "$backup_dir"
    else
        echo "No existing ~$dotfile found, skipping backup."
    fi
done

# Create symbolic links for dotfiles
for dotfile in "${dotfiles[@]}"; do
    if [ -e ~/dotfiles/$dotfile ]; then
        ln -sf ~/dotfiles/$dotfile ~/$dotfile
        echo "Created symbolic link for ~$dotfile"
    else
        echo "Warning: ~/dotfiles/$dotfile does not exist. Skipping symbolic link creation."
    fi
done

echo "Dotfiles have been linked!"