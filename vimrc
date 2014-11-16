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
Plugin 'gmarik/Vundle.vim'                    " The plugin manager.. dah..

Plugin 'bling/vim-airline'                    " Way nicer status bar
Plugin 'tpope/vim-fugitive'                   " Essential git integration
Plugin 'airblade/vim-gitgutter'               " Show git changes in gutter
Plugin 'majutsushi/tagbar'                    " Navigate the code structure
Plugin 'Raimondi/delimitMate'                 " Automaticly add matching parenthesis etc.
Plugin 'Valloric/YouCompleteMe'               " Awesome autocomplete
Plugin 'rking/ag.vim'                         " Silver searcher
Plugin 'rodjek/vim-puppet'                    " Puppet syntax
Plugin 'tpope/vim-surround'                   " Quickly surrund stuff
Plugin 'nathanaelkane/vim-indent-guides'      " Shows how much I have indented
Plugin 'flazz/vim-colorschemes'               " Bunch of nice colors
Plugin 'hynek/vim-python-pep8-indent'         " Makes python indent behave like it should
Plugin 'jmcantrell/vim-virtualenv'            " Virtualenv integration!
Plugin 'scrooloose/syntastic'                 " Syntax errors
Plugin 'kien/ctrlp.vim'                       " Quickly open files
Plugin 'scrooloose/nerdtree'                  " Browse files with a file tree
Plugin 'digitaltoad/vim-jade'                 " Jade syntax
Plugin 'jelera/vim-javascript-syntax'         " Better javascript syntax and indentation
Plugin 'marijnh/tern_for_vim'                 " Amazing javascript autocomplete - adds to YCM
Plugin 'christoomey/vim-tmux-navigator'       " Easy navigation between vim and tmux splits
Plugin 'rizzatti/dash.vim'                    " Dash<3 integration

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
set ignorecase
set smartcase
set nosmartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set showcmd
set hidden
set cursorline
set lazyredraw
set ttyfast
set foldcolumn=0
set ttimeoutlen=0

set foldmethod=syntax

" make vim ignore som stuff
set wildignore+=*.pyc,*.git
set encoding=utf8

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Reselect block after indent
vnoremap < <gv
vnoremap > >gv

" auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Highlight the current word under the cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" setup cursor. block in normal mode and line in insert mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" gutter splits and folds in a darker color
highlight SignColumn ctermbg=234
highlight VertSplit ctermfg=234 ctermbg=234
highlight Folded ctermbg=234 ctermfg=249

" Default Colors for CursorLine
highlight  CursorLine ctermbg=234 ctermfg=None
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" Python uses indent folding
autocmd FileType python setlocal foldmethod=indent

" =======================
" Plugin settings
" =======================

" ctrl-p
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|bower_components|node_modules|dist|build)$'

" tagbar
let g:tagbar_left = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 0

" NERDTree
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

" YCM
let g:ycm_goto_buffer_command = 'new-tab'
let g:ycm_autoclose_preview_window_after_insertion = 1

" Airline
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

" ======================
" Key mappings
" ======================

let mapleader = ' '

noremap <Leader>s :wa<CR>
nnoremap <silent> <F10> :NERDTreeToggle<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>

" Easier way to switch tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" Breakpoints
autocmd FileType python map <F5> Oimport pdb; pdb.set_trace()<ESC>
autocmd FileType javascript map <F5> Odebugger;<ESC>

" unmap arrow keys from moving the cursor
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
