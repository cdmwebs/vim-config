" Window size
set winwidth=85
let g:halfsize=86
let g:fullsize=171
set lines=70
let &columns=g:halfsize

" Font
set guifont=Menlo:h14.00

" Use console dialogs
set guioptions+=c

" hide scrollbars
set guioptions-=L
set guioptions-=r

" turns the toolbar off
set go-=T

" tab labels
set guitablabel=%t

" add a cursorline
set cursorline

" maximize
set lines=80
set columns=250

" w00t
set bg=light
if &background == "dark"
    set transparency=1
endif
colorscheme solarized

