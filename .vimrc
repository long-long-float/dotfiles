" for fish shell
if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

"
" NeoBundle
"
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" plugins
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
NeoBundle 'sudar/vim-arduino-syntax'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'vim-scripts/st.vim'
NeoBundle 'sudo.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Align'
NeoBundle 'vim-rails'
NeoBundle 'stevemadere/ruby-matchit'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"
" Powerline
"
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2

"
" editor settings
"
set nowritebackup
set nobackup
set swapfile
set directory=/tmp

set number
set showmatch matchtime=1

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set nowrap

set hlsearch
set incsearch

let OSTYPE = system('uname')
if OSTYPE == "Darwin\n"
  noremap ; :
endif

au BufNewFile,BufRead,BufReadPre *.coffee setf coffee
au BufNewFile,BufRead            *.md     setf markdown
au BufNewFile,BufRead            *.sjs    setf javascript
au BufNewFile,BufRead            *.som    setf st

" remove tail spece before saving
au BufWritePre * :%s/\s\+$//e

au FileType c      setl ts=8 sw=4 noexpandtab
au FileType ruby   setl tw=0 sw=2 tabstop=8 nowrap expandtab
au FileType objc   setl ts=4 sw=4 expandtab
au FileType coffee setl ts=2 sw=2 sts=2  expandtab

" auto completion for html tag
au FileType html,eruby inoremap <silent> <buffer> </ </<C-p>>
au FileType eruby      inoremap <silent> <% <%<space><space>%><left><left><left>

" makrdown
let g:vim_markdown_folding_disabled=1

"
" Theme
"
syntax enable
colorscheme hybrid
