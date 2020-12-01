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
Plug 'tpope/vim-unimpaired' "Add '[' and ']' operations for pair mappings
Plug 'tpope/vim-repeat' "Add additional '.' operations
Plug 'tpope/vim-endwise' "Automatically adds end statements
Plug 'tpope/vim-speeddating' "<C-A> and <C-X> understand dates
Plug 'tpope/vim-vinegar'

"Plug 'tpope/vim-fugitive' "Git integration
Plug 'tpope/vim-dispatch' "TODO: Asynchronous build/test commands

Plug 'junegunn/vim-easy-align' "Add 'EasyAlign' command
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"fzf.vim key mappings
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

Plug 'dense-analysis/ale'
let g:ale_sign_error = '>'
let g:ale_sign_warning = '^'
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_code_actions_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_linters = {
            \   'cpp': ['clangtidy'],
            \   'c': ['clangtidy'],
            \}
let g:ale_cpp_clangtidy_checks = []
let g:ale_cpp_clangtidy_executable = 'clang-tidy'
let g:ale_cpp_clangtidy_options = ''
let g:ale_cpp_clangtidy_extra_options = ''
let g:ale_c_parse_compile_commands = 1
" Use newer clang versions where available.
" if executable('clang-6.0')
"     let g:ale_c_clang_executable = 'clang-6.0'
"     let g:ale_cpp_clang_executable = 'clang-6.0'
" endif
" if executable('clangd-6.0')
"     let g:ale_c_clangd_executable = 'clangd-6.0'
"     let g:ale_cpp_clangd_executable = 'clangd-6.0'
" endif
" if executable('clangd-8')
"     let g:ale_c_clangd_executable = 'clangd-8'
"     let g:ale_cpp_clangd_executable = 'clangd-8'
" endif

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'roxma/nvim-yarp' "Neovim to Vim Plugin Support
  Plug 'roxma/vim-hug-neovim-rpc' "Neovim to Vim Plugin Support
  Plug 'Shougo/deoplete.nvim'
endif
let g:deoplete#enable_at_startup = 1
"Tab Forward Cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"Tab Backward Cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Automatically install missing Vim-Plug plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
    autocmd VimEnter * PlugInstall --sync |q | source $MYVIMRC
endif

call plug#end()

filetype plugin indent on
syntax enable

"netrw
let g:netrw_banner=0

let mapleader="\<Space>"
"jk to escape
inoremap jk <ESC> "jk to escape

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
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufNewFile,BufRead *.c, *.cpp, *.h, *.hpp set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ textwidth=80
    \ expandtab
    \ wrap
    \ fileformat=unix

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

