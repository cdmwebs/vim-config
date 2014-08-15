set nocompatible               " be iMproved
filetype off                   " required!

set shell=/bin/bash

" Vundle
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-fugitive'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'matchit.zip'
Bundle 'epmatsw/ag.vim'
Bundle 'jgdavey/vim-railscasts'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'othree/html5.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'Keithbsmiley/rspec.vim'
Bundle 'elzr/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'slim-template/vim-slim'

filetype plugin indent on
syntax on

set shortmess=I

set t_Co=256
set background=dark
colorscheme railscasts

set nu

let mapleader=","
set timeoutlen=250
set history=256

set nowrap

" edit .vimrc
nmap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

" Buffers
set autoread
set hidden

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch
map <Space> :set hlsearch!<cr>

" Completion
set showmatch
set wildmenu

" Splits
set splitbelow
set splitright

" Indentation and Tab handling
set smarttab
set expandtab
set autoindent
set shiftwidth=2
set tabstop=2
set autoindent smartindent

" Backspace
set backspace=indent,eol,start

" Tab bar
set showtabline=2

" Status Line
set encoding=utf-8
set laststatus=2

function! ShowWrap()
  if &wrap
    return "[wrap]"
  else
    return ""
endfunction

function! ShowSpell()
  if &spell
    return "[spell]"
  else
    return ""
endfunction

" colors
highlight CursorLine cterm=NONE ctermbg=0
highlight StatusLine term=reverse ctermfg=65 ctermbg=255 guifg=#FFFFFF guibg=#005f5f
highlight StatusLineNC cterm=NONE ctermfg=250 ctermbg=239
highlight TabLineFill ctermfg=239
highlight LineNr ctermfg=65
set cursorline!

" whitespace
set nolist listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:«
nmap <silent> <leader>s :set nolist!<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" command-t settings
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowReverse=1
let g:CommandTAcceptSelectionSplitMap=['<C-s>', '<C-CR>']
let g:CommandTCancelMap=['<C-c>', '<Esc>']
noremap <leader>f :CommandTFlush<CR>

" ctrlp settings
let g:ctrlp_custom_ignore = '\.git$\|'
let g:ctrlp_custom_ignore .= '\vendor/ruby$\|'
let g:ctrlp_custom_ignore .= '\.tmp$\|'
let g:ctrlp_custom_ignore .= '\.DS_Store$'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

if has("autocmd")
  " jQuery settings
  au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

  " ruby. why.
  au BufNewFile,BufRead Vagrantfile,Podfile set filetype=ruby

  au BufNewFile,BufRead *.ejs set filetype=eruby

  au BufNewFile,BufRead *.md set filetype=markdown tw=72
  au BufNewFile,BufRead *.hb set filetype=mustache
endif

" Source a local configuration file if available.
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

set mouse=a

let g:netrw_liststyle=3
let g:netrw_preview=1

" can haz spell
iab inpsection inspection
iab Inpsection Inspection

let g:dash_map = {
  \ 'ruby'       : 'rails',
  \ 'javascript' : 'ember'
  \ }
