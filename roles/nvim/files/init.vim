"------------------------------------------------------------------------------
"
" NeoVim configuration
"
" Strongly inspired by the following:
"
"  - https://github.com/sebdah/dotfiles/blob/master/config/nvim/init.vim
"
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
"
" Package management
"
"------------------------------------------------------------------------------

" be iMproved, required.
set nocompatible

" initialize vim-plugged
call plug#begin('~/.vim/plugged')

" general plugins.
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-dispatch'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'ervandew/supertab'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'

" language plugins.
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'sebdah/vim-delve', { 'for': 'go' }
Plug 'hashivim/vim-terraform', { 'for': 'tf' }

" colorschemes plugins.
Plug 'morhetz/gruvbox'

" end the plug loader and enable filetype detection again.
call plug#end()

"------------------------------------------------------------------------------
"
" General settings
"
"------------------------------------------------------------------------------

set autoindent " use indentation from previous line on new lines
set smartindent " enable smart indentation (eg. indenting next lines after '{' and such)
set autoread " auto-reload files that changed on disk - undo reverts the reload
set clipboard=unnamedplus " use the system clipboard by default
set completeopt+=noselect " disable selecting the first item in the preview list by default"
set cursorline " highlight the current line
set encoding=utf-8 " force UTF8 encoding
set expandtab " expand tabs to spaces
set list " show whitespaces
set listchars=nbsp:⦸,tab:\ \ ,extends:»,precedes:«,trail:• " overide whitespace symbols for readability
set nospell " disable spellchecks
set noswapfile " disable swap file
set nowrap " don't wrap long lines automatically
set noerrorbells " no audible sounds on errors
set visualbell " no visual alerts on errors
set number " show line numbers
set formatoptions-=t " disable auto-wrapping text while typing
set formatoptions+=r " insert comment leader after hitting <enter> in insert mode
set formatoptions+=o " insert comment leader after hitting o or O in insert mode
set formatoptions+=n " recognize numbered lists when formatting text
set softtabstop=2 " number of spaces a <tab> in insertmode represents
set tabstop=2 " how many spaces a tab represents
set title " let neovim set the terminal title
set updatetime=100 " redraw status every 100ms
let mapleader=',' " set the leader button
set backup " back up files being edited
set writebackup " create backup files before writing a file
set history=100 " number of commands remembered in history table
set undofile " persist undo tree between sessions
set undolevels=100 " number of undo levels to remember
set undodir=~/.vim/tmp/undo/ " set the directory where undo history is stored
set backupdir=~/.vim/tmp/backup/ " set the directory where backups are stored
set directory=~/.vim/tmp/swap/ " set the directory where swap files and other junk is stored
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showmatch " auto-highlight matching parenthesis and other block indicators
set scrolloff=10 " set how much to scroll when reaching the bottom of the buffer

" enable 24bit colors if available
if (has("termguicolors"))
  set termguicolors
endif

" wrap text in the quickfix window
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

"------------------------------------------------------------------------------
"
" Searching
"
"------------------------------------------------------------------------------

let g:gruvbox_italic=1 " turn on italics for the gruvbox theme
syntax on " enable syntax highlighting
set background=dark " use dark background
colorscheme gruvbox " set colorscheme

"------------------------------------------------------------------------------
"
" Searching
"
"------------------------------------------------------------------------------

set wildignore+=*/.git/*,*/node_modules/*,*/vendor/*,*/bin/*,*/obj/* " ignore certain annoying files and folders in completion
set ignorecase " ignore casing when searching
set smartcase " if searchtext contains non-lowercase characters, skip ignorecase
set hlsearch " highlight all matches when searching
set incsearch " search while typing
set wildignorecase " case insensitive completion of filenames
set inccommand=nosplit " show search and replace changes interactively

" clear search highlights
map <leader><CR> :nohlsearch<CR>

" center the buffer on the match when navigating between matches
nnoremap n nzzzv
nnoremap N Nzzzv

"------------------------------------------------------------------------------
"
" Navigation and keybinds
"
"------------------------------------------------------------------------------

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" jump between buffers with shift+arrow
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>

augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted " skip quickfix buffer when navigating between buffers
  autocmd FileType qf wincmd J " always position quickfix window on the bottom
augroup END

" simplify moving between open windows by using ctrl+[jkhl]
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" toggle paste mode.
set pastetoggle=<leader>p

" switch cwd to the directory of the open buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" create the full directory tree to the open buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" close the quickfix window
nnoremap <leader>a :cclose<CR>

" use ctrl+n and ctrl+N to jump between quickfix locations
map <C-n> :cnext<CR>
map <C-m> :cprev<CR>

"------------------------------------------------------------------------------
"
" Splits
"
"------------------------------------------------------------------------------

set splitbelow " create horizontal splits below the current buffer
set splitright " create vertical splits to the right of the current buffer

"------------------------------------------------------------------------------
"
" Plugin: bling/vim-airline
"
"------------------------------------------------------------------------------

let g:airline_theme = 'gruvbox' " set the color scheme
let g:airline_powerline_fonts = 1 " enable powerline fonts
let g:airline#extensions#ale#enabled = 1 " show ale-status in powerline
let g:airline#extensions#tabline#enabled = 1 " enable top tabline
let g:airline#extensions#tabline#show_tabs = 0 " only show buffers, not tabs, in the top tabline

"------------------------------------------------------------------------------
"
" Plugin: kien/ctrlp.vim
"
"------------------------------------------------------------------------------

let g:ctrlp_map = '<c-p>' " map ctrl+p to ctrlp

"------------------------------------------------------------------------------
"
" Plugin: majutsushi/tagbar
"
"------------------------------------------------------------------------------

" toggle the tagbar with F1
nnoremap <F1> :TagbarToggle<CR>

" configure the tagbar for Go
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

"------------------------------------------------------------------------------
"
" Plugin: scrooloose/nerdtree
"
"------------------------------------------------------------------------------

" toggle NERDTree with F2
nnoremap <F2> :NERDTreeToggle<CR>

" refresh NERDTree on f5
nnoremap <F5> :NERDTreeRefreshRoot<CR>

let NERDTreeRespectWildIgnore=1 " respect wildignore when ignoring files in the tree

" automatically open NERDTree
autocmd! VimEnter * NERDTree | wincmd w

" automatically close the nerdtree buffer if it's the only one left open
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"------------------------------------------------------------------------------
"
" Plugin: w0rp/ale
"
"------------------------------------------------------------------------------

" configure ale.
let g:ale_sign_error = '✗✗' " override error sign shown in gutter
let g:ale_sign_warning = '⚠⚠' " override warning sign shown in gutter
let g:ale_open_list = 1 " automatically open a list of ale errors or warnings (eg. lint errors)
let g:ale_lint_on_text_changed = 'never' " only lint on save
let g:ale_linters = {} " disable all default linters
let g:ale_linters_explicit = 1 " only use linters we explicitly enable

let g:ale_set_loclist = 0 " don't use location list for listing linting issues
let g:ale_set_quickfix = 1 " use quickfix list for listing linting issues

"------------------------------------------------------------------------------
"
" Plugin: ervandew/supertab
"
"------------------------------------------------------------------------------

let g:SuperTabDefaultCompletionType = "context" " determine which completion type to use based on context around the cursor

"------------------------------------------------------------------------------
"
" Plugin: airblade/vim-gitgutter
"
"------------------------------------------------------------------------------

" modify the gutter signs to look better
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '━'
let g:gitgutter_sign_modified_removed = '╋━'
let g:gitgutter_map_keys = 0 " don't enable gitgutter hotkeys, i want it mostly for the signs

"------------------------------------------------------------------------------
"
" Language: Go
"
"------------------------------------------------------------------------------

au FileType go set noexpandtab " use hard tabs, not spaces
au FileType go set shiftwidth=4 " define the visible width of a tab
au FileType go set softtabstop=4 " number of spaces a <tab> in insertmode represents
au FileType go set tabstop=4 " how many spaces a tab represents
au FileType go nested :TagbarOpen " automatically open tagbar


" keyboard bindings
au FileType go nmap <leader>ga <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap <leader>gt :GoDeclsDir<CR>
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>t <Plug>(go-test-func)
au FileType go nmap <leader>T <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <leader>b :DlvToggleBreakpoint<CR>
au FileType go nmap <leader>B :DlvToggleTracepoint<CR>

let g:go_bin_path = $HOME.'/Code/go/bin' " explicitly set GOPATH
let g:go_def_mode = 'gopls' " use gopls for 'go to definition'
let g:go_fmt_command = 'goimports' " use goimports when running gofmt
"let g:go_metalinter_command = 'golangci-lint' " use golang-ci-lint for linting
"let g:go_metalinter_autosave = 1 " automatically run golang-ci when saving buffers
let g:go_list_type = 'locationlist' " use locationlist for command outputs
let g:go_statusline_duration = 10000 " only show statusline for 10s
let g:go_echo_command_info = 0 " stop echoing go command info, shown in statusline instead

" tweak default syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = 'camelcase'
let g:go_snippet_engine = 'neosnippet'

" configure ale linting
let g:ale_linters['go'] = ['golangci-lint'] " use golangci-lint
" let g:ale_go_golangci_lint_package = 1 " lint the entire package, not just the open buffer
let g:ale_go_golangci_lint_options = '' " don't pass any options to golang-ci, use the default settings and optionally the .golangci.yml in cwd
