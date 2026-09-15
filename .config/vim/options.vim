" Line numbers
set number
set relativenumber

" Indentation and tabs
filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent

" Backspace behavior
set backspace=indent,eol,start

syntax on

" Reset guicursor so it doesn't fight terminal escape codes
set guicursor=

" Terminal escape sequences for cursor shapes
let &t_SI = "\<Esc>[5 q" " Insert mode: Steady vertical bar (|)
let &t_SR = "\<Esc>[4 q" " Replace mode: Underline (_)
let &t_EI = "\<Esc>[2 q" " Normal/Visual mode: Steady block (█)

" Ensure normal block cursor on startup and focus gain
let &t_ti .= "\<Esc>[2 q"

" clipboard
set clipboard=unnamedplus

" Fix for Wayland clipboard dropping yanks on Vim exit/fast yanks
if executable('wl-copy') && has('wayland')
    autocmd TextYankPost * call system('wl-copy', @")
endif

" Search
set ignorecase
set smartcase
set incsearch

" Split window behavior
set splitbelow
set splitright

" Keep cursor 8 lines from top/bottom
set scrolloff=8

set laststatus=2

set confirm
