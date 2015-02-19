" =======================
    " Plugins
    call plug#begin('~/.nvim/plugged')

    Plug 'bling/vim-airline'
    Plug 'edkolev/tmuxline.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'd11wtq/ctrlp_bdelete.vim'
    Plug 'scrooloose/nerdtree'
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
    Plug 'SirVer/ultisnips'
    Plug 'majutsushi/tagbar'

    call plug#end()

" =======================
    " Plugin settings

    " ctrl-p
    call ctrlp_bdelete#init()
    let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|bower_components|node_modules|dist|build|other_components)$'
    let g:ctrlp_follow_symlinks = 1
    let g:ctrlp_open_multiple_files = '2vjr'
    let g:ctrlp_open_new_file = 'r'
    let g:ctrlp_follow_symlinks = 1
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_lazy_update = 150
    let g:ctrlp_switch_buffer = 0

    " Tagbar
    let g:tagbar_autoclose = 1
    let g:tagbar_autofocus = 1
    let g:tagbar_compact = 1
    let g:tagbar_foldlevel = 0
    let g:tagbar_iconchars = ['+', '-']

    " Ultisnips
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    " NERDTree
    let g:NERDTreeQuitOnOpen=1
    let g:NERDTreeHighlightCursorline=1
    let g:NERDTreeDirArrows=0
    let g:NERDTreeIgnore = ['\.pyc$', '.git', 'node_modules', 'bower_components', 'dist', 'build', 'tags', 'other_components']
    let g:NERDTreeHijackNetrw = 1
    let g:NERDTreeShowLineNumbers = 1

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

    filetype plugin indent on
    set background=dark

    colorscheme solarized
    syntax on

    " gutter splits and folds in a darker color
    highlight SignColumn ctermbg=black
    highlight VertSplit ctermfg=11 ctermbg=11
    highlight Folded cterm=NONE ctermbg=8 ctermfg=11

    highlight GitGutterAdd ctermbg=black ctermfg=2
    highlight GitGutterChange ctermbg=black ctermfg=3
    highlight GitGutterDelete ctermbg=black ctermfg=1
    highlight GitGutterChangeDelete ctermbg=black ctermfg=3

    " Indent guides
    highlight IndentGuidesOdd  ctermbg=black
    highlight IndentGuidesEven ctermbg=black

" =======================
    " Settings

    set nocompatible
    set backspace=indent,eol,start
    set nobackup
    set noswapfile
    set autoread
    set nonumber
    set incsearch
    set ignorecase
    set smartcase
    set nosmartindent
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set wrap
    set linebreak
    set breakindent
    set showbreak=\ \ …
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
    set relativenumber
    set listchars=tab:▸\ ,eol:¬
    set wildignore+=*.pyc,*.git,tags
    set splitright
    set grepprg=ag\ --nogroup\ --nocolor
    set wildmenu


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

    let mapleader = ' '

    " Search for word under cursor
    noremap K :Ag!\ <C-r><C-w><CR>

    noremap <leader>g :YcmCompleter GoTo<CR>

    " Copy and past using system clipboard
    vnoremap <leader>y "*y
    noremap <leader>p "*p

    " make Y behave like C and D
    noremap Y y$

    noremap <Leader>s :wa<CR>

    " Tagbar
    noremap <f9> :TagbarToggle<CR>

    " Splits
    noremap <C-Right> :vertical resize +10<CR>:AirlineRefresh<CR>
    noremap <C-Left> :vertical resize -10<CR>:AirlineRefresh<CR>
    noremap <C-Up> :resize +5<CR>
    noremap <C-Down> :resize -5<CR>

    " Buffers
    noremap <tab> :CtrlPBuffer<CR>

    " Tags
    noremap <leader>tt :CtrlPTag<CR>
    noremap <leader>t :CtrlPBufTag<CR>
    command! BuildTags :!ctags -R .

    " Reload vimrc
    command! ReloadNvimrc :source $MYVIMRC

    nmap <up> <nop>
    nmap <down> <nop>
    nmap <left> <nop>
    nmap <right> <nop>

" ======================
    " Autocommands

    augroup misc
        autocmd!

        " update diff when moving the cursor
        autocmd CursorMoved,CursorMovedI * if &diff == 1 | diffupdate | endif

        " auto remove trailing whitespace
        autocmd BufWritePre * :%s/\s\+$//e

        " Delete fugetive buffers when hidden
        autocmd BufReadPost fugitive://* set bufhidden=delete

        " Highlight the current word under the cursor
        autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    augroup END

    augroup filetypes
        autocmd!

        autocmd BufRead,BufNewFile *.md set filetype=markdown
    augroup END

    augroup active_window
        autocmd!

        " Only show cursorline and cursorcolumn in the active buffer
        autocmd WinEnter * setlocal cursorline
        autocmd WinEnter * setlocal cursorcolumn
        autocmd WinLeave * setlocal nocursorline
        autocmd WinLeave * setlocal nocursorcolumn

        " Only show cursorline and column in active window
        autocmd WinEnter * set wrap
        autocmd WinLeave * set nowrap

        " Resize window when entered
        autocmd WinEnter * call s:AutoResizeWindow()

        " Set width of tagbar here because it apparently has
        " filetype=python before it gets filetype=tagbar...
        " that makes AutoResizeWindow to resize the tagbar
        autocmd FileType tagbar vertical resize 40
    augroup END

    augroup commands
        autocmd!

        autocmd FileType python command! -range ToDict :<line1>,<line2>s/\(\w\+\)/'\1': \1,/g
        " autocmd FileType python command! -range RemoveMultipleSpacesBeforeEqualSign :<line1>,<line2>s/\( \+\)=/ =/
    augroup END

    augroup breakpoints
        autocmd!

        autocmd FileType python map <F5> Oimport pdb; pdb.set_trace()<ESC>
        autocmd FileType javascript map <F5> Odebugger;<ESC>
    augroup END

" ======================
    " Functions

    function! s:AutoResizeWindow()
        if (&ft =~ 'python')
            if (winwidth(0) < 126)
                execute 'vertical resize 126'
            endif
        endif
    endfunction
