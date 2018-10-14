# Often commands are frequently used with options on every invocation, or the
# command sequence is long and difficult to remmber but never changes. For
# these situations aliases make a lot of sense: they're easy/short sequences to
# type that pack a lot of functionality In cases where you need to invoke a
# command without the alias you can always prefix the comamnd with a `\`.

# Using neovim rather than vim has been a thing I've done for a while now, but
# i can't get into the habit of typing slightly more characters.
alias vim='/usr/local/bin/nvim'

# vimdiff is a program that comes bundled along with system vim, but as I'm
# using neovim it won't load my configuration files. The solution is to alias
# this to neovim's diff mode
alias vimdiff='/usr/local/nvim -d'

# These aliases for ls use the GNU version which has many more features than
# the BSD version that ships with my operating system. They're all very similar
# save for the last option
#   --group-directories-first ignores the default purely alphabetical behaviour
#   and sorts directoires to the 'start' of the list so that files will be sorted
#   twowards the end
# --color=auto causes colourized output when writing to a terminal (e.g. you
#   typed `ls` but disables it when not (e.g. it's being redirected to a file or
#   as input to another command) so that you don't have to worry about escape
#   codes in your output
# --classify appends a symbol based on the entry type:
#   `*` for executables
#   `/` for directories
#   `|` for named pipes
#   `@` for links
#   `=` for a socket
#   `>` for a door
# --human-readable converts raw 'bytes' sizes into more human friendly numbers
#   like kilobytes (K) and gigabytes(G).
# --si causes the human-readable output to use SI-units (powers of 1000) rather
#   than powers of 1024
# --literal prints entires without quoting. Instead of seeing a directory
#   called "application support" printed as `'application support'/` it'll come
#   out as `application support/`
alias ls='/usr/local/bin/gls --group-directories-first --color=auto --classify --literal --human-readable --si'
# list in long format, including flags, owner, group, size, and date
alias ll='/usr/local/bin/gls --group-directories-first --color=auto --classify --literal --human-readable --si -l'
# list 'all' entries, including ones that start with `.`. The -A ignores the
# implied entires `.` and `..`, where as the -a version would include them
alias la='/usr/local/bin/gls --group-directories-first --color=auto --classify --literal --human-readable --si -A'
