set nocompatible

call plug#begin('~/.nvim/plugged')

Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
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
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|bower_components|node_modules|dist|build|other_components)$'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_open_multiple_files = '1ri'  " When opening multiple files, open them in hidden buffers
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 0

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
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_theme='solarized'

" =======================
" Colors and highlighting
" =======================

filetype plugin indent on
let g:solarized_contrast = 'high'
set background=dark
colorscheme solarized
syntax on

" gutter splits and folds in a darker color
highlight SignColumn ctermbg=black
highlight VertSplit ctermfg=black ctermbg=black
highlight Folded ctermbg=black ctermfg=black
highlight DiffAdd ctermbg=black
highlight DiffChange ctermbg=black
highlight DiffDelete ctermbg=black
highlight GitGutterChangeLineDefault ctermbg=black

" Only show cursorline and cursorcolumn in the active buffer
autocmd WinEnter * setlocal cursorline
autocmd WinEnter * setlocal cursorcolumn
autocmd WinLeave * setlocal nocursorline
autocmd WinLeave * setlocal nocursorcolumn

" Indent guides
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black

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
set nowrap
set showcmd
set hidden
set cursorline
set cursorcolumn
set lazyredraw
set ttyfast
set ttimeoutlen=0
set foldmethod=manual
set scrolloff=5

" make vim ignore som stuff
set wildignore+=*.pyc,*.git,tags
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

autocmd FileType javascript setlocal foldmethod=indent
autocmd FileType python setlocal makeprg=echo\ %\ "expand(substitute(%,\ p,\ .,\ g))"
autocmd FileType jade setlocal foldmethod=indent
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
nnoremap <silent> <F9> :Gstatus<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>

" Breakpoints
autocmd FileType python map <F5> Oimport pdb; pdb.set_trace()<ESC>
autocmd FileType javascript map <F5> Odebugger;<ESC>

" Splits
nmap <C-Right> <C-w>>
nmap <C-Left>  <C-w><
nmap <C-Up> <C-w>+
nmap <C-Down> <C-w>-

" Buffers
no <leader>q :bd<cr>
no <left> :bp<cr>
no <right> :bn<cr>
no <leader>f :ls<cr>:b

" Tags
no <leader>t :CtrlPTag<cr>
command! BuildTags :!ctags -R .

" unmap arrow keys from moving the cursor
no <up> <Nop>
no <down> <Nop>
