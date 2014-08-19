" =========================
" Vundle
" =========================

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Keep Plugin commands between vundle#begin/end.

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'tonchis/vim-to-github'
Plugin 'JarrodCTaylor/vim-python-test-runner'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-haml'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'fatih/vim-go'

Bundle 'justinmk/vim-sneak'
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-surround'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'flazz/vim-colorschemes'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'jelera/vim-javascript-syntax'
"Bundle 'davidhalter/jedi-vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'digitaltoad/vim-jade'

" Some procrastination :)
Bundle 'AshyIsMe/2048'

call vundle#end()

" =======================
" Settings
" =======================

filetype plugin indent on
colorscheme twilight256
syntax on

set backspace=indent,eol,start
set nobackup
set noswapfile
set autoread
set number
set incsearch
set laststatus=2  " airline
set nosmartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set showcmd
set hidden
set cursorline

" make vim ignore som stuff
set wildignore+=*.pyc,*.git
set encoding=utf8

" auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e


" =======================
" Plugin settings
" =======================

" ctrl-p
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|bower_components|node_modules|dist)$'
inoremap <F11> <C-p>

" tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 0

" NERDTree
nnoremap <silent> <F10> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline=1
let g:NERDTreeDirArrows=0

" indent_guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#121212 ctermbg=233
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" sneak
let g:sneak#streak = 1

" YCM
nnoremap <leader>g :YcmCompleter GoTo<CR>

" ======================
" Key mappings
" ======================

let mapleader = ","

map ö [
map ä ]
noremap <Leader>s :wa<CR>

" unmap arrow keys from moving the cursor
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
