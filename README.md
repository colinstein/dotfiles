# Colin's Dotfiles
This is a script to download and install my regular command line tools
and then to configure them by simlinking dotfiles to the location where
they belong.

## Prerequisites
This assumes a clean install of Mac OS X 10.11 along with the XCode
developer tools and command line tools are installed. To install the
command line developer tools run:

    $ xcode-select --install

You will have to agree to the license in order to continue. XCode can be
installed from the Mac App Store. Some Homebrew software requires the full
XCode IDE to build; the command line tools are not enough.

You'll need to configure your own keychain entries for a number of passwords
so that they aren't stored on disk. Unfortunately some tools cannot lookup
passwords from a central repository and so they must be stored on disk. In those
cases you'll have to rely on disk encryption and permissions to keep those
secrets safe.

## Get Started
Assuming you have a mac, git, and the usual tools installed:

  1. Clone the repository somewhere:

      $ git clone git@github.com/colinstein/dotfiles.git ~/.dotfiles

  2. Run the install script for CLI tools

      $ ~/.dotfiles/bin/install_cli_tools.sh

  3. Run the installer

      $ ~/.dotfiles/bin/install_dotfiles.sh

### Notes
#### Known Issues
This is a work in progress. While I have all of this software working nicely
on several computers I've never bothered to automate the install process 100%
so this repository will evolve over time.

There are no tests. While I like the idea of automatic testing for dotfiles
I'm not sure of a good way to script that in a way that isn't more work than
just fixing errors as they appear. Many bits of software depend on passwords
that I'd rather not have as part of a CI suite and the fact that I'm targeting
Mac OS X makes automatic testing more complex than just using Vagrant and some
test-runner.

While there are third party libraries to handle this sort of bootstrapping, I
am partial to the simplest solution without any external dependencies. Also,
I think that using OSAScript might make some of the tricky parts like adding
passwords to Keychain a little less annoying.

#### Command-Line Software
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
