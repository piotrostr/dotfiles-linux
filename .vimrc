syntax on

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomlion/vim-solidity'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'morhetz/gruvbox'
Plugin 'leafgarland/typescript-vim'

call vundle#end()
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

