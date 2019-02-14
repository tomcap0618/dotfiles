"Pathogen
let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'ctrlp')
"call add(g:pathogen_disabled, 'hardmode')
"call add(g:pathogen_disabled, 'nerdtree')
"call add(g:pathogen_disabled, 'supertab')
"call add(g:pathogen_disabled, 'tabular')
"call add(g:pathogen_disabled, 'tlib_vim')
"call add(g:pathogen_disabled, 'vim-addon-mw-utils')
"call add(g:pathogen_disabled, 'vim-airline-themes')
"call add(g:pathogen_disabled, 'vim-airline')
"call add(g:pathogen_disabled, 'vim-colors-solarized')
"call add(g:pathogen_disabled, 'vim-repeat')
"call add(g:pathogen_disabled, 'vim-sensible')
"call add(g:pathogen_disabled, 'vim-snipmate')
"call add(g:pathogen_disabled, 'vim-snippets')
"call add(g:pathogen_disabled, 'vim-surround')
call pathogen#infect()
call pathogen#helptags()

"Turn Off Bell
set visualbell
set t_vb=

syntax on
filetype plugin indent on

"Escape Insert Mode
imap jj <ESC>
imap JJ <ESC>
imap jk <ESC>
imap JK <ESC>
imap KJ <ESC>
imap kj <ESC>

"Tab Navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"File Formats
set encoding=utf-8
set fileformat=unix


set history=5000

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nosmartindent

"Hybrid Line Numbers
set number relativenumber
set nu rnu

"Absolute Line Numbers
"set number
"set nu

"Highlight Selected Line
set cursorline

set lazyredraw
set showmatch
set incsearch
set hlsearch

"Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set foldcolumn=1
set foldlevelstart=10
nnoremap <space> za

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

set showcmd
set hlsearch
set ignorecase
set smartcase

set nostartofline

"NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeRespectWildIgnore=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeWinSize=70

"netrw
let g:netrw_banner=0

"Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_solarized_bg='light'

"Hardmode
let g:HardMode_level = 'wannabe' "If set, disables arrow keys.
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

"Colorscheme
let g:solarized_termcolors=256
colorscheme solarized

"GVIM
if has("gui_running")
	set lines=80 columns=120
    set background=light
else
    set background=dark
endif

"Windows
if has('win32')
	set guifont=Consolas:h11:cANSI
"*NIX
else
endif
