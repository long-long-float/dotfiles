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

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" plugins
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'airblade/vim-gitgutter'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"
" editor settings
"
set nowritebackup
set nobackup

set number
set showmatch matchtime=1

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

au BufNewFile,BufRead *.md setf markdown
au BufWritePre * :%s/\s\+$//e

"nnoremap j gj
"nnoremap k gk
"nnoremap <Down> gj
"nnoremap <Up> gk

"
" Theme
"
syntax enable
colorscheme monokai

"
" Powerline
"
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
