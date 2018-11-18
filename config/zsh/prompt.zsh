# simple prompts are better prompts. This one will: change from green to red
# when the previous command fails. Turn blue when in "normal mode", shorten the
# path into something small. Nonsense like git branch name just aren't
# something I get much value from.  have a look at
# https://github.com/robbyrussell/oh-my-zsh/pull/5262/files for path shrinking
#   %1~ gives us the last part of the current working directory with ~ for home
#   %F{…} starts a color change determined by the conditional inside
#   %(?.green.red) inside of the %F{} returns
#     green if the last command exited with 0
#     red in other cases
#   ❯ is just a character literal. It's useful to not use a regular '>'
#     so that you can search for it to find the start of the previous command
#   %f stops the colour change, and then there's a blank space after the prompt

function compute_short_pwd() {
  local shortened_path full_path part current_path_part first_part
  local -a split
  split=(${(s:/:)${(Q)${(D)1:-$PWD}}})

  if [[ $split == "" ]]; then
    SHORT_PWD=/
    return 0
  fi

  if [[ $split[1] = \~* ]]; then
    first_part=$split[1]
    full_path=$~split[1]
    shift split
  fi

  if (( $#split > 0 )); then
    part=/
  fi

  for current_path_part ($split[1,-2]) {
    while {
      part+=$current_path_part[1]
      current_path_part=$cur[2,-1]
      local -a glob
      glob=( $full_path/$part*(-/N) )
      (( $#glob > 1 )) || [[ $part == (.|..) ]] && (( $#current_path_part > 0 ))
    } { }
    full_path+=$part$current_path_part
    shortened_path+=$part
    part=/
  }
  SHORT_PWD=$first_part$shortened_path$part$split[-1]
  return 0
}

compute_short_pwd
add-zsh-hook -Uz chpwd compute_short_pwd
prompt='%F{%(?.green.red)}${SHORT_PWD}❯%f '
