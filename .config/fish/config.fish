set os (uname)
if [ $os = "Linux" ]
  # For linuxbrew
  set PATH     $HOME/.linuxbrew/bin        $PATH
  set MANPATH  $HOME/.linuxbrew/share/man:
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

# self built apps
[ -e $HOME/local/bin ] ; and set PATH $HOME/local/bin $PATH

# For python bin
[ -e $HOME/.local/bin ] ; and set PATH $HOME/.local/bin $PATH

# For rbenv
if [ -e $HOME/.rbenv ]
  set PATH $HOME/.rbenv/bin $HOME/.rbenv/shims $PATH
  set PATH $HOME/.rbenv/plugins/ruby-build/bin $PATH
  . (rbenv init - | psub)
end

# For crenv
if [ -e $HOME/.crenv ]
  set PATH $HOME/.crenv/bin $PATH
  . (crenv init - | psub)
end

# For nodebrew
if [ -e $HOME/.nodebrew ]
  set NODE_PATH $HOME/.nodebrew/current/lib
  set PATH $HOME/.nodebrew/current/bin $NODE_PATH $PATH
end

# For perlbrew
[ -e $HOME/perl5/perlbrew ] ; and set PATH $HOME/perl5/perlbrew/bin $PATH

# For go-lang
set -x GOROOT $HOME/.local/share/umake/go/go-lang
set -x GOPATH $HOME/.go

if type -P dircolors >/dev/null
  eval (dircolors -c ~/.dir_colors | sed 's/>&\/dev\/null$//')
end

# aliases
alias be="bundle exec"
alias ccat="pygmentize -g"
alias ccp="xclip -i -selection clipboard"
alias g++11="g++ -std=c++11"
alias tmux="tmux -2" # run as 256 mode
alias memcheck="valgrind --tool=memcheck --leak-check=yes"
alias dc="cd"

# functions

function nofi
  if [ $status -eq 0 ]
    notify-send "successfully finished"
  else
    notify-send "failed!"
  end
end

