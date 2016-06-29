" Plugins

    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif

    call plug#begin('~/.vim/plugged')

    Plug 'Raimondi/delimitMate'
    Plug 'airblade/vim-gitgutter'
    Plug 'benekastah/neomake'
    Plug 'fatih/vim-go', { 'for': ['go'] }
    Plug 'hynek/vim-python-pep8-indent', { 'for': ['python'] }
    Plug 'janko-m/vim-test'
    Plug 'jgdavey/tslime.vim'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'altercation/vim-colors-solarized'

    call plug#end()

" Plugin settings

    let test#strategy = 'tslime'
    let test#python#runner = 'pytest'

    " Gitgutter
    let g:gitgutter_sign_column_always = 1

    " Go
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_metalinter_autosave = 0
    let g:go_fmt_command = "goimports"
    let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
    let g:go_metalinter_autosave_enabled = ['vet', 'errcheck']

    let g:neomake_go_enabled_makers = ['go', 'govet']

" Colors and highlighting

    filetype plugin indent on
    syntax on

    if !has('nvim')
        set t_ut=
        set t_Co=16
    endif

    set background=light
    colorscheme solarized

    highlight! link LineNr Normal
    highlight! link Folded Comment
    highlight! link SignColumn Normal
    highlight! link TabLineFill StatusLine
    highlight! link TabLine StatusLine
    highlight! link TabLineSel Normal
    highlight! link NonText Comment

    highlight GitGutterAdd ctermfg=green
    highlight GitGutterChange ctermfg=yellow
    highlight GitGutterDelete ctermfg=red
    highlight GitGutterChangeDelete ctermfg=red

    " For viewing patches
    highlight diffRemoved ctermfg=red
    highlight diffAdded ctermfg=green

    " For vimdiff
    highlight DiffAdd ctermfg=black ctermbg=green
    highlight DiffChange ctermfg=black ctermbg=yellow
    highlight DiffDelete ctermfg=black ctermbg=red
    highlight DiffText ctermfg=black ctermbg=green

    " Spell highlight
    syntax clear SpellBad
    syntax clear SpellCap
    syntax clear SpellLocal
    syntax clear SpellRare

    highlight SpellBad cterm=underline ctermbg=NONE
    highlight! link SpellCap SpellBad
    highlight! link SpellLocal SpellBad
    highlight! link SpellRare SpellBad

" Settings

    if !has('nvim')
        set nocompatible
        set ttyfast
    endif

    set title  " Vim sets terminal window title.
    set laststatus=2  " Show a  status line even if only one window.
    set backspace=indent,eol,start  " Backspace works behind start of insert.
    set nobackup  " Dont use backup files.
    set noswapfile  " Dont use swapfiles.
    set incsearch  " Show search matches while typing.
    set nohlsearch  " Dont keep the higlight of a search after searching.
    set ignorecase  " Searches are case insensitive.
    set smartcase  " If search contains a capital letter make the search case sensitive.
    set nosmartindent  " Smartindent insn't very smart on a lot of languages.
    set tabstop=4  " A tab looks as 4 spaces.
    set softtabstop=4  "A tab counts as 4 spaces.
    set shiftwidth=4  " Indenting indents 4 spaces.
    set wrap  " Wrap long lines.
    set linebreak " When wrapping don't wrap in the middle of a word.
    set breakindent  " Indent wrapped lines at same level as original.
    set showbreak=\ \ …  " Show this at begingin of indent.
    set noshowcmd  " Don't show command typed.
    set hidden  " Can leave unsaved buffers.
    set cursorline  " Show a cursorline at cursor.
    set nocursorcolumn  " Dont show the cursorcolumn.
    set lazyredraw  " Don't redraw when executing macros etc.
    set ttimeoutlen=0  " Removes the delay when pressing ESC.
    set foldmethod=indent  " Fold on indent.
    set scrolloff=5  " Always leave 5 rows at top/bottom from cursor.
    set fileformat=unix  " Unix file format.
    set colorcolumn=101  " Visual margin for text width.
    set nonumber  " Don't show line numbers.
    set norelativenumber  " Dont show line numbers relative.
    set listchars=tab:▸\ ,eol:¬,space:𐄁 " What to display when running :set list.
    set wildignore+=*.pyc,*.git/,tags,__pycache__/  " Ignore these file endings when possible.
    set grepprg=ag\ --nogroup\ --nocolor\ --follow\ --skip-vcs-ignores  " Use ag as grep command.
    set wildmenu  " Show matches above commandline when pressing TAB.
    set shell=/bin/zsh  " Use zsh as the shell.
    set more  " Pause lists when whole screen is filled, so they are scrollable.
    set sessionoptions=blank,buffers,folds,sesdir,tabpages,winsize  " What to save in a session.
    set diffopt+=filler,foldcolumn:0,context:4  " Nice options when showing diffs.
    set spellfile=~/dotfiles/spellfile.utf-8.add  " File to use when saving custom words to spellfile"
    set undofile  " Save undo steps after close.
    set undodir=~/.vim/undo  " Where to save the undo file.
    set statusline=\ %f:%l:%c%m\ %r%y  " Usefull statusline: file:line:column modified readonly filetype .
    set statusline+=\ %{neomake#statusline#LoclistStatus('Neomake:\ ')}  " Show that we have syntax error.
    set complete=.,b,i,d,t  " CTRL-n completes: current buffer, other buffers, included files, macros, tags.
    set completeopt=menu,menuone,longest,preview  " Popup menu, even if one match, longest common text.
    set spell  " Show spelling errors.

" Key mappings

    let mapleader = ' '

    if has('nvim')
        " C-i doesn't work in neovim yet.
        nnoremap ±;2C <C-i>

        noremap <Leader>e :silent terminal nvimex edit $(fzf) -w<CR>
        noremap <Leader>b :silent terminal nvimex b $(nvimex ls -w \| fzf) -w<CR>
        noremap - :silent terminal ranger --selectfile=%  --choosefile=/tmp/.ranger && nvimex edit $(cat /tmp/.ranger) -w && /bin/rm /tmp/.ranger<CR>
    endif

    nnoremap <silent> K :call Dasht([expand('<cword>')])<CR>

    noremap <F4> :wa<CR>:TestLast<CR>
    noremap <F2> :wa<CR>:Tmux clear; make test<CR>

    noremap <C-w>c :tabnew<CR>

    noremap <Leader>t :tag<space>

    " Copy and past using system clipboard
    vnoremap <leader>y "*y
    noremap <leader>p "*p

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

    " Quickfix navigation
    noremap <Leader>l :copen<CR>
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

    " Arglist navigation
    noremap [A :first<CR>
    noremap ]A :last<CR>
    noremap [a :next<CR>
    noremap ]a :next<CR>

" Commands

    if has('nvim')
        command! Gchanged :silent terminal nvimex edit $(g diff --name-only | fzf) -w
        command! SitePackages :terminal cd $VIRTUAL_ENV/lib/python2.7/site-packages && nvimex edit $(fzf) -w
    endif

    command! TmuxReset unlet g:tslime

    command! BuildTags :!/bin/rm tags; /usr/local/bin/ctags

    " Reload vimrc
    command! ReloadVimrc :source $MYVIMRC

    " Change tabstop, shiftwidth, softtabstop
    command! -nargs=1 TabWidth set ts=<args> sw=<args> sts=<args>

" Autocommands

    augroup misc
        autocmd!

        " Update diff when moving the cursor
        autocmd CursorHold * if &diff == 1 | diffupdate | endif

        " Strip trailing lines/spaces.
        autocmd BufWritePre * :%s/\s\+$//e
        autocmd BufWritePre * :%s/\($\n\)\+\%$//e

        " Run makers after save.
        autocmd BufWritePost * silent! Neomake

        " Highlight the current word under the cursor
        autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

        " Set the terminal title as the current working directory.
        autocmd BufEnter * let &titlestring=' /'.fnamemodify(getcwd(), ':t').'/'

        autocmd WinLeave * setlocal nocursorline
        autocmd WinEnter * setlocal cursorline
    augroup END

    augroup filetypes
        autocmd!

        " Python
        autocmd FileType python setlocal expandtab
        autocmd FileType python setlocal formatprg=autopep8\ --ignore=E309\ -
        autocmd FileType python setlocal tags+=$VIRTUAL_ENV/lib/python2.7/site-packages/tags
        autocmd FileType python map <F5> Oimport pdb; pdb.set_trace()<ESC>

        " Go
        autocmd FileType go setlocal statusline+=\ %{resolve($GOPATH)}
        autocmd FileType go setlocal nofoldenable
        autocmd FileType go iabbrev iferr if err != nil {}<LEFT>

        " Markdown
        autocmd BufRead,BufNewFile *.md set filetype=markdown

        " Javascript
        autocmd FileType javascript map <F5> Odebugger;<ESC>

        " Misc
        autocmd FileType jinja TabWidth 2
    augroup END
