" for fish shell
if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

"dein Scripts-----------------------------

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " editing
  call dein#add('cohama/lexima.vim')
  call dein#add('tpope/vim-endwise')
  call dein#add('vim-scripts/Align')
  call dein#add('stevemadere/ruby-matchit')
  call dein#add('tpope/vim-surround')
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')
  call dein#add('tyru/caw.vim')
  call dein#add('Shougo/vinarise')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('rhysd/vim-clang-format')
  call dein#add('itchyny/vim-cursorword')

  " Unite
  call dein#add('Shougo/unite.vim')
  call dein#add('tsukkee/unite-tag')

  " display
  call dein#add('vim-airline/vim-airline')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('Yggdroot/indentLine')

  " themes
  call dein#add('w0ng/vim-hybrid')
  call dein#add('sickill/vim-monokai')
  call dein#add('tomasr/molokai')
  call dein#add('altercation/vim-colors-solarized')

  " languages
  call dein#add('derekwyatt/vim-scala')
  call dein#add('elzr/vim-json')
  call dein#add('othree/html5.vim')
  call dein#add('godlygeek/tabular') " tabular must come before vim-markdown
  call dein#add('ekalinin/Dockerfile.vim')
  call dein#add('dag/vim-fish')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('clausreinke/typescript-tools.vim')
  call dein#add('fatih/vim-go')
  call dein#add('othree/yajs.vim')
  call dein#add('rust-lang/rust.vim')
  call dein#add('moro/vim-review')
  call dein#add('rhysd/vim-rustpeg')
  call dein#add('petRUShka/vim-opencl')

  " external
  call dein#add('tpope/vim-fugitive')
  call dein#add('thinca/vim-quickrun')
  call dein#add('Shougo/vimproc', {'build': 'make'})

  " call dein#add('szw/vim-tags')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"
" vim-json
"
let g:vim_json_syntax_conceal = 0

let g:quickrun_config = {
  \ "_": {
  \   "runner": "vimproc",
  \   "runner/vimproc/updatetime": 60,
  \   "outputter/buffer/into": 1
  \ },
  \}

" previm
let g:previm_show_header = 0

"
" editor settings
"
syntax on

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
set ignorecase
set smartcase

set mouse=a

set backspace=start,eol,indent

let loaded_matchparen = 1

set wildmenu
set wildmode=longest,full

noremap ; :

autocmd ColorScheme * hi Search ctermbg=159

let g:tex_conceal=''

" key maps
nmap <Space> [unite]
nnoremap [unite]t :<C-u>Unite tab<CR>
nnoremap [unite]f :<C-u>Unite buffer file_mru<CR>

nnoremap <C-n> gt
nnoremap <C-p> gT

nmap <C-k> <Plug>(caw:hatpos:toggle)
vmap <C-k> <Plug>(caw:hatpos:toggle)

nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

au BufNewFile,BufRead *.coffee setf coffee
au BufNewFile,BufRead *.md     setf markdown
au BufNewFile,BufRead *.md,*.re,*.tex set wrap
au BufNewFile,BufRead *.sjs,*pegjs setf javascript
au BufNewFile,BufRead *.som    setf st
au BufNewFile,BufRead *.vue    setf javascript
au BufNewFile,BufRead *.nas    setf nasm
au BufNewFile,BufRead *.re     setf review
au BufNewFile,BufRead jenkinsfile     setf groovy

au BufNewFile *.html 0r $HOME/.vim/templates/.html

" remove tail spece before saving
au BufWritePre * :%s/\s\+$//e

au FileType c      setl ts=8 sw=4 noexpandtab
au FileType ruby   setl tw=0 sw=2 tabstop=8 nowrap expandtab
au FileType objc   setl ts=4 sw=4 expandtab
au FileType coffee setl ts=2 sw=2 sts=2  expandtab
au FileType markdown setl ts=4 sw=4 expandtab
au FileType python   setl tw=0 sw=4 tabstop=8 expandtab

au FileType eruby      inoremap <silent> <% <%<space><space>%><left><left><left>

" move cursor as is
" nnoremap j gj
" nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

" netrw
let g:netrw_liststyle = 3
nnoremap t :<C-u> Texplore<CR>

" load splited vimrc
set rtp+=$HOME/.vim
runtime! conf/*.vim
