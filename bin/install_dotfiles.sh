#!/bin/bash

DOTFILES_BASE="`dirname \"$0'"`"
DOTFILES_BASE="`(cd \"$DOTFILES_BASE\"/.. && pwd)`"

printf "Zsh: "
ln -sF "$DOTFILES_BASE/zlogin" ~/.zlogin
ln -sF "$DOTFILES_BASE/zlogout" ~/.zlogout
ln -sF "$DOTFILES_BASE/zshenv" ~/.zshenv
ln -sF "$DOTFILES_BASE/zprofile" ~/.zprofile
ln -sF "$DOTFILES_BASE/zshrc" ~/.zshrc
printf "done.\n"

