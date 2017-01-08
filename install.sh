#!/bin/bash

DOT_FILES=(
  # ruby
  .aprc .pryrc .gemrc
  # vim
  .vimrc .gvimrc
  .vim/templates
  .vimperatorrc
  .tmux.conf .tmux-powerlinerc
  .gitconfig
  .dir_colors
  .rainbarf.conf
  .ctags
  #fish
  .config/fish/config.fish .config/fish/functions/fish_prompt.fish
  .config/fish/functions/my_pwd.fish
  )

[ ! -d ~/.config/fish/functions ] && mkdir -p $HOME/.config/fish/functions
[ ! -d ~/.vim/conf ] && mkdir -p $HOME/.vim/conf

cp .vim/conf/theme.vim.sample $HOME/.vim/conf/theme.vim

for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ]; then
    echo "skip to make link because $file exists"
  else
    ln -s `pwd`/$file $HOME/$file
    echo "linked $file"
  fi
done

if [ ! -e $HOME/.rsense ]; then
  ruby ~/.vim/dein/repos/github.com/marcus/rsense/etc/config.rb  > ~/.rsense
fi
