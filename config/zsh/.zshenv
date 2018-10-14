# Sourced on all invocations of the shell, unless the -f option is set. It
# should contain commands to set the command search path, plus other important
# environment variables. `.zshenv' should not contain commands that produce
# output or assume the shell is attached to a tty.

# zshenv -> zprofile -> zshrc -> zlogin ->  logout
# (all)  -> (login)     (tty) -> (login) -> (login)

# In order to ensure this file is parsed, make sure that either $ZDOTDIR is set
# by the teminal emulator or create a stub file at ~/.zshenv that sourcs it.
# This is an exmaple of what such a file might look like

#     This is a stub file that sets ZDOTDIR and then loads the remainder of the
#     zsh configuration form that directory. You can avoid using this file by
#     setting an appropriate environment variable in your terminal emulator or
#     elsewhere but this makes it explicit and only needs to be set once to
#     work across multiple programs. An alternative approach would be to
#     symling $ZDOTDIR/.zshenv to this location.
#     ZDOTDIR=$HOME/.config/zsh
#     source $ZDOTDIR/.zshenv

# open is a macOS standard tool that 'does the the thing as finder' based on
# the path provided
export BROWSER=open

# editor is supposed to be a default editor that can work without 'advanced
# terminal features' (like a cursor). Normally programs will VISUAL first, and
# then fall back to editor, but if for some reason we really need a low-feature
# editor then this should be set to something reasonable. nvim -e uses neovim
# but makes it behavae like "ex". Typing 'visual' will convert it back to
# 'normal' neovim if the program was 'wrong'.
export EDITOR='nvim -e'

# by default macOS will use /usr/bin/vim as the default editor for things like
# editing git commits. Setting it to something you prefer here will make it so
# can always use your prefered text editor to modify text. Ordinarily VISUAL is
# checked before trying EDITOR when looking for a program to modify some text
# and can safely be set to a program that requires 'advanced' visual terminal
# features, like vim or emacs rather than a line editor like ed or ex.
export VISUAL=nvim

# `less` is a program similar to `more` but it allows scrolling forwards and
# backwards. Key-bindings are similar to those in Vi: `^f` and `^b` to scroll
# forward and back `/` and `?` to search, `q` to quit `u` and `d` to scroll
# half pages `123g` to go to line 123 `11p` to go 11% through the file `&` to
# show only lines that match a pattern `v` to open in $VISUAL or $EDITOR
export PAGER=less

# home brew defaults to sending some tracking/analytics data back to Google.
# While this does not disable all the tracking (e.g. on initial install) it's a
# start. The maintainers are not terribly interested in making this opt in by
# default (see issue #142) which I suppose means the only real fix is another
# package manager or a hard fork. Sadly I can't opt out of this at work so here
# we are.
export HOMEBREW_NO_ANALYTICS=1
