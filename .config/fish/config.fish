set os (uname)
if [ $os = "Linux" ]
  set PATH $HOME/.local/share/umake/ide/visual-studio-code $PATH

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
  source (rbenv init - | psub)
end

# For nodebrew
if [ -e $HOME/.nodebrew ]
  set NODE_PATH $HOME/.nodebrew/current/lib
  set PATH $HOME/.nodebrew/current/bin $NODE_PATH $PATH
end

# For go-lang
# set -x GOROOT $HOME/.local/share/umake/go/go-lang
set -x GOPATH $HOME/.go

# For rustup
[ -e $HOME/.cargo ]; and set PATH $HOME/.cargo/bin $PATH

if type -P dircolors >/dev/null
  eval (dircolors -c ~/.dir_colors | sed 's/>&\/dev\/null$//')
end

# http://qiita.com/delphinus/items/b04752bb5b64e6cc4ea9
set -x LESS '-iMR'

# aliases
alias ccat="pygmentize -g"
alias ccp="xclip -i -selection clipboard"
alias tmux="tmux -2" # run as 256 mode
alias memcheck="valgrind --tool=memcheck --leak-check=yes"
alias dc="cd"
alias ls="ls -h --color=always"
alias pry="pry -r json -r yaml -r bigdecimal"
alias gdb="cgdb"
alias open="xdg-open"
alias diff="diff --color=always"

