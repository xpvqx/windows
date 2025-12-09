set nocompatible
set number
set relativenumber
set noswapfile
set nowrap
set wildmenu
syntax on

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

set ignorecase
set smartcase
set nohlsearch
set incsearch

set laststatus=2
set encoding=utf-8
set wildmode=longest,list,full
set clipboard=unnamedplus

set termguicolors
set background=dark
colorscheme gruvbox

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_expand': {
      \   'filename': 'lightline#buffer#filename'
      \ },
      \ }

highlight Normal ctermbg=NONE guibg=NONE
highlight NormalNC ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight VertSplit ctermbg=NONE guibg=NONE
highlight StatusLine ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

let mapleader = " "

nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>o :update<CR>:source %<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
