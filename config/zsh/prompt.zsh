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
prompt='%F{%(?.green.red)}%1~❯%f '
