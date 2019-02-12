""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" PACKAGE MANAGEMENT
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" be iMproved, required.
set nocompatible
" turn off filetype detection, required.
" filetype off

" initialize vim-plugged
call plug#begin('~/.vim/plugged')

" let ale and syntastic coexist without warnings.
let g:ale_emit_conflict_warnings = 0

" core plugins.
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'kien/ctrlp.vim'

" main plugins.
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'

" ui/panel plugins.
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

" language plugins.
Plug 'fatih/vim-go'
Plug 'mhartington/nvim-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'hashivim/vim-terraform'

" autocomplete, snippets and formatting.
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'AndrewRadev/splitjoin.vim'

" end the plug loader and enable filetype detection again.
call plug#end()
" filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" define how and where backups are stored.
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backup
set writebackup
set noswapfile

" persist undo tree between sessions
set undofile
set history=100
set undolevels=100

" ignore certain files and folders.
set wildignore+=*/.git/*,*/node_modules/*,*/vendor/*,*/bin/*,*/obj/*

" set <leader>.
let mapleader=','

" show trailing whitespaces.
set list
set listchars=nbsp:⦸,tab:\ \ ,extends:»,precedes:«,trail:•

" enable syntax highlighting and set a color scheme.
syntax on
let base16colorspace = 256
colorscheme base16-tomorrow-night

" configure ctrlp.
let g:ctrlp_map = '<c-p>'
nnoremap <leader>p :CtrlPBuffer<CR>

" enable and configure airline.
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" configure fugitive shortcuts.
nnoremap <leader>s :Gstatus<CR>

" use the system clipboard by default.
set clipboard=unnamedplus

" toggle paste mode.
set pastetoggle=<leader>p

" show/hide toggleables.
nnoremap <F1> :TagbarToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>

" highlight the current line.
set cursorline

" show line numbers
set number

" make buffers hidden when they're abandoned.
set hidden

" don't wrap long lines automatically.
set nowrap

" allow backspacing over everytrhing in insert mode.
set backspace=indent,eol,start

" set tab sizes and indenting.
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" insert tabs on the start of the line according to shiftwidth, not tabstop.
set smarttab

" case insensitive search, and highlight search terms.
set ignorecase
set smartcase
set hlsearch
set incsearch

" case insensitive completion of filenames.
set wildignorecase

" disable highlighting.
map <silent> <leader><CR> :noh<CR>

" auto-highlight matching parenthesis and other block indicators.
set showmatch

" simplify moving between open windows.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" switch cwd to the directory of the open buffer.
nmap <silent> <leader>cd :lcd %:h<CR>

" create the full directory tree to the open buffer.
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" change terminal title.
set title

" don't beep.
set visualbell
set noerrorbells

" quickfix configuration.
nnoremap <leader>a :cclose<CR>

" configure UltiSnips keybindings.
let g:UltiSnipsExpandTrigger = '<C-j>'

" configure ale.
let g:ale_sign_error = '✗✗'
let g:ale_sign_warning = '⚠⚠'
map <C-n> :ALENextWrap<CR>
map <C-m> :ALEPreviousWrap<CR>

" configure syntastic.
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_warning_symbol = '⚠⚠'

" configure deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" disable preview window when completing.
set completeopt-=preview

" set how much to scroll when reaching the bottom of the buffer.
set scrolloff=10

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" GO LANGUAGE SETTINGS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" configure vim-go.
let g:go_bin_path = $HOME.'/Code/go/bin'
let g:go_fmt_command = 'goimports'
let g:go_list_type = 'quickfix'
let g:go_metalinter_autosave = 0 " disabled because of the super annoying jumping to next error when enabled - see https://github.com/fatih/vim-go/issues/2136
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_addtags_transform = 'camelcase'

" disable syntastic linting of go files.
let g:syntastic_go_checkers = []

" configure ale-linting of go files.
let g:ale_linters = { 'go': [] }
let g:ale_linters = { 'go': ['gometalinter'] }
let g:ale_go_gometalinter_options = '--fast'

augroup FileType go
    au!
    autocmd FileType go command! -bang GoAlternateVerticalSplit call go#alternate#Switch(<bang>0, 'vsplit')
    au FileType go nmap <leader>gd <Plug>(go-def-vertical)
    au FileType go nmap <leader>ga :GoAlternateVerticalSplit<CR>
    au FileType go nmap <leader>i <Plug>(go-info)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>tf <Plug>(go-test-func)
    au FileType go nmap <leader>l <Plug>(go-metalinter)
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TYPESCRIPT LANGUAGE SETTINGS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup FileType typescript
    au FileType typescript setl shiftwidth=2
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" HTML LANGUAGE SETTINGS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup FileType html
    au FileType html setl shiftwidth=2
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" YAML LANGUAGE SETTINGS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup FileType yaml
    au FileType yaml setl shiftwidth=2
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TERRAFORM RESOURCE SETTINGS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup FileType terraform
    au FileType terraform setl shiftwidth=2
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" C# LANGUAGE SETTINGS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable ale-linting of cs files.
let g:ale_linters = { 'cs': [] }

" use OmniSharp for syntax checking cs files.
let g:syntastic_cs_checkers = ['code_checker']

" configure OmniSharp.
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_server_path = '/opt/omnisharp-roslyn/OmniSharp.exe'
let g:OmniSharp_selector_ui = 'ctrlp'
augroup FileType cs
    au!
    au FileType cs setlocal omnifunc=OmniSharp#Complete
    au FileType cs nmap <leader>i :OmniSharpTypeLookup<CR>
    au FileType cs nmap gd :OmniSharpGotoDefinition<CR>
    au FileType cs nmap <leader>b :OmniSharpBuild<CR>
    au FileType cs nmap <leader>fu :OmniSharpFixUsings<CR>
    au FileType cs nmap <leader>fi :OmniSharpFixIssue
    au BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" GIT-GUTTER SETTINGS
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" decrease updatetime (default 4000) to make it feel more snappy
set updatetime=100

" modify the gutter signs to look better
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '━'
let g:gitgutter_sign_modified_removed = '╋━'

" don't enable gitgutter hotkeys, i want it mostly for the signs
let g:gitgutter_map_keys = 0
