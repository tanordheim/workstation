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
" Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-dispatch'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }
Plug 'editorconfig/editorconfig-vim'
" Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'

" language plugins.
Plug 'fatih/vim-go', { 'for': 'go' }
" Plug 'sebdah/vim-delve', { 'for': 'go' }
Plug 'hashivim/vim-terraform', { 'for': 'tf' }
Plug 'google/vim-jsonnet'

" colorschemes plugins.
Plug 'rakr/vim-two-firewatch'

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
set hidden " hide abandoned buffers instead of unloading them
set shortmess+=c " skip ins-completion-menu messages
set signcolumn=yes " always show signcolumn
set cmdheight=2 " more space for messages"

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
" Colors
"
"------------------------------------------------------------------------------

let g:two_firewatch_italics=1 " turn on italics for the two firewatch theme"
syntax on " enable syntax highlighting
set background=dark " use dark background
colorscheme two-firewatch " set colorscheme

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

let g:airline_theme = 'twofirewatch' " set the color scheme
let g:airline_powerline_fonts = 1 " enable powerline fonts
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
" Plugin: neoclide/coc.nvim
"
"------------------------------------------------------------------------------

" add coc to airline
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" coc only does snippet and additional edit on confirm.
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<Plug>delimitMateCR"

" use ctrl+n and ctrl+N to jump between diagnostics
nmap <silent> <C-n> <Plug>(coc-diagnostic-next)
map <silent> <C-m> <Plug>(coc-diagnostic-prev)

" map coc gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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
" Plugin: Raimondi/delimitMate
"
"------------------------------------------------------------------------------

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

"------------------------------------------------------------------------------
"
" Language: Go
"
"------------------------------------------------------------------------------

au FileType go set noexpandtab " use hard tabs, not spaces
au FileType go set shiftwidth=4 " define the visible width of a tab
au FileType go set softtabstop=4 " number of spaces a <tab> in insertmode represents
au FileType go set tabstop=4 " how many spaces a tab represents


" keyboard bindings
"au FileType go nmap ga <Plug>(go-alternate-vertical)
"au FileType go nmap <leader>gd <Plug>(go-def)
"au FileType go nmap <leader>gt :GoDeclsDir<CR>
"au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>t <Plug>(go-test-func)
au FileType go nmap <leader>T <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
" au FileType go nmap <leader>b :DlvToggleBreakpoint<CR>
" au FileType go nmap <leader>B :DlvToggleTracepoint<CR>

let g:go_bin_path = $HOME.'/Code/go/bin' " explicitly set GOPATH
let g:go_def_mode = 'gopls' " use gopls for 'go to definition'
let g:go_info_mode = 'gopls' " use gopls for :GoInfo
let g:go_fmt_command = 'goimports' " use goimports when running gofmt
let g:go_def_mapping_enabled = 0 " disable go def-mapping, handled by coc
let g:go_doc_keywordprg_enabled = 0 " disable godoc on cursor, handled by coc

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
let g:go_addtags_transform = 'camelcase'
let g:go_snippet_engine = 'neosnippet'

"------------------------------------------------------------------------------
"
" Language: YAML
"
"------------------------------------------------------------------------------

au FileType yaml set expandtab " use spaces, not tabs
au FileType yaml set shiftwidth=2 " define the visible width of a tab
au FileType yaml set softtabstop=2 " number of spaces a <tab> in insertmode represents
au FileType yaml set tabstop=2 " how many spaces a tab represents

"------------------------------------------------------------------------------
"
" Language: Protobuf
"
"------------------------------------------------------------------------------

au FileType proto set expandtab " use spaces, not tabs
au FileType proto set shiftwidth=2 " define the visible width of a tab
au FileType proto set softtabstop=2 " number of spaces a <tab> in insertmode represents
au FileType proto set tabstop=2 " how many spaces a tab represents

"------------------------------------------------------------------------------
"
" Language: Jsonnet
"
"------------------------------------------------------------------------------

au FileType jsonnet set expandtab " use spaces, not tabs
au FileType jsonnet set shiftwidth=2 " define the visible width of a tab
au FileType jsonnet set softtabstop=2 " number of spaces a <tab> in insertmode represents
au FileType jsonnet set tabstop=2 " how many spaces a tab represents

"------------------------------------------------------------------------------
"
" Language: Terraform
"
"------------------------------------------------------------------------------

au FileType terraform set expandtab " use spaces, not tabs
au FileType terraform set shiftwidth=2 " define the visible width of a tab
au FileType terraform set softtabstop=2 " number of spaces a <tab> in insertmode represents
au FileType terraform set tabstop=2 " how many spaces a tab represents
