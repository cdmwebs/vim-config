filetype off                   " required!

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'kien/ctrlp.vim'
Plugin 'jgdavey/vim-railscasts'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'janx/vim-rubytest'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'romainl/Apprentice'
Plugin 'lambdatoast/elm.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'hwartig/vim-seeing-is-believing'
call vundle#end()

filetype plugin indent on
syntax on

set background=dark
colorscheme railscasts

set nu
set mouse=a
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
" set showtabline=2

" Status Line
set encoding=utf-8
set laststatus=2

" colors
" highlight CursorLine cterm=NONE ctermbg=0
" highlight StatusLine term=reverse ctermfg=65 ctermbg=255 guifg=#FFFFFF guibg=#005f5f
" highlight StatusLineNC cterm=NONE ctermfg=250 ctermbg=239
" highlight TabLineFill ctermfg=239
" highlight LineNr ctermfg=65
set cursorline!

" whitespace
set nolist listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:«
nmap <silent> <leader>sl :set nolist!<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

set wildignore+=*/vendor/ruby
set wildignore+=*/vendor/cache

if has("autocmd")
  au BufNewFile,BufRead *.md set filetype=markdown tw=72
endif

" Source a local configuration file if available.
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

let g:netrw_liststyle=3
let g:netrw_preview=1

" can haz spell
iab inpsection inspection
iab Inpsection Inspection

let g:rubytest_cmd_test = "/opt/boxen/rbenv/shims/ruby -w -I'lib:test'  %p"
let g:rubytest_cmd_testcase = "/opt/boxen/rbenv/shims/ruby -w -I'lib:test' %p -n '/%c/'"

let g:ctrlp_user_command = 'find %s -type f'

" .vimrc Enable seeing-is-believing mappings only for Ruby
augroup seeingIsBelievingSettings
  autocmd!

  autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)

  autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

  autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
  autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)
augroup END

