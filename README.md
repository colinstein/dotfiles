# Dotfiles

## Getting Started

  1. `git clone ~/src/github.com/me/dotfiles` to get a copy of things
  2. `git submodule init` to setup submodules for zsh
  3. `git submodule update` to pull the latest updates
  4. Read through `install.sh` and run commands. I'd do it line-by-line so
     you can trust what's happening.
  5. Modify `config/mopidy/mopidy.conf` to have your own spotify details
  6. Look over `macsettings.sh` and apply them manually

### Note
This has a couple of submodules for ZSH syntax highlighting and autocomplete
from history. Y

I tend to shy away from large frameworks and plugins but sometimes it doesn't
make much sense to try and re-invent the wheel, particularly in the case of
Vim.

Take a look at install.sh to see where files go, or run it. It's probably fine.
There's a built-in assumption that all the important stuff (vim, alacritty,
zsh, etc) has been installed by something like home brew or from ports.

I'm leaning towards lower contrast, less colours, fewer features as time goes
on. I'm not convinced that (for example) having the nearest matching history
entry available as an auto-complete+run, or the syntax highlighting on the
command prompt is really getting me something worth the code in the submodule.
Likewise, I'm leaning towards nord as a starting point towards a more
monochromatic color scheme. This one only uses about 8 colours and uses them
pretty sparingly in vim.

## Software to install
- coreutils
- fzf
- neovim
- reattach-to-user-namespace
- ripgrep
- telnet
- tmux
- urlview

## Todo
- Look into getting a more complete go configuration. Sadly my usual setup
  conflicts a bit with work tools so I need to figure something out there.

- Getting "good" suggestions for ruby would be nice - solargraph is supposed
  to be there but so far I haven't been impressed.
