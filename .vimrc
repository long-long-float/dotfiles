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
NeoBundle 'tomasr/molokai'
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
NeoBundle 'tpope/vim-rails'
NeoBundle 'stevemadere/ruby-matchit'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }
NeoBundle 'tpope/vim-surround'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'szw/vim-tags'
NeoBundle 'elzr/vim-json'
NeoBundle 'othree/html5.vim'
NeoBundle 'sophacles/vim-processing'

let g:indentLine_color_term = 244

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
" Rsense
"
" let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

"
" neocomplete.vim
"
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

"
" vim-json
"
let g:vim_json_syntax_conceal = 0

"
" editor settings
"
set nowritebackup
set nobackup
set swapfile
set directory=/tmp

set number
set showmatch matchtime=1

set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set nowrap

set hlsearch
set incsearch

set mouse=a

set backspace=start,eol,indent

let loaded_matchparen = 1

let OSTYPE = system('uname')
if OSTYPE == "Darwin\n"
  noremap ; :
endif

" key maps
" http://qiita.com/ykyk1218/items/8f5471c5e90cc83fd407
noremap pp "0p

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
au FileType eruby      inoremap <silent> <% <%<space><space>%><left><left><left>

au FileType cpp inoremap <silent> <buffer> {<return> {}<left><cr><esc><S-o>

" makrdown
let g:vim_markdown_folding_disabled=1

let g:quickrun_config = {
  \ "_": {
  \   "runner": "vimproc",
  \   "runner/vimproc/updatetime": 60
  \ },
  \}

" load splited vimrc
set rtp+=$HOME/.vim
runtime! conf/*.vim
