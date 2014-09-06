#! /bin/bash

# install required packages
sudo yum -y instal epel-release
sudo yum -y git vim

# install fish shell
sudo curl http://fishshell.com/files/linux/RedHat_RHEL-5/fish.release:2.repo > /etc/yum.repos.d/shells:fish:release:2.repo
sudo yum -y install fish

chsh -s /usr/bin/fish

echo "installed fish shell"

# install rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo "installed rbenv"
