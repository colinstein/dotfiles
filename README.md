# Colin's DotFiles
A collection of 'dotfiles' I use to configure my regular software suite. You can
Install the files using the `install.sh` script. I'm assuming you're using
Mac OS X 10.11, however this should mostly work on Linux too. There are some
minor exceptions that should be obvious: using Home Brew to install applications,
using Launchctl to start background tasks, etc. If you just want to see how I
configure my software then this repository should be of some value.

I have just started working on this project using a new laptop with a fresh
install of my operating system. For the time being consider this a
*Work in progress* and use appropriate caution.

## Getting Started
Assuming you have a mac, git, and the usual tools installed:

  1. Clone the repository somewhere:

      $ git clone git@github.com/colinstein/dotfiles.git ~/.dotfiles

  2. Rune the installer

      $ ~/.dotfiles/link_dotfiles.sh

## Prerequisites
There are only a handful of applications I use on the desktop, most are going
to be installed via Home Brew. You can install those applications however you
like (probably with Home Brew). I'm going to leave the customization and
installation of various software packages for another document. You'll probably
find a file called `install_software.sh` that will do all the busy work, and
then an `install.sh` that first installs the software and then links dotfiles
added when I'm finally happy with all of this.

There are going to be some manual steps that must be completed: those will
include tasks like configuring passwords and user names to be appropriate for
the computer that this is being run on.

## Software
Most of my applications are command line tools however I do use a few graphical
applications. I try to avoid installing those form the Mac App Store because
those applications may be more restricted than versions installed from the
manufacturer due to OS X sandboxes for App Store sourced software.

### Graphical Software
My regular suite of graphical tools includes:

   1. 1Password
   2. Creative Cloud
   3. Alfred + Powerpack
   4. Amethyst
   5. Chrome
   6. Dropbox
   7. Firefox
   8. Iterm
   9. Karabeiner
  10. Little Snitch
  11. Paw
  12. Sequel Pro
  13. The Unarchiver
  14. Tor Browser
  15. Transmission
  16. Tunnel Bear
  17. VLC

### Command-Line Software
My regular suite of command line tools includes:

  * zsh
  * git
  * hub
  * rbenv
  * ruby-build
  * ruby 2.3
  * bundler
  * openssl
  * curl
  * wget
  * coreutils
  * msmtp
  * mbsync
  * mutt
  * elinks
  * contacts
  * imgcat
  * htop
  * httpie
  * netcat
  * silver searcher
  * terminal notifier
  * weechat
  * vim
  * mopidy
  * ncmpcpp
  * vagrant
  * docker
  * zprezto

This list is presented in no particular order. I haven't finished setting it all
up so it may be subject to change.
