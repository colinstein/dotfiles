#!/bin/sh

# symlink tmux
ln -s "tmux.conf" "$HOME/.tmux.conf"
ln -s "$(pwd)/config/tmux.conf" "$HOME/.tmux.conf"
# mkdir config
mkdir -p "$HOME/.config"
# symlink git
ln -s "$(pwd)/config/git" "$HOME/.config/git"
# symlink vim
# plug install
# mkdir ~.vim/backup|swap|undo
# simlink zsh
# pull submodules
# symlink alacritty
# symlink dircolors
# symlink pry
# symlink defaultbindings
