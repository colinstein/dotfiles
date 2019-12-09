# This file needs to be loaded last because syntax highlighting requires that.
# the easiest way to force that to happen is to just name this file starting
# with a a prefix starting with a Z
#
# This file is intended to hold "wholesale imports" of third party tools. The
# probably depend on code that I didn't write and may require the installation
# of binaries in order to work correctly

# Things within this block are only loaded for interactive shells, not those
# started (for example) by #!/usr/local/bin/fzf shebangs at the start of a
# script.
if [[ $- == *i* ]]; then; 

  # dev is an internal tool that manages your development dependencies for our
  # internal corporate projects. see #dev/internal-tools on chat for details.
  if [[ -f /opt/dev/dev.sh ]]; then
    source /opt/dev/dev.sh
    chruby '2.6.5'
  else
    # source chruby
    if [[ -f /usr/local/share/chruby/chruby.sh ]]; then
      source /usr/local/share/chruby/chruby.sh
    fi
    # auto-changing is a nice feature to have at work when you're frequently
    # swapping projects, but for my personal projects I prefer to manage that
    # manually and keep everything 'up to date'. Set the default ruby version
    # here (Note, it'll have to be installed manually:
    #   ruby-build 2.6.0 ~/.rubies/ruby-2.6.0
    # this is a location that chruby should automatically find it.
    chruby 'ruby-2.6.3'
  fi

  # FZF requires the installation of https://github.com/junegunn/fzf, it's a
  # general purpose command-line fuzzy finder. Its used within vim to provide
  # file picker duties but also at the CLI for finding tasks to kill,
  # directories or files to modify, etc.
  if [[ -f /usr/local/Cellar/fzf/0.17.5/shell/key-bindings.zsh ]]; then
    source /usr/local/Cellar/fzf/0.17.5/shell/key-bindings.zsh
    # with fzf loaded, we can set some useful binds and colours:
    # ^a to select all
    # ^d to deselect all
    # ^t to toggle selection of an element
    # simplified colours that will rely on the terminal colour scheme
    export FZF_DEFAULT_OPTS='--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all --color fg:4,hl:8,fg+:15,bg+:0,hl:4,info:8,prompt:3,pointer:4,spinner:4,marker:4'
  fi

  # Dircolors makes your directory listing look pretty by assigning particular
  # colours to file types over and above what you get form ls --color=auto, for
  # example turning all jpegs red, or all links blue. This builds an
  # environment variable used by ls to colour output by reading a config file
  # if it exists and the command to parse it does too
  if [[ -f $HOME/.config/dircolors/nord.dircolors ]] && (( $+commands[gdircolors] )); then
    eval $(gdircolors "$HOME/.config/dircolors/nord.dircolors")
  fi

  # This places inline completion suggestions based on your command history. This
  # is another one I'm not totally convinced is worth the complexity but I'm
  # going to give it a shot.
  if [[ -f $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh ]] then
    source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi

  # This is a third party syntax highlighting script from zsh-users. I'm not sure
  # its worth the complexity of keeping it around but I want to give it a shot,
  # mostly to see how manually managing plugins feels without something like
  # zpresto. It has to be sourced after all other things have been included.
  if [[ -f $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] then
    source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
fi
