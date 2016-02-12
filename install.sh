#!/bin/bash

DOT_FILES=(
  # ruby
  .aprc .pryrc .gemrc
  # vim
  .vimrc .gvimrc .vim/conf/theme.vim
  .vimperatorrc
  .tmux.conf
  .gitconfig
  .dir_colors
  .rainbarf.conf
  #fish
  .config/fish/config.fish .config/fish/functions/fish_prompt.fish
  .config/fish/functions/my_pwd.fish
  )

[ ! -d ~/.config/fish/functions ] && mkdir -p $HOME/.config/fish/functions
[ ! -d ~/.vim/conf ] && mkdir -p $HOME/.vim/conf

for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ]; then
    echo "skip to make link because $file exists"
  else
    ln -s `pwd`/$file $HOME/$file
    echo "linked $file"
  fi
done

