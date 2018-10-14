# LESS uses termcap rather than terminfo for chatting with the terminal. by
# adding some additional settings, less will be able to display man pages with
# fancy highlighting. In this case we're adding a purple colour for headlines
# and italic blue for arguments The comments describe what these normally
# enable. Long term the right place for this is to live in ~/.lesskey but for
# environment variables are fine
export LESS_TERMCAP_mb=$(printf '\e[03;37m') # Start Blinking Mode
export LESS_TERMCAP_md=$(printf '\e[00;35m') # Start double-bright
export LESS_TERMCAP_me=$(printf '\e[0m')     # Turn off everything
export LESS_TERMCAP_so=$(printf '\e[00;36m') # Standout Start
export LESS_TERMCAP_se=$(printf '\e[0m')     # Standout End
export LESS_TERMCAP_us=$(printf '\e[03;34m') # Underline Start
export LESS_TERMCAP_ue=$(printf '\e[0m')     # Underline End
