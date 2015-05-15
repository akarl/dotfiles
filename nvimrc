" =======================
    " Plugins
    call plug#begin('~/.nvim/plugged')

    Plug 'Raimondi/delimitMate'
    Plug 'SirVer/ultisnips'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
    Plug 'airblade/vim-gitgutter'
    Plug 'altercation/vim-colors-solarized'
    Plug 'ameade/qtpy-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'd11wtq/ctrlp_bdelete.vim'
    Plug 'digitaltoad/vim-jade', { 'for': ['jade'] }
    Plug 'edkolev/tmuxline.vim'
    Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }
    Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript'] }
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'marijnh/tern_for_vim', { 'for': ['javascript'], 'do': 'npm install' }
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'puppetlabs/puppet-syntax-vim'
    Plug 'scrooloose/syntastic'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'vim-scripts/twilight256.vim'

    call plug#end()

" =======================
    " Plugin settings

    " Ctrl-p
    call ctrlp_bdelete#init()
    let g:ctrlp_follow_symlinks = 1
    let g:ctrlp_open_multiple_files = '2vjr'
    let g:ctrlp_open_new_file = 'r'
    let g:ctrlp_working_path_mode = 0
    let g:ctrlp_lazy_update = 150
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_map = ''
    let g:ctrlp_extensions = []

    " Netrw
    let g:netrw_liststyle = 1
    let g:netrw_banner = 1
    let g:netrw_fastbrowse = 0
    let g:netrw_list_hide = '.git,.pyc'
    let g:netrw_preview = 1

    " Ultisnips
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    " indent_guides
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_default_mapping = 0
    let g:indent_guides_guide_size = 1
    let g:indent_guides_start_level = 2

    " YCM
    let g:ycm_autoclose_preview_window_after_insertion = 1

    " SQL
    let g:sql_type_default = 'mysql'
    let g:dbext_default_profile_GAN = 'type=MYSQL:user=root:dbname=getanewsletter'

" =======================
    " Colors and highlighting

    filetype plugin indent on
    set background=dark

    colorscheme twilight256
    syntax on

    highlight TabLineFill ctermfg=235 ctermbg=235
    highlight TabLine cterm=NONE ctermfg=240 ctermbg=235
    highlight TabLineSel cterm=NONE ctermfg=230 ctermbg=0

    highlight StatusLine ctermfg=235 ctermbg=230
    highlight StatusLineNC ctermfg=235 ctermbg=240

    highlight LineNr ctermbg=0 ctermfg=240
    highlight CursorLineNr ctermbg=234 ctermfg=blue
    highlight ColorColumn ctermbg=234
    highlight CursorLine cterm=NONE ctermbg=234
    highlight CursorColumn ctermbg=234

    " gutter splits and folds in a darker color
    highlight SignColumn ctermbg=black
    highlight VertSplit ctermfg=235 ctermbg=235
    highlight Folded cterm=NONE ctermbg=NONE ctermfg=245

    highlight GitGutterAdd ctermbg=black ctermfg=2
    highlight GitGutterChange ctermbg=black ctermfg=3
    highlight GitGutterDelete ctermbg=black ctermfg=1
    highlight GitGutterChangeDelete ctermbg=black ctermfg=3

    " Indent guides
    highlight IndentGuidesOdd  ctermbg=234
    highlight IndentGuidesEven ctermbg=234

" =======================
    " Settings

    set splitright
    set splitbelow
    set title
    set nocompatible
    set statusline=
    set statusline+=%f%m\ %y%r
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
    set relativenumber
    set number
    set listchars=tab:▸\ ,eol:¬
    set wildignore+=*.pyc,*.git,tags
    set splitright
    set grepprg=ag\ --nogroup\ --nocolor\ --follow\ --skip-vcs-ignores
    set wildmenu
    set shell=/bin/zsh
    set more
    set sessionoptions=blank,buffers,folds,sesdir,tabpages,winsize

" ======================
    " Key mappings

    let mapleader = ' '

    " osx keyboard...
    nmap § `

    tnoremap <Esc> <c-\><c-n>

    noremap <C-w>c :tabnew<CR>

    noremap <leader>g :YcmCompleter GoTo<CR>

    " Copy and past using system clipboard
    vnoremap <leader>y "*y
    noremap <leader>p "*p

    " make Y behave like C and D
    noremap Y y$

    noremap <Leader>s :wa<CR>

    " Jump list navigation
    " I have <tab> (CTRL-i) mapped to :CtrlPBuffer
    " My terminal is set to send <S-Right> when I press <C-i>
    nnoremap <S-Right> <C-i>

    " Splits
    noremap <C-Right> :vertical resize +10<CR>
    noremap <C-Left> :vertical resize -10<CR>
    noremap <C-Up> :resize +5<CR>
    noremap <C-Down> :resize -5<CR>

    " Buffers
    noremap <tab> :ls<CR>:b<space>
    noremap <C-p> :CtrlP<CR>

    " Tags
    command! BuildTags :call BuildTags()

    " Reload vimrc
    command! ReloadNvimrc :source $MYVIMRC

    noremap <F2> :call DjangoTestFile('%')<CR>
    noremap <F1> :call DjangoTestFile(g:lastDjangoTest)<CR>

    noremap ]q :cn<CR>zv
    noremap [q :cn<CR>zv
    noremap ]Q :cla<CR>zv
    noremap [Q :cfir<CR>zv

    nmap <up> <nop>
    nmap <down> <nop>
    nmap <left> <nop>
    nmap <right> <nop>

" ======================
    " Autocommands

    augroup misc
        autocmd!

        " update diff when moving the cursor
        " autocmd CursorMoved,CursorMovedI * if &diff == 1 | diffupdate | endif

        " auto remove trailing whitespace
        autocmd BufWritePre * :%s/\s\+$//e

        autocmd BufWritePost * :call UpdateTags()

        " Delete fugitive buffers when hidden
        autocmd BufReadPost fugitive://* set bufhidden=delete

        " Mark buffers from packages as nomodifiable
        autocmd BufReadPost */site-packages/* setlocal nomodifiable

        " Highlight the current word under the cursor
        autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    augroup END

    augroup filetypes
        autocmd!

        autocmd BufRead,BufNewFile *.md set filetype=markdown

        autocmd FileType python command! -nargs=1 ExtractToVar :call ExtractToVar__python('<args>')
        autocmd FileType python command! MultiLineDict :call MultiLineDict__python()
        autocmd FileType python command! IntractToVar :call IntractToVar__python()
        autocmd FileType python setlocal formatprg=autopep8\ --ignore=E309\ -
        autocmd FileType python setlocal tags+=$VIRTUAL_ENV/lib/python2.7/site-packages/tags

        autocmd FileType python call SetErrorFormat__python()

        autocmd FileType puppet set ts=2 sw=2 sts=2
    augroup END

    augroup active_window
        autocmd!

        " Only show cursorline and cursorcolumn in the active buffer
        autocmd WinEnter * setlocal cursorline
        autocmd WinEnter * setlocal cursorcolumn
        autocmd WinLeave * setlocal nocursorline
        autocmd WinLeave * setlocal nocursorcolumn

        autocmd WinEnter term:* setlocal nocursorline
        autocmd WinEnter term:* setlocal nocursorcolumn
        autocmd TermOpen * setlocal nocursorline
        autocmd TermOpen * setlocal nocursorcolumn

        " Only show cursorline and column in active window
        autocmd WinEnter * set wrap
        autocmd WinLeave * set nowrap

        " Resize window when entered
        autocmd WinEnter * call AutoResizeWindow()
    augroup END

    augroup commands
        autocmd!

        autocmd FileType python command! -range ToDict :<line1>,<line2>s/\(\w\+\)/'\1': \1,/g
    augroup END

    augroup breakpoints
        autocmd!

        autocmd FileType python map <F5> Oimport pdb; pdb.set_trace()<ESC>
        autocmd FileType javascript map <F5> Odebugger;<ESC>
    augroup END

" ======================
    " Functions
    "
    function! DjangoTestFile(f)
        " let l:file = expand(a:f)
        " let l:file = substitute(l:file, "/", ".", "g")
        " let l:file = substitute(l:file, ".py", "", "")

        " execute 'wall'
        execute 'bel split | enew'
        " let l:cmd = 'djtest ' . l:file
        " call termopen(cmd)
        execute 'resize 10'
        execute 'set winfixheight'
        execute 'terminal'

        " let g:lastDjangoTest = l:file
    endfunction

    function! MysqlPipe(database) range
        let sql = shellescape(join(getline(a:firstline, a:lastline)))
        execute '!clear && mysql -t --database=' . a:database . ' --user=root --execute=' . sql
    endfunction

    function! SetErrorFormat__python()
        " TODO: This should be moved into compiler file.

        let &makeprg = 'clear && python ./manage.py test -v 0'

        let &errorformat  = '%-GTraceback%.%#,'

        " The error message itself starts with a line with 'File' in it. There
        " are a couple of variations, and we need to process a line beginning
        " with whitespace followed by File, the filename in "", a line number,
        " and optional further text. %E here indicates the start of a multi-line
        " error message. The %\C at the end means that a case-sensitive search is
        " required.
        let &errorformat .= '%E  File "%f"\, line %l\,%m%\C,'
        let &errorformat .= '%E  File "%f"\, line %l%\C,'

        " The possible continuation lines are identified to Vim by %C. We deal
        " with these in order of most to least specific to ensure a proper
        " match. A pointer (^) identifies the column in which the error occurs
        " (but will not be entirely accurate due to indention of Python code).
        "let &errorformat .= '%C%p^,'

        " Any text, indented by more than two spaces contain useful information.
        " We want this to appear in the quickfix window, hence %+.
        let &errorformat .= '%+C    %.%#,'
        let &errorformat .= '%+C  %.%#,'

        " The last line (%Z) does not begin with any whitespace. We use a zero
        " width lookahead (\&) to check this. The line contains the error
        " message itself (%m)
        let &errorformat .= '%Z%\S%\&%m,'

        " We can ignore any other lines (%-G)
        let &errorformat .= '%-G%.%#'
    endfunction

    function! BuildTags()
        call jobstart(['ctags', '-R', '.'])
    endfunction

    function! UpdateTags()
        if filereadable("tags")
            call BuildTags()
        endif
    endfunction

    function! AutoResizeWindow()
        if (&ft =~ 'python')
            if (winwidth(0) < 126)
                execute 'vertical resize 126'
            endif
        endif
    endfunction

    function! ExtractToVar__python(name)
        execute('normal! cib' . a:name . '')
        execute('normal! O' . a:name . ' = p^')
    endfunction

    function! MultiLineDict__python()
        let origLine = line('.')

        execute('s/{/{\r/g')

        execute(origLine . ' normal! f{vaB')
        silent! execute(line('v') . ',' . line('.') . ' s/}/\r}/g')
        execute('normal! ')

        execute(origLine . ' normal! f{vaB')
        silent! execute(line('v') . ',' . line('.') . ' s/,/,\r/g')
        execute('normal! ')

        silent! execute(origLine . ' normal! f{vaB=')
        execute('normal! ')
    endfunction

    function! IntractToVar__python()
        " Find the definition
        execute('normal! ? =')
        " Cut the function
        execute('normal! wwvf(/)d')
        " Go back to the var name and search for next occurrence
        execute('normal! bb*')
        " Paste over the existing var
        execute('normal! viwp')
        " Go back to the original var and delete it
        execute('normal! Ndd')
    endfunction
