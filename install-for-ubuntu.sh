#!/bin/bash

if [ `type fish >/dev/null 2>&1` ]; then
  # install fish shell
  sudo apt-add-repository -y ppa:fish-shell/release-2
  sudo apt-get update
  sudo apt-get -y install fish

  chsh -s /usr/bin/fish

  echo "installed fish shell"
fi

if [ ! -e $HOME/.tmux/tmux-powerline ]; then
  [ ! -e $HOME/.tmux ] && mkdir $HOME/.tmux

  # install tmux-powerline
  git clone https://github.com/erikw/tmux-powerline.git $HOME/.tmux

  echo "installed tmux-powerline"
fi

if [ ! -e $HOME/.rbenv ]; then
  # install rbenv
  sudo apt-get -y install build-essential bison libreadline6-dev curl git-core zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf libncurses5-dev
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

  echo "installed rbenv"
fi

if [ ! -e $HOME/.crenv ]; then
  # install crenv
  curl -L https://raw.github.com/pine/crenv/master/install.sh | bash

  echo "installed crenv"
fi

# install neobundle
if [ ! -e ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  echo "you should run following command to setup plugins -> vim -c ':NeoBundleInstall'"

rbenv=$HOME/.rbenv/bin/rbenv

ruby_version=`ruby -v | grep -oe "[0-9]\.[0-9]\.[0-9]"`
latest_ruby_version=`$HOME/.rbenv/bin/rbenv install -l | grep -v - | tail -1`
if [ $ruby_version != $latest_ruby_version ]; then
  echo "install ruby$latest_ruby_version..."
  $rbenv install $latest_ruby_version
  $rbenv global $latest_ruby_version

  `$rbenv prefix`/bin/gem install pry awesome_print rubocop refe2
fi
