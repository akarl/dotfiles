" =======================
    " Plugged

    call plug#begin('~/.vim/plugged')

    Plug '5long/pytest-vim-compiler'
    Plug 'Raimondi/delimitMate'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
    Plug 'airblade/vim-gitgutter'
    Plug 'altercation/vim-colors-solarized'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'digitaltoad/vim-jade', { 'for': ['jade'] }
    Plug 'eiginn/netrw'
    Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }
    Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript'] }
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'marijnh/tern_for_vim', { 'for': ['javascript'], 'do': 'npm install' }
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'puppetlabs/puppet-syntax-vim'
    Plug 'scrooloose/syntastic'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'vim-scripts/twilight256.vim'
    Plug 'vim-scripts/wombat256.vim'
    Plug 'tmux-plugins/vim-tmux-focus-events'

    call plug#end()

" =======================
    " Plugin settings

    " indent_guides
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_default_mapping = 0
    let g:indent_guides_guide_size = 1
    let g:indent_guides_start_level = 2

    " YCM
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_collect_identifiers_from_tags_files = 1

    " SQL
    let g:sql_type_default = 'mysql'

    " Netrw
    let g:netrw_browsex_viewer = 'open'

    " Gitgutter
    let g:gitgutter_sign_column_always = 1

    " Virtualenv
    let g:virtualenv_stl_format = '   %n'

    " Using solarized for light colorscheme.
    let g:solarized_termcolors=256

" =======================
    " Colors and highlighting

    filetype plugin indent on
    set t_ut=
    set t_Co=256
    set background=dark
    syntax on

    colorscheme wombat256mod

" =======================
    " Settings

    set splitright
    set splitbelow
    set title
    set nocompatible
    set laststatus=2
    set backspace=indent,eol,start
    set nobackup
    set noswapfile
    set autoread
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
    set norelativenumber
    set nonumber
    set listchars=tab:▸\ ,eol:¬,space:𐄁
    set wildignore+=*.pyc,*.git/,tags,__pycache__/
    set grepprg=ag\ --nogroup\ --nocolor\ --follow\ --skip-vcs-ignores
    set wildmenu
    set shell=/bin/zsh
    set more
    set sessionoptions=blank,buffers,folds,sesdir,tabpages,winsize
    set diffopt+=filler,foldcolumn:0,context:4
    set joinspaces
    set complete=.,t,kspell
    set spellfile=~/dotfiles/spellfile.utf-8.add
    set undofile
    set undodir=~/.vim/undo
    set undolevels=1000
    set undoreload=10000
    set statusline=\ %f:%l%m\ %r%y
    set statusline+=%=
    set statusline+=\ %{fugitive#head()}
    set statusline+=%{virtualenv#statusline()}

" ======================
    " Key mappings

    let mapleader = ' '

    if has('nvim')
        tnoremap <Esc> <c-\><c-n>
        nmap <silent><bs> :<c-u>TmuxNavigateLeft<cr>
    endif

    noremap <silent><leader>tf :Pytest file<CR>
    noremap <silent><leader>tc :Pytest class<CR>
    noremap <silent><leader>tm :Pytest method<CR>
    noremap <silent><leader>tp :Pytest project<CR>

    noremap <C-p> :e **/*

    noremap <C-w>c :tabnew<CR>

    noremap <leader>g :YcmCompleter GoTo<CR>

    " Copy and past using system clipboard
    vnoremap <leader>y "*y
    noremap <leader>p "*p

    " make Y behave like C and D
    noremap Y y$

    noremap <Leader>s :wa<CR>

    " Splits
    noremap <right> :vertical resize +10<CR>
    noremap <left> :vertical resize -10<CR>
    noremap <up> :resize +5<CR>
    noremap <down> :resize -5<CR>

    " Quickfix navigation
    noremap <Leader>q :copen<CR>
    noremap ]q :cnext<CR>zzzv
    noremap [q :cprevious<CR>zzzv
    noremap ]Q :clast<CR>zzzv
    noremap [Q :cfirst<CR>zzzv

    " Tags navigation
    noremap ]t :tnext<CR>zzzv
    noremap [t :tprevious<CR>zzzv
    noremap ]T :tlast<CR>zzzv
    noremap [T :tfirst<CR>zzzv

    " Active buffers
    noremap <Leader>l :ls<CR>:b<space>
    noremap ]b :bnext<CR>
    noremap [b :bprevious<CR>

    " Go to next/previous git hunk
    noremap ]h :GitGutterNextHunk<CR>
    noremap [h :GitGutterPrevHunk<CR>

    " View top of file in new split above current buffer.
    " Good for adding imports etc.
    noremap <Leader>k :leftabove split<CR>:resize 10<CR>gg

    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv
    nnoremap <A-k> :m-2<CR>==
    nnoremap <A-j> :m+<CR>==

" ======================
    " Commands

    " Tags
    if has('nvim')
        command! BuildTags :call BuildTags()
    endif

    " Reload vimrc
    command! ReloadVimrc :source $MYVIMRC

    " Change tabstop, shiftwidth, softtabstop
    command! -nargs=1 TabWidth set ts=<args> sw=<args> sts=<args>

" ======================
    " Autocommands

    augroup misc
        autocmd!

        autocmd WinEnter * call AutoResizeWindow()

        " Setup colors
        autocmd ColorScheme * :call SetupColors()

        " auto remove trailing whitespace
        autocmd BufWritePre * :%s/\s\+$//e

        " Highlight the current word under the cursor
        autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

        autocmd BufEnter * let &titlestring=' /'.fnamemodify(getcwd(), ':t').'/'

        " autocmd VimEnter,BufWritePost,FocusGained * call UpdateTmuxWindowTitle()
    augroup END

    augroup filetypes
        autocmd!

        " Delete fugitive buffers when hidden
        autocmd BufReadPost fugitive://* set bufhidden=delete

        " Mark buffers from packages as nomodifiable
        autocmd BufReadPost */site-packages/* setlocal nomodifiable

        " update diff when moving the cursor
        autocmd InsertLeave * if &diff == 1 | diffupdate | endif

        autocmd FileType netrw setl bufhidden=delete

        autocmd BufRead,BufNewFile *.md set filetype=markdown

        autocmd FileType python setlocal formatprg=autopep8\ --ignore=E309\ -
        autocmd FileType python setlocal tags+=$VIRTUAL_ENV/lib/python2.7/site-packages/tags
        autocmd FileType python map <F5> Oimport pdb; pdb.set_trace()<ESC>

        autocmd FileType javascript map <F5> Odebugger;<ESC>

        autocmd FileType gitcommit setlocal foldmethod=syntax

        autocmd FileType puppet set ts=2 sw=2 sts=2
    augroup END

    if has('nvim')
        augroup nvim
            autocmd!

            autocmd BufWritePost * :call UpdateTags()
            autocmd TermOpen * setlocal nocursorcolumn nocursorline
            autocmd TermOpen * setlocal nocursorcolumn nocursorline
            autocmd TermOpen * set winfixheight
        augroup END
    endif

" ======================
    " Functions

    if has('nvim')
        function! BuildTags()
            call jobstart(['ctags', '-R', '.'])
        endfunction

        function! UpdateTags()
            if filereadable("tags")
                call BuildTags()
            endif
        endfunction
    endif

    function! SetupColors()
        highlight! link LineNr Normal
        highlight! link Folded Comment
        highlight! link SignColumn Normal
        highlight! link TabLineFill StatusLine
        highlight! link TabLine StatusLine
        highlight! link NonText Comment
        highlight! link ColorColumn CursorColumn

        highlight GitGutterAdd ctermfg=green
        highlight GitGutterChange ctermfg=blue
        highlight GitGutterDelete ctermfg=red
        highlight GitGutterChangeDelete ctermfg=blue

        " For viewing patches
        highlight diffRemoved ctermfg=red
        highlight diffAdded ctermfg=green

        " For vimdiff
        highlight DiffAdd ctermfg=NONE ctermbg=22
        highlight DiffChange ctermfg=NONE ctermbg=54
        highlight DiffDelete ctermfg=NONE ctermbg=52
        highlight DiffText ctermfg=NONE ctermbg=22
    endfunction
    call SetupColors()

    function! Day()
        set background=light
        colorscheme solarized
    endfunction

    function! Night()
        set background=dark
        colorscheme wombat256mod
    endfunction

    function! AutoResizeWindow()
        if (&ft =~ 'python')
            if (winwidth(0) < 126)
                execute 'vertical resize 126'
            endif
        endif
    endfunction
