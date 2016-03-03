#!/bin/bash

DOTFILES_BASE="`dirname \"$0\"`"
DOTFILES_BASE="`(cd \"$DOTFILES_BASE\"/.. && pwd)`"

printf "git: "
mkdir -p ~/.config/git
ln -sF "$DOTFILES_BASE/config/git/config" ~/.config/git/config
ln -sF "$DOTFILES_BASE/config/git/ignore" ~/.config/git/ignore
printf "done.\n"

printf "dircolors: "
ln -sF "$DOTFILES_BASE/dircolors-solarized-dark" ~/.dircolors-solarized-dark
printf "done.\n"

printf "htoprc: "
mkdir -p ~/.config
ln -sF "$DOTFILES_BASE/config/htoprc" ~/.config/htoprc
printf "done.\n"

printf "mailrc: "
ln -sF "$DOTFILES_BASE/mailrc" ~/.mailrc
printf "done.\n"

printf "mbsyncrc: "
mkdir -p ~/.mail/icloud/Inbox
ln -sF "$DOTFILES_BASE/mbsyncrc" ~/.mbsyncrc
printf "done.\n"

printf "msmtprc: "
ln -sF "$DOTFILES_BASE/msmtprc" ~/.msmtprc
printf "done.\n"

printf "urlview: "
ln -sF "$DOTFILES_BASE/urlview" ~/.urlview
printf "done.\n"

printf "Zsh: "
ln -sF "$DOTFILES_BASE/zlogin" ~/.zlogin
ln -sF "$DOTFILES_BASE/zlogout" ~/.zlogout
ln -sF "$DOTFILES_BASE/zshenv" ~/.zshenv
ln -sF "$DOTFILES_BASE/zprofile" ~/.zprofile
ln -sF "$DOTFILES_BASE/zshrc" ~/.zshrc
ln -sF "$DOTFILES_BASE/zpreztorc" ~/.zpreztorc
printf "done.\n"

printf "Elinks: "
mkdir -p ~/.elinks
ln -sF "$DOTFILES_BASE/elinks/elinks.conf" ~/.elinks/elinks.conf
ln -sF "$DOTFILES_BASE/elinks/solarized-dark-min.css" ~/.elinks/solarized-dark-min.css
ln -sF "$DOTFILES_BASE/elinks/solarized-light-min.css" ~/.elinks/solarized-light-min.css
printf "done.\n"

printf "Nmcpcpp: "
mkdir -p ~/.ncmpcpp
ln -sF "$DOTFILES_BASE/ncmpcpp/config" ~/.ncmpcpp/config
ln -sF "$DOTFILES_BASE/ncmpcpp/bindings" ~/.ncmpcpp/bindings
printf "done.\n"

printf "Mopidy: "
mkdir -p ~/.config
cp "$DOTFILES_BASE/config/mopidy/mopidy.conf" ~/.config/mopidy/mopidy.conf
printf "done\n"

printf "Vim: "
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/swap
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sF "$DOTFILES_BASE/vim/vimrc" ~/.vim/vimrc
vim +PluginInstall +qall
printf "done.\n"

printf "Mutt: "
mkdir -p ~/.mutt/accounts
mkdir -p ~/.mutt/bin
mkdir -p ~/.mutt/cache/bodies
mkdir -p ~/.mutt/cache/headers
mkdir -p ~/.mutt/themes
mkdir -p ~/.mutt/tmp

ln -sF "$DOTFILES_BASE/mutt/muttrc" ~/.mutt/muttrc
ln -sF "$DOTFILES_BASE/mutt/alias" ~/.mutt/alias
ln -sF "$DOTFILES_BASE/mutt/mailcap" ~/.mutt/mailcap
ln -sF "$DOTFILES_BASE/mutt/signature" ~/.mutt/signature

ln -sF "$DOTFILES_BASE/mutt/accounts/icloud" ~/.mutt/accounts/icloud
ln -sF "$DOTFILES_BASE/mutt/themes/mutt-solarized-dark.muttrc" ~/.mutt/themes/mutt-solarized-dark.muttrc
ln -sF "$DOTFILES_BASE/mutt/themes/mutt-solarized-light.muttrc" ~/.mutt/themes/mutt-solarized-light.muttrc

ln -sF "$DOTFILES_BASE/bin/display_filter.sh" ~/.mutt/bin/display_filter.sh
ln -sF "$DOTFILES_BASE/bin/mail_sync.sh" ~/.mutt/bin/mail_sync.sh
ln -sF "$DOTFILES_BASE/bin/print_message.sh" ~/.mutt/bin/print_message.sh
ln -sF "$DOTFILES_BASE/bin/smime_password.sh" ~/.mutt/bin/smime_password.sh
ln -sF "$DOTFILES_BASE/bin/view_attachment.sh" ~/.mutt/bin/view_attachment.sh
ln -sF "$DOTFILES_BASE/bin/url_view.sh" ~/.mutt/bin/url_view.sh

printf "done.\n"

printf "Copy Launchd: "
ln -sF "$DOTFILES_BASE/launchd/com.colin.icloud.isync.plist" ~/Library/LaunchAgents/com.colin.icloud.isync.plist
printf "done.\n"

 note to install sshkeys
 note to install smime keys
 note to setup keychain passwords
 note to edit mopidy.conf

 maybe a s/foo/bar/g style replacement for username, email address, passwords
 and fullname placeholders are a good idea.
