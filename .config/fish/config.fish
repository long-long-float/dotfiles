# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
#set fish_theme agnoster

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

set fish_plugins git rails

#function fish_prompt
#  ~/powerline-shell/powerline-shell.py $status --shell bare ^/dev/null
#end

# 自分でビルドしたやつ
set PATH $HOME/local/bin $PATH

set os (uname)
if [ $os = "Linux" ]
  # For linuxbrew
  set PATH     $HOME/.linuxbrew/bin        $PATH
  set MANPATH  $HOME/.linuxbrew/share/man  $MANPATH
  set INFOPATH $HOME/.linuxbrew/share/info $INFOPATH
  set -x LD_LIBRARY_PATH $HOME/.linuxbrew/lib $LD_LIBRARY_PATH

  # key repeat configure
  if [ "$DISPLAY"  ]
    xset r rate 400 60
  end
else if [ $os = "Darwin" ]
  # for homebrew
  set PATH /usr/local/bin $PATH

  set PATH (brew --prefix coreutils)/libexec/gnubin $PATH
  set MANPATH (brew --prefix coreutils)/libexec/gnuman $MANPATH
end

set PATH $HOME/bin $PATH
set PATH $HOME/dex2jar $PATH
set PATH $HOME/.local/bin $PATH

# For rbenv
if [ -e $HOME/.rbenv ]
  set PATH $HOME/.rbenv/bin $HOME/.rbenv/shims $PATH
  set PATH $HOME/.rbenv/plugins/ruby-build/bin $PATH
  rbenv rehash >/dev/null ^&1
end

# For nodebrew
if [ -e $HOME/.nodebrew ]
  set NODE_PATH $HOME/.nodebrew/node/v0.11.12/lib
  set PATH $HOME/.nodebrew/current/bin $NODE_PATH $PATH
end

# For perlbrew
if [ -e $HOME/perl5/perlbrew ]
  set PATH $HOME/perl5/perlbrew/bin $PATH
end

# For PebbleSDK
set PATH $HOME/pebble-dev/PebbleSDK-2.0.2/bin $PATH

if type -P dircolors >/dev/null
  eval (dircolors -c ~/.dir_colors | sed 's/>&\/dev\/null$//')
end

# aliases
alias be="bundle exec"
alias ccat="pygmentize -g"
alias git="hub"
alias ccp="xclip -i -selection clipboard"
alias g++11="g++ -std=c++11"
alias tmux="tmux -2" # run as 256 mode
alias memcheck="valgrind --tool=memcheck --leak-check=yes"
