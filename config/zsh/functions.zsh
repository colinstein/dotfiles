# display a grid of foreground/background colour combinations.the commented
# pair of arrays include all of the bright colours, where the default set only
# includes the standard 8 plus default coreground/background.
function colours() {
  local usage="Usage: $0 --bright\n--bright\toptional\tInclude bright versions of colours.\n"
  local fgcolors=(39 30 90 31 32 33 34 35 36 37)
  local bgcolors=(49 40 100 41 42 43 44 45 46 47)

  case "$1" in
    '')
      ;;
    --bright)
      fgcolors=(39 30 90 31 91 32 92 33 93 34 94 35 95 36 96 37 97)
      bgcolors=(49 40 100 41 101 42 102 43 103 44 104 45 105 46 106 47 107)
      ;;
    *)
      printf $usage
      return 0
      ;;
  esac

  printf '\n\e[30m  F↓B→ \e[90m'
  for bgcolor in $bgcolors; do
    printf '%-7s ' "  $bgcolor"
  done
  print '\e[0m'

  for fgcolor in $fgcolors; do
    printf '\e[90m%5s\e[0m ' "$fgcolor"
    for bgcolor in $bgcolors; do
      printf '\e[%sm\e[%sm  •••  \e[0m ' "$fgcolor" "$bgcolor"
    done
    print
  done
  print
}

# generate "tags" files for ruby. Eventually I should make this handle
# go/c/rust but I'm not really having enough issues with the existing tooling
# for those languages to make this necessary. Assuming you've got starscope and
# ripper-tags setup this will be good to go. It's a bit dated so I should
# probably check for those commands being available first.
function gentags() {
  case $1 in
    ctags)
      ripper-tags -f tags -R --exclude=.git --exclude=log . 2>/dev/null
      ;;
    cscope)
      starscope -e scope 2>/dev/null
      ;;
    --help)
      printf "try: 'gentags [kind]'\n"
      printf "where [kind] is 'ctags' or 'cscope'\n"
      printf "defaults to --help\n"
      ;;
    *)
      gentags --help
      ;;
  esac
}

# It's much more convenient to track a single private key file than a pair of
# private and public keys. This command will extract the public key from a
# private key
# Extract a public key from a private key
function public_key() {
  ssh-keygen -f $1 -y
}

# If for some reason you really want to purge the macOS DNS cache, this is the
# way to do it. flush the cache and restart mDNSResponder
function flush_dns() {
  sudo dscacheutil -flushcache
  sudo killall -HUP mDNSResponder
}

# Fetch the weather. The location is hard coded which is 
# Fetch the weather
function weather () {
  local place="$2"
  if [[ -z $2 ]]; then
    place="ottawa"
  fi

  case $1 in
    all)
      command curl -s http://wttr.in/${place}
      ;;
    small)
      command curl -s http://wttr.in/${place} | head -n7 | tail -n5
      ;;
    today)
      command curl -s http://wttr.in/${place} | head -n17 | tail -n15
      ;;
    --help)
      printf "try: 'tv [kind] [location]'\n"
      printf "kind\toptional\tone of all, small, or today\n"
      printf"\t - all\tCurrent conditions plus three day forecast\n"
      printf"\t - small\tThe current conditions only\n"
      printf"\t - today\tThe current conditions plus full day forecast\n"
      printf "place\toptional\tThe location to fetch weather\n"
      printf "defaults to 'today' 'ottawa'.\n"
      ;;
    *)
      weather today
      ;;
  esac
}

# A simple wrapper around mapscii so you can explore maps in the terminal. this
# should probably check if telnet is installed
function maps() {
  telnet mapscii.me
}

# This is a widget that transforms ",,,," into "../../../" when you're tpying at
# the Zsh prompt
function expand_dots() {
  [[ $LBUFFER = *.. ]] && LBUFFER+=/.. || LBUFFER+=.
}
zle -N expand_dots # Declares the function as a widget for the Zsh line editor

# When using tab complete, start by showing an ellipses, then when the results come in, redraw things.
function expand_or_complete_with_ellipses {
  echo -n '…'
  zle expand-or-complete
  zle redisplay
}
zle -N expand_or_complete_with_ellipses # declare this as a widget for the zsh line editor"

