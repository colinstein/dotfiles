#!/bin/sh
ln -s "$(pwd)/config/alacritty" "$HOME/.config/alacritty"

ln -s "$(pwd)/config/tmux.conf" "$HOME/.tmux.conf"
mkdir -p "$HOME/.config"
ln -s "$(pwd)/config/git" "$HOME/.config/git"

mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.vim/backup"
mkdir -p "$HOME/.vim/swap"
mkdir -p "$HOME/.vim/undo"
ln -s "$(pwd)/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"

cat > "$HOME/.zshenv" << EOF
# This is a stub file that sets ZDOTDIR and then loads the remainder of the zsh
# configuration form that directory. You can avoid using this file by setting
# an appropriate environment variable in your terminal emulator or elsewhere
# but this makes it explicit and only needs to be set once to work across
# multiple programs. An alternative approach would be to symling
# \$ZDOTDIR/.zshenv to this location.
ZDOTDIR=\$HOME/.config/zsh
source \$ZDOTDIR/.zshenv
EOF

ln -s "$(pwd)/config/zsh" "$HOME/.config/zsh"

# symlink dircolors
# symlink pry
# symlink defaultbindings
