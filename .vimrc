syntax on
set nocompatible
filetype off

cal plug#begin('~/.vim/plugged')

Plug 'tomlion/vim-solidity'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts'
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'glepnir/lspsaga.nvim'

call plug#end()

filetype plugin indent on

set shiftwidth=2
set autoindent
set smartindent
set smarttab
set expandtab
set number
set hlsearch
set ruler
set autoindent
highlight Comment ctermfg=green
filetype plugin indent on
autocmd vimenter * ++nested colorscheme gruvbox 
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
let g:python_host_prog = '/Users/piotrostrowski/miniconda/bin/python'
let g:python3_host_prog = '/Users/piotrostrowski/miniconda/bin/python3'

