#!/bin/bash

DOT_FILES=(
  .vimrc
  .tmux.conf
  .gitconfig
  .dir_colors
  .ctags
  .gitignore_global
  .zshrc
  )

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

