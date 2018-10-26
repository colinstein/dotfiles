# Dotfiles

I tend to shy away from large frameworks and plugins but sometimes it doesn't
make much sense to try and re-invent the wheel, particularly in the case of
Vim.

Take a look at install.sh to see where files go, or run it. It's probably fine.
There's a built-in assumption that all the important stuff (vim, alacritty,
zsh, etc) has been installed by something like home brew or from ports.

I'm leaning towards lower contrast, less colours, fewer features as time goes
on. I'm not convinced that (for example) having the nearest matching history
entry available as an auto-complete+run, or the syntax highlighting on the
command prompt is really getting me something worth the code in the submodule.
Likewise, I'm leaning towards nord as a starting point towards a more
monochromatic color scheme. This one only uses about 8 colours and uses them
pretty sparingly in vim.

## Todo

Replace the prompt's 'last part of pwd' with a 'shortened version of
pwd'. Look into getting a more complete go configuration. Sadly my usual setup
conflicts a bit with work tools so I need to figure something out there.
Getting "good" suggestions for ruby would be nice - solargraph is supposed to
be there but so far I haven't been impressed.

Wrappers around chruby et al. to account for the fact that I may not have dev
on every computer.

Minor updates to Alacritty to deal with deprecated options.

GNU manpath environment updates
