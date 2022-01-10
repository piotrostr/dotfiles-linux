syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'tomlion/vim-solidity'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rakr/vim-one'
Plug 'leafgarland/typescript-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'morhetz/gruvbox'
Plug 'dag/vim-fish'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

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
"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
let g:python_host_prog = '/Users/piotrostrowski/miniconda/bin/python'
let g:python3_host_prog = '/Users/piotrostrowski/miniconda/bin/python3'

