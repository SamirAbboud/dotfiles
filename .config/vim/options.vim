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

" cursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20
if &term ==# 'xterm-kitty'
    let &t_EI = "\<Esc>[2 q"
    let &t_SI = "\<Esc>[6 q"
endif

" clipboard
set clipboard=unnamedplus

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
