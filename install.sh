#!/bin/sh

DOT_FILES=(
  .aprc .pryrc .vimrc .gitconfig
  #fish
  .config/fish/config.fish .config/fish/functions/fish_prompt.fish
  )

for file in ${DOT_FILES[@]}
do
  if [ -e $HOME/$file ]; then
    echo "existing $file"
  else
    ln -s $HOME/git/dotfiles/$file $HOME/$file
    echo "linked $file"
  fi
done

# install oh-my-fish
[ ! -d ~/.oh-my-fish ] && curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

# install neobundle
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins -> vim -c ':NeoBundleInstall'"
