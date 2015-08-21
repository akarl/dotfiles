" =======================
    " Plugged

    call plug#begin('~/.vim/plugged')

    Plug 'Raimondi/delimitMate'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --gocode-completer' }
    Plug 'airblade/vim-gitgutter'
    Plug 'altercation/vim-colors-solarized'
    Plug 'digitaltoad/vim-jade', { 'for': ['jade'] }
    Plug 'eiginn/netrw'
    Plug 'fatih/vim-go', { 'for': ['go'] }
    Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }
    Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript'] }
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'vim-scripts/wombat256.vim'
    Plug 'benekastah/neomake'

    call plug#end()

" =======================
    " Plugin settings

    " YCM
    let g:ycm_autoclose_preview_window_after_insertion = 1

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
    set spellfile=~/dotfiles/spellfile.utf-8.add
    set noundofile
    set undodir=~/.vim/undo
    set undolevels=1000
    set undoreload=10000
    set statusline=\ %f:%l:%c%m\ %r%y
    set statusline+=%=
    set statusline+=\ %{neomake#statusline#QflistStatus('Syntax')}

    if has('nvim')
        set completeopt=menuone,preview,noinsert
    endif

" ======================
    " Key mappings

    let mapleader = ' '

    if has('nvim')
        " tnoremap <Esc> <c-\><c-n>
        " nmap <silent><bs> :<c-u>TmuxNavigateLeft<cr>
        tnoremap <C-w>h <c-\><c-n><C-w>h
        tnoremap <C-w>l <c-\><c-n><C-w>l
        tnoremap <C-w>j <c-\><c-n><C-w>j
        tnoremap <C-w>k <c-\><c-n><C-w>k

        " C-i doesn't work in neovim yet.
        nnoremap ±;2C <C-i>
    endif

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
    noremap ]q :cnext<CR>zvzz
    noremap [q :cprevious<CR>zvzz
    noremap ]Q :clast<CR>zvzz
    noremap [Q :cfirst<CR>zvzz

    " Locationlist navigation
    noremap <Leader>l :lopen<CR>
    noremap ]l :lnext<CR>zvzz
    noremap [l :lprevious<CR>zvzz
    noremap ]L :llast<CR>zvzz
    noremap [L :lfirst<CR>zvzz

    " Tags navigation
    noremap ]t :tnext<CR>zvzz
    noremap [t :tprevious<CR>zvzz
    noremap ]T :tlast<CR>zvzz
    noremap [T :tfirst<CR>zvzz

    " Active buffers
    noremap <Leader>b :ls<CR>:b<space>
    noremap ]b :bnext<CR>
    noremap [b :bprevious<CR>

    " Go to next/previous git hunk
    noremap ]c :GitGutterNextHunk<CR>zvzz
    noremap [c :GitGutterPrevHunk<CR>zvzz

    " View top of file in new split above current buffer.
    " Good for adding imports etc.
    noremap <Leader>k :leftabove split<CR>:resize 10<CR>gg

    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv
    nnoremap <A-k> :m-2<CR>==
    nnoremap <A-j> :m+<CR>==

    nnoremap <C-w>z <C-w>\|<C-w>_

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

        autocmd BufWritePre * :%s/\s\+$//e
        autocmd BufWritePre * :%s/\($\n\)\+\%$//e

        autocmd BufWritePost * silent! Neomake
        autocmd CursorHold * silent! update

        " Highlight the current word under the cursor
        autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

        autocmd BufEnter * let &titlestring=' /'.fnamemodify(getcwd(), ':t').'/'

        autocmd WinLeave * setlocal nocursorcolumn nocursorline syntax=off
        autocmd WinEnter * setlocal cursorcolumn cursorline syntax=on
    augroup END

    augroup filetypes
        autocmd!

        autocmd BufReadPost */site-packages/* setlocal nomodifiable bufhidden=delete
        autocmd FileType netrw setl bufhidden=delete

        " update diff when moving the cursor
        autocmd CursorHold * if &diff == 1 | diffupdate | endif

        autocmd BufRead,BufNewFile *.md set filetype=markdown

        autocmd FileType python setlocal formatprg=autopep8\ --ignore=E309\ -
        autocmd FileType python setlocal tags+=$VIRTUAL_ENV/lib/python2.7/site-packages/tags
        autocmd FileType python map <F5> Oimport ipdb; ipdb.set_trace()<ESC>
        autocmd FileType python setlocal statusline+=%{virtualenv#statusline()}

        autocmd FileType go setlocal statusline+=\ %{resolve($GOPATH)}

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
