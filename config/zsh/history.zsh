# Zsh has a remarkably clever history that can be synced between sessions,
# ignores duplicates, and cleverly searched.

# In base you can set the history size to unlimited by nulling these variables,
# in practice there is always some limit (physical memory+disk space) so you
# might as well set something very high.

# `HISTSIZE` controls how many entries are loaded into memory
export HISTSIZE=10000

# `SAVEHIST` controls how many entries are loaded into memory
export SAVEHIST=10000

# You can store your history anywhere you like, but this is a common choice.
# XDG specs defines a couple of possible alternative locations; `XDG_DATA_HOME`
# or `XDG_CACHE_HOME` seem like good options too.
export HISTFILE=$HOME/.zhistory

# Ingore all dupes prevents writing entries to the history if they are
# duplicates of any previous entry. This tends to make searching with ^r more
# effective if you know what you're looking for. The consequence is that the
# old history entries for a given command will be removed as they are
# 're-entered' and used again.
setopt hist_ignore_all_dups

# It's useful to have some command not pollute the history. When you need that,
# prefix the command with a space and it'll be ignored by the history.
setopt hist_ignore_space

# normally when the history is read it's just split on whitespace which means
# quoted whitespace may not be handled correctly. This forces handling of
# history entries as used in the normal command line however it may be slower,
# especially as history size grows large.
setopt hist_lex_words

# Remove needless whitespace from history entries. It'll make searching have
# nicer results and shouldn't harm anything else.
setopt hist_reduce_blanks

# When writing the history, if a new entry duplicates an older one, the older
# entry will be dropped
setopt hist_save_no_dups

# When a line is loaded from history, don't execute it directly, instead put it
# on the editing line so it can be reviewed/modified first.
setopt hist_verify

# SHARE_HISTORY causes the history to be written as commands are issued, it
# also causes shells to import commands from the history as they are added.
# This has the effect of making all instances of Zsh share a common history A
# side effect of this setting is that the history is written with
# `EXTENDED_HISTORY` style timestamps and duration too.
setopt share_history
