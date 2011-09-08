" This must be first, because it changes other options as a side effect.
set nocompatible          " We're running Vim, not Vi!

source ~/.vim/bundle/pathogen/autoload/pathogen.vim

" http://github.com/tpope/vim-pathogen
call pathogen#helptags()
call pathogen#infect()

" map leader to comma
let mapleader = ","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Toggle NERDTree
nmap <silent> <Leader>n :NERDTreeToggle<CR>

" A better escape?
imap jj <Esc>

" keep more history
set history=100

" show hidden buffers
set hidden

" don't beep
set visualbell
set noerrorbells

" Syntax highlighting
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  " sync syntax from the start of the file
  syntax sync fromstart
  set hlsearch
endif

if (&t_Co == 256)
  set bg=dark
  colorscheme Tomorrow-Night
  highlight CursorLine cterm=NONE ctermbg=236
  highlight StatusLine term=reverse ctermfg=15 ctermbg=23 guifg=#FFFFFF guibg=#005f5f
  highlight StatusLineNC cterm=NONE ctermbg=236
  set cursorline!
else
  colorscheme desert
endif

" Indentation and Tab handling
set smarttab
set expandtab
set autoindent
set shiftwidth=2
set tabstop=2
set autoindent smartindent

" Line Wrapping
set nowrap
set linebreak             " Wrap at word

" Search results
set incsearch             " incremental searching
set ignorecase            " case insensitive searching
set smartcase

" Toggle search results with spacebar
map <Space> :set hlsearch!<cr>

" Don't use Ex mode, use Q for formatting
map Q gq

" catch trailing whitespace
set list listchars=tab:\ \ ,trail:·
nmap <silent> <leader>s :set nolist!<CR>

" Swapfiles. Fuck 'em.
set nobackup
set noswapfile
set nowritebackup

" show incomplete commands
set showcmd

" Split windows behavior
set splitbelow
set splitright

" chill the press ENTER or type command to continue stuff
set shortmess=atI

set ruler
set undolevels=1000
set number

set showmatch
set wildmenu
set wildignore+=*.o,*.obj,.git,vendor/ruby/**,vendor/jruby/**,compiled

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    autocmd!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" |
      \ endif
  augroup END

  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
    autocmd FileType javascript set ai sw=4 sts=4 et
  augroup END
else
  set autoindent    " always set autoindenting on
endif " has("autocmd")

if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevel=3
  " set foldnestmax=2
  " set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
  set foldcolumn=0

  " automatically open folds at the starting cursor position
  " autocmd BufReadPost .foldo!
endif

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

" These are ruby files
au BufNewFile,BufRead *.prawn,Sitefile set filetype=ruby

" Clean up whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" syntastic
let g:syntastic_enable_signs=1

" taglist
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50
map <leader>a :TlistToggle<cr>
map <leader>A :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" completion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" command-t settings
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowReverse=1
noremap <leader>f :CommandTFlush<CR>

" undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" always load buffers from disk
set autoread

" Status Line
set laststatus=2
set statusline=%m                            " Modified Flag
set statusline+=%r                           " Readonly Flag
set statusline+=\                            " Space
set statusline+=%<                           " Truncate on the left side of text if too long
set statusline+=%t                           " File name (Tail)
set statusline+=%#warningmsg#                " Set warning highlighting
set statusline+=%{SyntasticStatuslineFlag()} " Show syntax errors provided by syntastic plugin
set statusline+=%*                           " clear highlighting
set statusline+=%=                           " Right Align
set statusline+=%{ShowSpell()}               " Show whether or not spell is currently on
set statusline+=\                            " Space
set statusline+=%{ShowWrap()}                " Show whether or not wrap is currently on
set statusline+=\                            " Space
set statusline+=%{fugitive#statusline()}     " Git branch name courtesy of Fugitive plugin
set statusline+=%w                           " Preview window flag
set statusline+=\                            " Space
set statusline+=%h                           " Help buffer flag
set statusline+=\                            " Space
set statusline+=%y                           " Type of file
set statusline+=\                            " Space
set statusline+=(%l/%L,\ %c)                 " Current position and line count
set statusline+=\                            " Space
set statusline+=%P                           " Percent
set statusline+=\                            " Space for padding on right side

function! ShowWrap()
  if &wrap
    return "[Wrap]"
  else
    return ""
endfunction

function! ShowSpell()
  if &spell
    return "[Spell]"
  else
    return ""
endfunction
