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

  * SMIME Keys

    $ security add-generic-password -s "EMAILGOESHERE 2016 smime" \
      -C "mutt" -c "mutt" -D "MIME" \
      -a "EMAILGOESHERE" \
      -w "PASSWORDGOESHERE"

Change out the email/password lines as appropriate.

#### Load Launchd configuration
The extra configurations for Launchd are not loaded automatically because they
depend on passwords being correctly entered into configuration files. There's a
small risk that a service will fail without passwords and start refusing new
connections as a security precaution. Rather than risk confusion about why a
service is failing, we'll just do this step manually at the end.

  * Setup mopidy:

    $ launchctl load ~/Library/LaunchAgents/homebrew.mopidy.mopidy.plist

  * Setup isync:

    $ launchctl load ~/Library/LaunchAgents/com.colin.icloud.isync.plist

#### Get Slackcat working
The easiest way to generate an auth token is to run:

    $ slackcat --configure

Then follow the instructions to add data to `~/.slackcat`

#### Hack in the weechat configuration
I need to find a way to back this up or make it automatic. It's pretty insane to
be doing this kind of setup by hand. First, start weechat:

    $ weechat

Next you have a handful of commands to run in weechat. Commands in weechat wil
use the ">" prompt. First we'll get some helpers to manage buffers:

    > /script install buffers.pl buffer_autoclose.py

Then we'll tidy up nicks so they're easier to tell apart:

    > /script iset.pl go.py colorize_nicks.py

Finally, a key-bind to make 'going' to rooms a bit easier.

    > /key bind meta-g /go
    > /key bind meta-n /bar toggle nicklist
Now to tidy up the colors a little bit.

    > /set weechat.bar.title.color_bg 0
    > /set weechat.bar.status.color_bg 0
    > /set weechat.color.chat_nick_colors 1,2,3,4,5,6
    > /set buffers.color.hotlist_message_fg 7

And finish by setting the buffer bar to the top like in vim

    > /set weechat.bar.buffers.position top
    > /set weechat.bar.buffers.items buffers

Then some options to stop all the spam we're likely to get:

    > /set irc.look.smart_filter on
    > /filter add irc_smart * irc_smart_filter *

And some prettyness icons:

    > /set weechat.look.prefix_same_nick "⤷ "
    > /set weechat.look.prefix_error "⚠ "
    > /set weechat.look.prefix_network "ℹ  "
    > /set weechat.look.prefix_action "⚡ "
    > /set weechat.look.bar_more_down "▼▼ "
    > /set weechat.look.bar_more_left "◀◀"
    > /set weechat.look.bar_more_right "▶▶"
    > /set weechat.look.bar_more_up "▲▲"
    > /set weechat.look.prefix_suffix "╡"

And to make some things easier to read:

    > /set weechat.look.prefix_align_max 15
    > /set weechat.look.buffer_time_format "${253}%H${245}%M"

Finally, head to https://api.slack.com/docs/oauth-test-tokens and generate a
token for slack. Install the token with:

    > /set plugins.var.python.slack_extension.slack_api_token TOKEN_GOES_HERE

Tokens typically look something like `XOXP-1234567-1234567-1234567-a9a9a9a9a`

## Known Issues
This is a work in progress. While I have all of this software working nicely
on several computers I've never bothered to automate the install process 100%
so this repository will evolve over time.

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

### Weechat
All the weechat stuff is stored in ~/.weechat Apart from installing plugins I
think all that will have to be done manually is installing the token. That whole
section above needs to be gutted.
