set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set syntax=on
set relativenumber
set ruler

filetype plugin indent on
let mapleader = " "

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" make C-c act like esc for stuff like :normal I
inoremap <C-c> <esc>
