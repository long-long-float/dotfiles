#!/bin/bash

DOT_FILES=(
  # ruby
  .aprc .pryrc .gemrc
  # vim
  .vimrc .gvimrc .vim/conf/theme.vim
  .tmux.conf
  .gitconfig
  .dir_colors
  #fish
  .config/fish/config.fish .config/fish/functions/fish_prompt.fish
  )

mkdir -p $HOME/.config/fish/functions

for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ]; then
    echo "existing $file. override?[y/n] : "
    read yn
    if [ "$yn" = "y" ]; then
      ln -sf `pwd`/$file $HOME/$file
      echo "linked $file"
    fi
  else
    ln -s `pwd`/$file $HOME/$file
    echo "linked $file"
  fi
done

# install oh-my-fish
[ ! -d ~/.oh-my-fish ] && curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

# install neobundle
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins -> vim -c ':NeoBundleInstall'"
