"plugins
call plug#begin('~/.vim/plugged')

Plug 'rakr/vim-one'
Plug 'leafgarland/typescript-vim'
Plug 'morhetz/gruvbox'
Plug 'dag/vim-fish'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/popup.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'dylanaraps/wal.vim'
Plug 'morhetz/gruvbox'
Plug 'sohkai/syntastic-local-solhint'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mfussenegger/nvim-dap'
Plug 'aserowy/tmux.nvim'
Plug 'puremourning/vimspector'
Plug 'TovarishFin/vim-solidity'
Plug 'Pocco81/AutoSave.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'fladson/vim-kitty'
Plug 'navarasu/onedark.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'kevinhwang91/rnvimr'
Plug 'numToStr/Comment.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }

call plug#end()
