#!/bin/bash

printf "Homebrew: "
which -s brew > /dev/null 2>&1
if [[ $? != 0 ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Zsh: "
brew list zsh > /dev/null 2>&1
if [[ $? != 0 ]]; then
  printf "\n"
  brew install zsh
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Ensure zsh in /etc/shells: "
grep -q '/usr/local/bin/zsh' /etc/shells
if [[ $? != 0 ]]; then
  sudo bash -c "echo '/usr/local/bin/zsh' >> /etc/shells"
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
    printf "\n\nYou must manually change your shell with:\n"
    printf "\n\tchsh -s /usr/local/bin/zsh'!\n"
  fi
else
  printf "skipped.\n"
fi

printf "Core Utils: "
brew list coreutils  > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install coreutils
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Silver Searcher: "
brew list ag > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install ag
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Htop: "
brew list htop > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install htop
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Git: "
brew list git > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install git
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "hub: "
brew list hub > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install hub
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Contacts: "
brew list contacts > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install contacts
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi


printf "OpenSSL: "
brew list openssl > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install openssl
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Httpie: "
brew list httpie > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install httpie
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Wget: "
brew list wget > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install wget
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Netcat: "
brew list netcat > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install netcat
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Elinks: "
brew list elinks > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install elinks
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Msmtp: "
brew list msmtp > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install msmtp
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Isync: "
brew list isync > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install isync
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Terminal Notifier: "
brew list terminal-notifier > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install terminal-notifier
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Vim: "
brew list vim > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install vim
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Ncmpcpp: "
brew list ncmpcpp > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install ncmpcpp
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Python: "
brew list python > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install python
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Mopidy: "
brew list mopidy > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew tap mopidy/mopidy
  brew install mopidy
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Mopidy-gmusic: "
pip list | grep Mopidy-GMusic > /dev/null 2>&1
if [[ $? != 0 ]]; then
  pip install mopidy-gmusic
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Weechat: "
brew list weechat > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install weechat
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Imgcat: "
brew list imgcat > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew tap colinstein/imgcat
  brew install imgcat
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Mutt: "
brew list mutt > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew tap colinstein/mutt
  brew tap-pin colinstein/mutt
  brew install mutt --with-s-lang --with-trash-patch --with-sidebar-patch
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "RBEnv: "
brew list rbenv > /dev/null 2>&1
if [[ $? != 0 ]]; then
  brew install rbenv
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf "Ruby 2.3.0: "
eval "$(rbenv init -)"
brew list rbenv > /dev/null 2>&1
if [[ $? != 0 ]]; then
  printf "failed."  
else
  rbenv versions | grep 2.3.0 > /dev/null 2>&1
  if [[ $? != 0 ]]; then
    rbenv install 2.3.0
    if [[ $? != 0 ]]; then
      printf "failed!\n"
    else
      # technically these can fail and I should check for success.
      rbenv global 2.3.0
      gem install bundler
      printf "okay.\n"
    fi
  else
    printf "skipped.\n"
  fi
fi

printf "ZPrezto: "
if [ -d "${HOME}/.zprezto" ]; then
  printf "skipped.\n"  
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" > /dev/null 2>&1
  if [[ $? != 0 ]]; then
    printf "failed.\n"
  else
    printf "okay.\n"
  fi
fi

printf "Wee-slack: "
if [ ! -f "${HOME}/.weechat/python/autoload/wee_slack.py" ]; then
  # this could fail, I should check it.
  pip install websocket-client > /dev/null
  mkdir -p ~/.weechat/python/autoload
  curl --silent https://raw.githubusercontent.com/rawdigits/wee-slack/master/wee_slack.py > ~/.weechat/python/autoload/wee_slack.py
  if [[ $? != 0 ]]; then
    printf "failed!\n"
  else
    printf "okay.\n"
  fi
else
  printf "skipped.\n"
fi

printf("\nInstall launchd scripts for manually once you've setup dotfiles:")
printf("\nMopidy: ln -sfv /usr/local/opt/mopidy/*.plist ~/Library/LaunchAgents")
printf("\nIsync:  ln -sfv ./launchd/com.colin.icloud.isync.plist ~/Library/LaunchAgents")
