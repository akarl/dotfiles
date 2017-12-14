" Plugins

	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

	call plug#begin('~/.local/share/nvim/plugged')

	Plug '/usr/local/opt/fzf'
	Plug 'Raimondi/delimitMate'
	Plug 'airblade/vim-gitgutter'
	Plug 'autozimu/LanguageClient-neovim', { 'for': ['python'], 'do': ':UpdateRemotePlugins' }
	Plug 'bradford-smith94/quick-scope'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoInstallBinaries' }
	Plug 'francoiscabrol/ranger.vim'
	Plug 'itchyny/lightline.vim'
	Plug 'janko-m/vim-test'
	Plug 'joshdick/onedark.vim'
	Plug 'junegunn/fzf.vim'
	Plug 'kassio/neoterm'
	Plug 'roxma/nvim-completion-manager'
	Plug 'sheerun/vim-polyglot'
	Plug 'tmhedberg/matchit'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-eunuch'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-sleuth'
	Plug 'tpope/vim-surround'
	Plug 'w0rp/ale'

	" Needed for ranger.vim.
	Plug 'rbgrouleff/bclose.vim'

	call plug#end()

" Plugin settings

	let python_highlight_all = 1
	let g:ranger_map_keys = 0

	let test#strategy = 'neoterm'
	let test#python#runner = 'pytest'
	let test#python#pytest#options = '--capture=no --showlocals -vv -x'

	let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
	let g:qs_max_chars = 150

	let g:neoterm_autoscroll = 1
	let g:neoterm_size = 15
	let g:neoterm_fixedsize = 1

	let g:fzf_buffers_jump = 1
	let g:echodoc#enable_at_startup = 1

	let g:ranger_replace_netrw = 1

	" Go
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_build_constraints = 1
	let g:go_metalinter_autosave = 0
	let g:go_fmt_command = "goimports"

	let $PYTHONPATH.='.'

	let g:ale_fix_on_save = 0
	let g:ale_linters = {
	\   'python': ['flake8', 'mypy'],
	\ }
	let g:ale_fixers = {
	\   'python': ['yapf', 'remove_trailing_lines'],
	\ }

	let g:LanguageClient_serverCommands = {
	\   'python': ['pyls'],
	\ }
	let g:LanguageClient_autoStart = 1
	let g:LanguageClient_windowLogMessageLevel = 'Error'
	let g:LanguageClient_diagnosticsList = 'location'

" Colors and highlighting

	filetype plugin indent on
	syntax on

	if has('nvim')
		set scrollback=10000
	endif

	set background=dark
	set termguicolors
	colorscheme onedark

	let g:lightline = {
	\   'colorscheme': 'onedark',
	\   'component_function': {
	\     'git': 'fugitive#head'
	\   },
	\   'active': {
	\     'left': [
	\       ['mode', 'paste'],
	\       ['readonly', 'relativepath', 'modified']
	\     ],
	\     'right': [
	\       ['lineinfo'],
	\       ['git'],
	\       ['fileformat', 'fileencoding', 'filetype']
	\     ],
	\   },
	\ }


	highlight! link ColorColumn CursorLine
	highlight! link LineNr Normal
	highlight! link Folded Comment
	highlight! link SignColumn Normal
	highlight! link TabLineFill StatusLine
	highlight! link TabLine StatusLine
	highlight! link TabLineSel Normal
	highlight! link NonText Comment
	highlight! link SpecialKey Comment

	" highlight! IncSearch guibg=NONE guifg=NONE gui=bold
	highlight! QuickScopePrimary guibg=#5C6370 guifg=#E5C07B gui=bold,italic,underline
	highlight! QuickScopeSecondary guibg=#5C6370 guifg=#E5C07B

" Settings

	set autoread  " Automatically reload files that changed on disk.
	set backspace=indent,start  " Allow backspacing over start of insert.
	set breakindent  " Indent wrapped lines at same level as original.
	set clipboard=unnamed  " Use the system clipboard.
	set colorcolumn=  " Don't display a color column.
	set complete=.,b,i,d,t  " CTRL-n completes: current buffer, other buffers, included files, macros, tags.
	set completeopt=menu,menuone,longest,preview  " Popup menu, even if one match, longest common text.
	set cursorline  " Show a cursorline at cursor.
	set diffopt+=filler,foldcolumn:0,context:4  " Nice options when showing diffs.
	set exrc  " Allow project local vimrc files.
	set fileformat=unix  " Unix file format.
	set foldenable
	set foldmethod=indent  " Fold on indent.
	set formatexpr=LanguageClient_textDocument_rangeFormatting()
	set grepprg=rg\ --vimgrep
	set hidden  " Can leave unsaved buffers.
	set ignorecase  " Searches are case insensitive.
	set inccommand=nosplit  " Preview replacements in buffer.
	set incsearch  " Show search matches while typing.
	set laststatus=2  " Show a  status line even if only one window.
	set lazyredraw  " Don't redraw when executing macros etc.
	set linebreak " When wrapping don't wrap in the middle of a word.
	set listchars=tab:▸\ ,eol:¬,space:𐄁 " What to display when running :set list.
	set more  " Pause lists when whole screen is filled, so they are scrollable.
	set mouse=a  " Enable mouse support
	set nobackup  " Don't use backup files.
	set nocursorcolumn  " Don't show the cursorcolumn.
	set nohlsearch  " Don't keep the higlight of a search after searching.
	set nonumber  " Don't show line numbers.
	set norelativenumber  " Don't show line numbers relative.
	set noshowcmd  " Don't show command typed.
	set noshowmode  " Don't show the --INSERT --.
	set nosmartindent  " Smartindent isn't very smart on a lot of languages.
	set nospell  " Show spelling errors.
	set noswapfile  " Don't use swapfiles.
	set nowrap  " Don't wrap long lines.
	set previewheight=20  " Set the hight of the preview window.
	set scrolloff=5  " Always leave 5 rows at top/bottom from cursor.
	set secure  " Disable autocmd etc for project local vimrc files.
	set sessionoptions=blank,buffers,folds,sesdir,tabpages,winsize  " What to save in a session.
	set shell=/bin/zsh  " Use zsh as the shell.
	set shiftwidth=4  " Indenting indents 4 spaces.
	set showbreak=\ \ …  " Show this at beginning of indent.
	set signcolumn=yes
	set smartcase  " If search contains a capital letter make the search case sensitive.
	set softtabstop=4  "A tab counts as 4 spaces.
	set spellfile=~/dotfiles/spellfile.utf-8.add  " File to use when saving custom words to spellfile"
	set tabstop=4  " A tab looks like 4 spaces.
	set title  " Vim sets terminal window title.
	set ttimeoutlen=0  " Removes the delay when pressing ESC.
	set undodir=~/.local/share/nvim/undo  " Where to save the undo file.
	set undofile  " Save undo steps after close.
	set wildignore+=*.pyc,*.git/,tags,__pycache__/,node_modules/  " Ignore these file endings when possible.
	set wildmenu  " Show matches above commandline when pressing TAB.
	set wildmode=longest,list,full  " Bash like command autocomplete

" Key mappings

	let mapleader = ' '

	nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

	if has('nvim')
		" Doing <C-w> goes to normal-mode and does a real <C-w>
		" tnoremap <C-w> <C-\><C-n><C-w>
		tnoremap <ESC> <C-\><C-n>
	endif


	noremap <Leader>e :Files<CR>
	noremap <Leader>o :Buffers<CR>
	noremap <Leader>T :Tags<CR>
	noremap <Leader><space> :Commands<CR>

	noremap <Leader>tt :Ttoggle<CR>
	noremap <Leader>tn :Topen<CR>:noautocmd write<CR>:TestNearest<CR>
	noremap <Leader>tl :Topen<CR>:noautocmd write<CR>:TestLast<CR>

	noremap <Leader>g :Gstatus<CR>
	noremap - :Ranger<CR>

	noremap <C-w>c :tabnew<CR>

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

" Commands

	if empty($VIRTUAL_ENV)
		command! BuildTags :call jobstart("/bin/rm tags; /usr/local/bin/ctags .")
	else
		command! BuildTags :call jobstart("/bin/rm tags; /usr/local/bin/ctags . $VIRTUAL_ENV/lib/python*/site-packages")
	endif

	" Reload vimrc
	command! ReloadVimrc :source $MYVIMRC | e 

	" Change tabstop, shiftwidth, softtabstop
	command! -nargs=1 TabWidth set ts=<args> sw=<args> sts=<args>

" Autocommands

	augroup misc
		autocmd!

		" Update diff when moving the cursor
		autocmd CursorHold * if &diff == 1 | diffupdate | endif

		" set autoread won't work in terminal unless this is set.
		autocmd CursorHold * checktime

		" Run makers after save.
		autocmd BufWritePost * silent! Neomake
		
		" Highlight the current word under the cursor
		autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

		" Reset the working directory after opening a file with an
		" absolute path.
		autocmd BufEnter * cd\ .

		autocmd User LanguageClientStarted call LanguageClient_notify('workspace/didChangeConfiguration', {'settings': {"pyls": {"plugins": {"pycodestyle": {"enabled": 0}}}}})
	augroup END

	augroup filetypes
		autocmd!

		" Chef eruby
		autocmd FileType eruby setlocal expandtab

		" Python
		autocmd FileType python setlocal expandtab
		autocmd FileType python setlocal formatprg=autopep8\ --ignore=E309\ -
		autocmd FileType python map <F5> Oimport ipdb; ipdb.set_trace()<ESC>
		autocmd FileType python map <F6> Oimport rpdb; rpdb.Rpdb().set_trace()<ESC>

		" Sql
		autocmd FileType sql vnoremap <Enter> :<C-U>call neoterm#exec(join(getline("'<", "'>"))."\n")<CR>


		" Go
		autocmd FileType go set nofoldenable

		" Markdown
		autocmd BufRead,BufNewFile *.md set filetype=markdown

		" Javascript
		autocmd FileType javascript map <F5> Odebugger;<ESC>

		" Misc
		autocmd FileType jinja TabWidth 2
		autocmd FileType yml setlocal expandtab
		autocmd FileType coffee setlocal expandtab
	augroup END
