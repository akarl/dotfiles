" Plugins

    call plug#begin('~/.vim/plugged')

    Plug 'Raimondi/delimitMate'
    " Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --gocode-completer' }
    Plug 'Shougo/deoplete.nvim'
    Plug 'airblade/vim-gitgutter'
    Plug 'benekastah/neomake'
    Plug 'digitaltoad/vim-jade', { 'for': ['jade'] }
    Plug 'eiginn/netrw'
    Plug 'fatih/vim-go', { 'for': ['go'] }
    Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }
    Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript'] }
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'tmhedberg/matchit'
    Plug 'voithos/vim-python-matchit'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'vim-scripts/wombat256.vim'
    Plug 'janko-m/vim-test'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'jeetsukumaran/vim-indentwise'
    Plug 'davidhalter/jedi-vim'

    call plug#end()

" Plugin settings

    let test#strategy = 'basic'
    let test#python#runner = 'djangotest'
    let test#python#djangotest#file_pattern = '^test.*\.py$'

    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#auto_completion_start_length = 1

    let g:jedi#auto_initialization = 0
    let g:jedi#show_call_signatures = 0

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

" Colors and highlighting

    filetype plugin indent on
    set t_ut=
    set t_Co=256
    set background=dark
    syntax on

    colorscheme wombat256mod

" Settings

    set title
    set nocompatible
    set laststatus=2
    set backspace=indent,eol,start
    set nobackup
    set noswapfile
    set autoread
    set incsearch
    set nohlsearch
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
    set foldmethod=syntax
    set scrolloff=5
    set fileformat=unix
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
    set complete=.,b,i,d,t
    set completeopt=menu,menuone,longest,preview

" Key mappings

    let mapleader = ' '

    if has('nvim')
        tnoremap <Esc><Esc> <c-\><c-n>

        " C-i doesn't work in neovim yet.
        nnoremap ±;2C <C-i>

        noremap <Leader>e :silent terminal nvimex edit $(fzf)<CR>
        noremap <Leader>b :silent terminal nvimex b $(nvimex ls \| fzf)<CR>
    endif

    noremap <F4> :wa<CR>:TestLast<CR>

    noremap gd :YcmCompleter GoTo<CR>

    noremap <C-w>c :tabnew<CR>

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
    noremap ]b :bnext<CR>
    noremap [b :bprevious<CR>

    noremap [A :first<CR>
    noremap ]A :last<CR>
    noremap [a :next<CR>
    noremap ]a :next<CR>

    " Go to next/previous git hunk
    noremap ]h :GitGutterNextHunk<CR>zvzz
    noremap [h :GitGutterPrevHunk<CR>zvzz

    " View top of file in new split above current buffer.
    " Good for adding imports etc.
    noremap <Leader>k :leftabove split<CR>:resize 10<CR>gg

    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv
    nnoremap <A-k> :m-2<CR>==
    nnoremap <A-j> :m+<CR>==

    nnoremap <C-w>z <C-w>\|<C-w>_

" Commands

    " Tags
    if has('nvim')
        command! Tag :terminal nvimex_tags
        command! SitePackagesTag :terminal cd $VIRTUAL_ENV/lib/python2.7/site-packages && nvimex_tags
        command! BuildTags :call BuildTags()
        command! SitePackages :terminal cd $VIRTUAL_ENV/lib/python2.7/site-packages && nvimex edit $(fzf)
    endif

    command! Gstatus echo system('git status')
    command! Gbranch echo system('git branch')

    " Reload vimrc
    command! ReloadVimrc :source $MYVIMRC

    " Change tabstop, shiftwidth, softtabstop
    command! -nargs=1 TabWidth set ts=<args> sw=<args> sts=<args>

" Autocommands

    augroup misc
        autocmd!

        autocmd WinEnter * call AutoResizeWindow()

        " Setup colors
        autocmd ColorScheme * :call SetupColors()

        autocmd BufWritePre * :%s/\s\+$//e
        autocmd BufWritePre * :%s/\($\n\)\+\%$//e

        autocmd BufWritePost * silent! Neomake

        " Highlight the current word under the cursor
        autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

        autocmd BufEnter * let &titlestring=' /'.fnamemodify(getcwd(), ':t').'/'

        autocmd WinLeave * setlocal nocursorcolumn nocursorline
        autocmd WinEnter * setlocal cursorcolumn cursorline

        autocmd InsertLeave * setlocal cursorcolumn
        autocmd InsertEnter * setlocal nocursorcolumn
    augroup END

    augroup filetypes
        autocmd!

        autocmd BufLeave *nvimex* setlocal nomodifiable bufhidden=delete
        autocmd FileType netrw setlocal bufhidden=delete

        " update diff when moving the cursor
        autocmd CursorHold * if &diff == 1 | diffupdate | endif

        autocmd BufRead,BufNewFile *.md set filetype=markdown

        autocmd FileType vim setlocal foldmethod=indent

        autocmd FileType python setlocal omnifunc=jedi#completions
        autocmd FileType python noremap <buffer> K :call jedi#show_documentation()<CR>
        autocmd FileType python setlocal foldmethod=indent
        autocmd FileType python setlocal formatprg=autopep8\ --ignore=E309\ -
        autocmd FileType python setlocal tags+=$VIRTUAL_ENV/lib/python2.7/site-packages/tags
        autocmd FileType python map <F5> Oimport ipdb; ipdb.set_trace()<ESC>
        autocmd FileType python setlocal statusline+=%{virtualenv#statusline()}

        autocmd FileType go setlocal statusline+=\ %{resolve($GOPATH)}

        autocmd FileType javascript map <F5> Odebugger;<ESC>

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
