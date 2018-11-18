# `.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.

# Colors provides a nice way to interat with colours in prompts etc. Start an
# uppercase letter and end it with a lowercase letter. For example "%Bbold%b
# text" would produce the text 'bold text' where the wrold bold is in boldface.
# Further options are:
# %F{colorname} / %f to set colors
# %K{colorname} / %k for background colors
# %B / %b to set boldface
# %U / %u to set underline
autoload -Uz colors
colors

# add-zsh-hook allows us to wire up functions that are called automatically
# when certain events happen. For example, a function that fire when the
# current directory changes or before a command is executed. We'll be using
# this in prompt.zsh to automtically compute a 'short' version of the
# working directory to display in the prompt.
autoload -Uz add-zsh-hook

# Enable completion
autoload -Uz compinit
compinit -C

# TODO: Use zrecompile to speed up all the things
# autoload -U zrecompile
# zrecompile -p $HOME/.zcompdump $ZDOTDIR/.zshrc &>/dev/null

# enable u type something that is not a command (`home`)
# it can try to automatically cd into that as if it were a directory. I don't
# care much for that behaviour so I'm explicitly ape approach that here even though
# it's off by default
unsetopt auto_cd

# zsh has an option to detect 'incorrect' commands, usually caused by typing
# mistakes and offer to 'correct' them with a near match (e.g. `sl` -> `ls`). I
# find this sort of nagging annoying because usually the issue isn't a
# misspelling but a path issue with some software I'm working on and the
# suggestion doesn't help. I'm explicitly disabling that here even though it's
# off by default.
unsetopt correct

# when changing directories, add paths to the pushd stack.
# `dirs -vl` displays the list of pusd directories and their indexes
# `popd` goes to the dir on the top of the stack and drops it form the stack
# `popd +#` (# is the index) goes to a dir by index and drops it form the stack
setopt auto_pushd

# reduces the number of entries int he pushd list by ignoring duplicates
setopt pushd_ignore_dups

# `pushd` will not display the current stack after being called
setopt pushd_silent

# normally `cd /foo/bar/..` would change you into /foo.
# if /foo/bar is a symlink to /baz/bing then `cd /foo/bar/..` puts you in /foo
# this 'follows the link' so that you end up in /baz instead
setopt chase_links

# shells will read EOF (sent by `^d`) as a signal to quit. More often than not
# you don't really want to exit, and we've got other nice keys to use for that
# anyway in our terminal emulator or session multiplexer. Usually you just
# fat-fingered `^f` or were trying to scroll. This option disables the default
# quit behaviour by making it ignore that character.
setopt ignoreeof

# Enable parameter expansion, command substitution and arithmetic expansion in
# prompts. Substitutions within prompts do not affect the command status. This
# is enabled so that a new 'SHORT_PWD' can be computed by a function that gives
# the shortest possible non-ambiguous string to represent PWD in PS1.
setopt prompt_subst

# ensure the cdpath doesn't contain duplicates and add 'important' github
# organizations to the cdpath to make it easier to activate projects that are
# frequently used with `cd repository_name`
typeset -U cdpath cdpath=(
  $HOME/src/github.com/colinstein
  $HOME/src/github.com/shopify
  $cdpath
)

# ensure the path does not contain duplicates and add some paths in the home
# directory to the start of the list so that user-compiled binaries can
# replace system supplied ones more easily
typeset -U path
path=(
  $HOME/src/bin
  $HOME/.cargo/bin
  $path
)

# Rather than letting this file grow to 'crazy big' we'll move extra
# functionality out into stand alone files. If you add files with with the .zsh
# extension to $ZDOTDIR then this will automatically source them. in
# alphabetical order
for file in $ZDOTDIR/*.zsh(n); do
  source $file
done

# Setup automatic expansion of "dots" so that you can keep mashing "." to get
# from "..." to ../../" without needing to type a bunch of extra periods or
# slashes. Function is defined in functions.zsh
bindkey . expand_dots # Binding the dot rationalizer to typing a "." in insert mode
bindkey -M isearch . self-insert &>/dev/null # Don't rationalize dots in the search

# accept the history recommendation with ctrl+space
bindkey "^ " autosuggest-execute

# auto complete with tab key, function is defined in functions.zsh
bindkey "^I" expand_or_complete_with_ellipses

# Anable case-insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:descriptions' format %{$fg[yellow]%}%d%f   # Draw group descriptions in yellow
zstyle ':completion:*:messages' format %{$fg[cyan]%d%f           # Draw messages in cyan
zstyle ':completion:*:warnings' format %{$fg[red]%}No matches%f  # Draw no matches warning in red

zstyle ':completion:*' accept-exact '*(N)'                        # Ignore partial globs to make completion faster
zstyle ':completion:*' accept-exact-dirs true                     # demand exact dir paths
zstyle ':completion:*' use-cache on                               # Use completion caching to improve performance
zstyle ':completion:*' verbose true                               # Prefer the most verbose completion
zstyle ':completion:*:options' description yes                    # Describe options.

# Pretty up the menu that gets show for tab completes
zstyle ':completion:*:default' menu select                        # Want to have menu complete for ambiguous matches
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}     # Use dircolors when completing directories
zstyle ':completion:*:matches' group yes                          # Group matches (e.g. files vs directories)
zstyle ':completion:*' group-name ''                              # for any group

# Turn on some default completers
zstyle ':completion:::::' completer _complete _ignored _approximate
zstyle ':completion:*'    completer _complete _ignored _approximate

# CD Completion:
zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'  # sort order
zstyle ':completion:*:cd:*' ignore-parents parent pwd                                         # don't show . or ..
zstyle ':completion:*' list-dirs-first true                                                   # Separate directories from files.

# CP RM and MV Completion
zstyle ':completion:*:(rm|mv|cp):*' ignore-line yes    # Don't use words on the line as possible completions
