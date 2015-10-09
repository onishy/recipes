set nocompatible

set number
set expandtab
set tabstop=4
set shiftwidth=4

set autoindent
set smarttab

set incsearch
set ignorecase
set hlsearch
set smartcase

colorscheme default
syntax on

nmap <C-q> <C-w><C-w><C-w>q
nmap <C-g> :Gtags -g
nmap <C-l> :Gtags -f %<CR>
nmap <C-j> :Gtags <C-r><C-w><CR>
nmap <C-k> :Gtags -r <C-r><C-w><CR>
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>
