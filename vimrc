filetype plugin indent on
set background=dark
syntax on

let mapleader = ' '

" make Y behave like C and D
noremap Y y$

nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

set backspace=indent,eol,start
set nobackup
set noswapfile
set autoread
set nosmartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set ttyfast
set lazyredraw
set ttimeoutlen=0
set fileformat=unix
set encoding=utf8

let g:sql_type_default = 'mysql'

augroup filetypes
    autocmd!

    autocmd FileType mail set textwidth=79
    autocmd FileType mail execute "silent! normal! }"
augroup END
