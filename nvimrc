set nocompatible

call plug#begin('~/.nvim/plugged')

Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'kien/ctrlp.vim'
Plug 'd11wtq/ctrlp_bdelete.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'rizzatti/dash.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'jmcantrell/vim-virtualenv', { 'for': ['python'] }
Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript'] }
Plug 'marijnh/tern_for_vim', { 'for': ['javascript'], 'do': 'npm install' }
Plug 'digitaltoad/vim-jade', { 'for': ['jade'] }

call plug#end()

" =======================
" Plugin settings
" =======================

" ctrl-p
call ctrlp_bdelete#init()
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|bower_components|node_modules|dist|build|other_components)$'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_open_multiple_files = '2vjr'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_lazy_update = 250

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline=1
let g:NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.pyc$', 'node_modules', 'bower_components', 'dist', 'build', 'tags', 'other_components']

" indent_guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_theme='solarized'
let g:airline#extensions#default#section_truncate_width = { 'b': 80, 'x': 100, 'z': 120, 'y': 140}


" =======================
" Colors and highlighting
" =======================

filetype plugin indent on
set background=dark

colorscheme solarized
syntax on

" gutter splits and folds in a darker color
highlight SignColumn ctermbg=black
highlight VertSplit ctermfg=black ctermbg=11
highlight Folded ctermbg=black ctermfg=11

highlight GitGutterAdd ctermbg=black ctermfg=2
highlight GitGutterChange ctermbg=black ctermfg=3
highlight GitGutterDelete ctermbg=black ctermfg=1
highlight GitGutterChangeDelete ctermbg=black ctermfg=3

" Only show cursorline and cursorcolumn in the active buffer
autocmd WinEnter * setlocal cursorline
autocmd WinEnter * setlocal cursorcolumn
autocmd WinLeave * setlocal nocursorline
autocmd WinLeave * setlocal nocursorcolumn

autocmd WinEnter * set wrap
autocmd WinLeave * set nowrap

autocmd WinEnter * call s:AutoResizeWindow()
function! s:AutoResizeWindow()
    if (winwidth(0) < 126)
        execute 'wincmd ='
        execute 'vertical resize 126'
    endif
endfunction

" Indent guides
highlight IndentGuidesOdd  ctermbg=black
highlight IndentGuidesEven ctermbg=black

" =======================
" Settings
" =======================

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
set wrap
set breakindent
set showcmd
set hidden
set cursorline
set cursorcolumn
set lazyredraw
set ttyfast
set ttimeoutlen=0
set foldmethod=indent
set scrolloff=5
set fileformat=unix
set encoding=utf8
set colorcolumn=121

" make vim ignore som stuff
set wildignore+=*.pyc,*.git,tags

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Reselect block after indent
vnoremap < <gv
vnoremap > >gv

nmap K <Plug>DashSearch

" auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Highlight the current word under the cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

autocmd BufRead,BufNewFile *.md set filetype=markdown

" Setup xterm mappings even though the TERM is screen
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" ======================
" Key mappings
" ======================

let mapleader = ' '

vmap <leader>y "*y
nmap <leader>p "*p
noremap Y y$

noremap <Leader>s :wa<CR>
nnoremap <silent> <F10> :NERDTreeToggle<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>

" Breakpoints
autocmd FileType python map <F5> Oimport pdb; pdb.set_trace()<ESC>
autocmd FileType javascript map <F5> Odebugger;<ESC>

" Splits
nmap <C-Right> :vertical resize +20<CR>:AirlineRefresh<CR>
nmap <C-Left> :vertical resize -20<CR>:AirlineRefresh<CR>
nmap <C-Up> :resize +5<CR>
nmap <C-Down> :resize -5<CR>

" Buffers
nmap <tab> :CtrlPBuffer<CR>

" Tags
nmap <leader>t :CtrlPTag<cr>
command! BuildTags :!ctags -R .

" unmap arrow keys from moving the cursor
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>

autocmd FileType python command! -range ToDict :<line1>,<line2>s/\(\w\+\)/'\1': \1,/g
" autocmd FileType python command! -range RemoveMultipleSpacesBeforeEqualSign :<line1>,<line2>s/\( \+\)=/ =/

