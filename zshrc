# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt AUTO_CD
unsetopt CDABLE_VARS
unsetopt CORRECT
setopt PUSHD_IGNORE_DUPS

if [ -x /usr/local/bin/gdircolors ]; then
  test -r ~/.dircolors-solarized-dark && eval "$(gdircolors ~/.dircolors-solarized-dark)" || eval "$(gdircolors)"
  alias ls='/usr/local/bin/gls -F -N --group-directories-first --color=auto'
  alias la='/usr/local/bin/gls -a -N --color=auto'
  alias ll='/usr/local/bin/gls -lA -N --color=auto'
fi

alias mailcount="find ~/.mail/ -type f -not -name '.*' | grep -vE ',[^,]*S[^,]*$' | wc -l"
alias weather="curl -s http://weather.noaa.gov/pub/data/observations/metar/decoded/CYTZ.TXT | sed -n 's/^Temperature\: .* F (\(.*\) C)/\1/p'"

