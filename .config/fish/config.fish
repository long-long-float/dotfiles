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

set PATH $HOME/bin $PATH
set PATH $HOME/dex2jar $PATH
set PATH $HOME/.local/bin $PATH

# For rbenv
set PATH $HOME/.rbenv/bin $HOME/.rbenv/shims $PATH
set PATH $HOME/.rbenv/plugins/ruby-build/bin $PATH
rbenv rehash >/dev/null ^&1

# For nodebrew
set NODE_PATH $HOME/.nodebrew/node/v0.11.12/lib
set PATH $HOME/.nodebrew/current/bin $NODE_PATH $PATH

# For PebbleSDK
set PATH $HOME/pebble-dev/PebbleSDK-2.0.2/bin $PATH

# aliases
alias be="bundle exec"
alias ccat="pygmentize -g"

# key repeat configure
if [ $DISPLAY  ]
  xset r rate 230 60
end
