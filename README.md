# Colin's Dotfiles
This is a script to download and install my regular command line tools
and then to configure them by simlinking dotfiles to the location where
they belong.

## Prerequisites
This assumes a clean install of Mac OS X 10.11 along with the XCode
developer tools and command line tools are installed. To install the
command line developer tools run:

    $ xcode-select --install

You will have to agree to the license in order to continue. XCode can be
installed from the Mac App Store. Some Homebrew software requires the full
XCode IDE to build; the command line tools are not enough.

You'll need to configure your own keychain entries for a number of passwords
so that they aren't stored on disk. Unfortunately some tools cannot lookup
passwords from a central repository and so they must be stored on disk. In those
cases you'll have to rely on disk encryption and permissions to keep those
secrets safe.

## Get Started
Assuming you have a mac, git, and the usual tools installed:

  1. Clone the repository somewhere:

      $ git clone git@github.com/colinstein/dotfiles.git ~/.dotfiles

  2. Run the install script for CLI tools

      $ ~/.dotfiles/bin/install_cli_tools.sh

  3. Run the installer

      $ ~/.dotfiles/bin/install_dotfiles.sh

### Final Chores
There are a few steps that aren't done automatically yet. That will change with
more clever installers but for now these steps are done manually. They're
important to get right because they handle security and authentication.

#### Install SSH Keys
Copy your SSH keys into ~/.ssh and set their permissions appropriately. They
must be set to either `0600` or (better yet) `0400` or they will be ignored
by your SSH clients.

#### Install your SMIME Keys
This takes a few steps involving

  1. `smime_keys add_p12 /path/to/key`
  2. Add the password for the key to keychain.
  3. Edit muttrc to specify the correct key number.

`smime_keys.sh` is broken. I used to be lazy and store the key as plain text
inside that file. If you add your key to it then everything works. I'm planning
to do the right thing here.

#### Plain Text Passwords
This sucks, but there's no other way to make it work. You'll have to edit
the following files and add:

  * `~/.config/mopidy/mopidy.conf` add passwords for Google Music, spotify, and
    those for any other services you intend to use.

The mopidy.conf file is copied rather than symlinked so you won't accidentally
commit your passwords to the repo and share them on github.

#### Create Keychain Passwords
To avoid storing passwords in plain text, they should be added to keychain so
that they can be extracted via the security tool. So far the required password
list includes:

  * iCloud Email:

    $ security add-generic-password -D "email password" -C "mutt" -c "mutt" \
      -d "email password" -s "IMAP" \
      -a "EMAILGOESHERE" \
      -w "PASSWORDGOESHERE"


Change out the email/password lines as appropriate.

## Known Issues
This is a work in progress. While I have all of this software working nicely
on several computers I've never bothered to automate the install process 100%
so this repository will evolve over time.

The configuration for SMIME keys in muttrc won't work out of the box. They're
configured to use the 'password file' flag to allow access to keys but
`bin/smime_keys.sh` is a shell script. My plan is to pass the password directly
and use `$(smime_keys.sh)` along wth the password flag instead. Those passwords
will have to be moved into keychain too.

You can't apply the sidebar and index colour patch in mutt. Those both depend on
a pristine repository. If I want them to work together I'm going to have to
manually apply them and resolve the conflicts. I'm not very excited to maintain
my own fork of mutt.

`Imgcat` is very slow and I should re-write it in a faster language.

Some vim plugins could use a trim. Do I really need airline or can I get by with
just statusline settings? When was the last time I touch haml or coffescript? On
the other hand, I really should get ctags installed as part of `install_cli.sh`

I haven't even touched weechat config. It'll probably get complicated because I
want to talk to my friends on hipchat and colleagues on slack. Having access to
Skype would be better still.

I need to make it easier to plug in full name, email, username, etc. into config
files. I can do that by having a short "pre-run" script that collects that info
and then uses sed to replace placeholders. In that case I'll probably want to
change form symlinking to copying files -- but that has it's own list of issues.
This will require more thought.

I need to get a few more programming environments set up: go, lua, and python.

I need to add support for Ansible and Kubernetes.

I should probably get calendaring options working in the CLI. At work we're
using Google's calendar but at home I prefer Apple's. There's got to be a nice
way to make both work well.

Mutt's status line could be better. I wish it showed the number of new messages
in my various sub-boxes.

The ncmpcpp scheme could use a bit of work. Keybindings are fine but colours
just don't mix that well.

Tmux all the things.

I should add my work account to mutt because it's GMail and everyone wants to
use that. Having an easy way to switch accounts in mutt is also worth
showing off. In the grand scheme of things, maybe checking out sup/notmuch might
be worth doing.

display_filter.sh should really be tidied up. It's hacked to work but I know it
could be so much better if I were less lazy. Wrap lines at 80 chars, purge double
blank lines. Maybe evern strip the 'dross' from elinks so that `[img]` appear in
messages. One thing I'd really like is nice UTF-8 notices, maybe in the status
line for encrypted, signed, number of attachments, and its spam score.

Flagging messages as spam for icloud to detect also seems like a good use of my
time even though I don't really have a problem with spam getting through.

