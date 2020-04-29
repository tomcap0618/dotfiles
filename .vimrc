"Requirements:
"pip3 install pynvim neovim
"clang-format
"black

set nocompatible "Disable VI compatibility. This is required for some commands.

"Vim-Plug Auto-Install
if has('nvim')
    let plug_path = '~/.local/share/nvim/site/autoload/plug.vim'
else
    let plug_path = '~/.vim/autoload/plug.vim'
endif

if empty(glob(plug_path))
    "Requires curl installation
    execute "silent !curl -fLo " plug_path " --create-dirs "
                \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary' "Add comment with 'gcc' || 'gc<motion>'
Plug 'tpope/vim-surround' "Add 's' surround text object
"Plug 'tpope/vim-unimpaired' "Add '[' and ']' operations for pair mappings
Plug 'tpope/vim-repeat' "Add additional '.' operations
Plug 'tpope/vim-endwise' "Automatically adds end statements
Plug 'tpope/vim-speeddating' "<C-A> and <C-X> understand dates
Plug 'tpope/vim-vinegar' "<-> to open netrw

"Plug 'tpope/vim-fugitive' "Git integration
Plug 'tpope/vim-dispatch' "TODO: Asynchronous build/test commands

Plug 'junegunn/vim-easy-align' "Add 'EasyAlign' command
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'dense-analysis/ale'
let g:ale_fixers = {
            \   'python': ['black'],
            \   'c': ['clang-format'],
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'roxma/nvim-yarp' "Neovim to Vim Plugin Support
    Plug 'roxma/vim-hug-neovim-rpc' "Neovim to Vim Plugin Support
    Plug 'Shougo/deoplete.nvim'
endif

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Automatically install missing Vim-Plug plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
    autocmd VimEnter * PlugInstall --sync |q | source $MYVIMRC
endif

call plug#end()

filetype plugin indent on
syntax enable

set history=1024
set lazyredraw
set nosmartindent
set showcmd

"File Formats
set encoding=utf-8

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set fileformat=unix

"Python PEP format
"au BufNewFile,BufRead *.py set
"            \ tabstop=4
"            \ softtabstop=4
"            \ shiftwidth=4
"            \ textwidth=79
"            \ expandtab
"            \ autoindent
"            \ fileformat=unix

"au BufNewFile,BufRead *.c, *.cpp, *.h, *.hpp set
"            \ tabstop=2
"            \ softtabstop=2
"            \ shiftwidth=2
"            \ textwidth=80
"            \ expandtab
"            \ wrap
"            \ fileformat=unix

"Highlight closing symbol
set showmatch

"Line Numbers
set number
set relativenumber

"Highlight Selected Line
set cursorline

"Search
set incsearch
set hlsearch
set ignorecase
set smartcase

"Folding
set foldmethod=indent
set foldlevel=99
set foldcolumn=1

set mouse=a
set hidden
set wildmode=longest:full,full
set wildmenu

"Hide Binary or Generated Files
set wildignore+=*.swp " VIM
set wildignore+=*.exe,*.dll " Windows
set wildignore+=*.so " Linux
set wildignore+=*~ " Autosave
set wildignore+=*.o "C
set wildignore+=*.qdb,*.qpg,*.qtl,*_info,*_vmake "ModelSim
set wildignore+=*.dpc,*.wdf,*.lpr,*.vds,*.pb "Xilinx
set wildignore+=*__pycache__*,*.pyc " Python
set wildignore+=*.png " Image Files
set wildignore+=*.pdf " Image Files

nnoremap <Space> <Nop>
let mapleader="\<Space>"

nmap <Leader>c :pclose<CR>
nmap <Leader>v :source $MYVIMRC<CR>

"fzf.vim key mappings
nnoremap <C-P> :Files<CR>

"Format key mappings
nmap <Leader>f :ALEFix<CR>
nmap <Leader>h :ALEHover<CR>
nmap <Leader>h :ALEHover<CR>
nmap <Leader>h :ALEHover<CR>
nmap <Leader>d :ALEGoToDefinition<CR>
nmap <Leader>d :ALEGoToDefinition<CR>
nmap <Leader>dh :ALEGoToDefinitionInSplit<CR>
nmap <Leader>dv :ALEGoToDefinitionInVSplit<CR>
nmap <Leader>dt :ALEGoToTypeDefinition<CR>
nmap <Leader>dth :ALEGoToTypeDefinitionInSplit<CR>
nmap <Leader>dtv :ALEGoToTypeDefinitionInVSplit<CR>
nmap <Leader>r :ALEFindReferences<CR>

"netrw
let g:netrw_banner=0

"ALE
let g:ale_sign_error = '>'
let g:ale_sign_warning = '^'
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_code_actions_enabled = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_c_parse_compile_commands = 1

"Deoplete
let g:deoplete#enable_at_startup = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
