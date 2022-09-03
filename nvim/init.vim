set runtimepath^=~/.vim runtimepath+=~/.vim/after
runtime ./plug.vim

nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

syntax on
filetype plugin indent on

let &packpath=&runtimepath
let g:dashboard_default_executive ='telescope'
let g:onedark_config = { 'style': 'deep' }
let g:tokyonight_style = 'night'
let g:tokyonight_transparent = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 0
let g:coc_snippet_next = '<tab>'
let g:gruvbox_italic = 1
let g:gruvbox_bold = 1
let g:gruvbox_transparent_bg = 1
let g:airline_theme = 'minimalist'
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-node-debug2' ]


if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set colorcolumn=80
set updatetime=300
set hidden
set encoding=utf-8
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set expandtab
set hlsearch
set ruler
set autoindent
set number relativenumber
set guicursor=i:block
set foldmethod=manual

"colorschemes
if ($DAYTIME == 'day')
  set background=light
  let g:onedark_config = {'style': 'light'}
else
  let g:onedark_config = {'style': 'darker'}
  set background=dark
endif

autocmd! BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
autocmd! BufWritePost ~/.config/nvim/plug.vim source ~/.config/nvim/plug.vim


colorscheme gruvbox
"let g:airline_theme = 'gruvbox'
"colorscheme onedark
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight Comment    ctermfg=green

"remap leader to space
nmap <space> <Leader>

"navigate without control w, just control
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"next buffer using ctrl+n
nmap <silent> <c-n> :bn<CR>

"previous buffer using ctrl+p
nmap <silent> <c-p> :bp<CR>

" ranger conf
" command! Ex :RangerEdit
" command! Vex :RangerVSplit
" command! Sex :RangerSplit

" map <leader>rr :RangerEdit<cr>
" map <leader>rv :RangerVSplit<cr>
" map <leader>rs :rangersplit<cr>
" map <leader>rt :RangerTab<cr>

"save and load sessions
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

"coc setup
nmap gs <Plug>(coc-git-chunkinfo)
nmap gk <Plug>(coc-git-commit)
nmap <silent> gu <cmd>CocCommand git.chunkUndo<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <silent><leader>a  <Plug>(coc-codeaction)
nnoremap <silent><leader>d  :<C-u>CocList diagnostics<cr>
nmap <silent><leader>f <Plug>(coc-fix-current)

"TODO fix
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"debugger keybindings
nmap <silent> do <Plug>VimspectorContinue
nmap <silent> dr <Plug>VimspectorReset
nmap <silent> dq <Plug>VimspectorStop
nmap <silent> ds <Plug>VimspectorBalloonEval
xmap <silent> ds <Plug>VimspectorBalloonEval
nmap <silent> dO <Plug>VimspectorStepOver
nmap <silent> di <Plug>VimspectorStepInto
nmap <silent> dI <Plug>VimspectorStepOut
nmap <silent> df <Plug>VimspectorUpFrame
nmap <silent> dF <Plug>VimspectorDownFrame
nmap <silent> dp <Plug>VimspectorToggleBreakpoint

"set up telescope bindings
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

"remove buffer from tabline if its closed
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

autocmd FileType go call Go_settings()

function! Go_settings()
  setlocal tabstop=8
  setlocal shiftwidth=8
  setlocal expandtab
endfunction

lua << EOF

--setup comment
require('Comment').setup()

--telescope setup
local actions = require('telescope.actions')
require'telescope'.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    file_ignore_patterns = { "node%_modules/.*" }
  },
}

--difftool setup
local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = true,         -- Requires nvim-web-devicons
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  default_args = {    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},         -- See ':h diffview-config-hooks'
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]      = cb("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"]    = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["gf"]         = cb("goto_file"),          -- Open the file in a new split in previous tabpage
      ["<C-w><C-f>"] = cb("goto_file_split"),    -- Open the file in a new split
      ["<C-w>gf"]    = cb("goto_file_tab"),      -- Open the file in a new tabpage
      ["<leader>e"]  = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"]  = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),           -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),           -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),         -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"),   -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),            -- Stage all entries.
      ["U"]             = cb("unstage_all"),          -- Unstage all entries.
      ["X"]             = cb("restore_entry"),        -- Restore entry to the state on the left side.
      ["R"]             = cb("refresh_files"),        -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["gf"]            = cb("goto_file"),
      ["<C-w><C-f>"]    = cb("goto_file_split"),
      ["<C-w>gf"]       = cb("goto_file_tab"),
      ["i"]             = cb("listing_style"),        -- Toggle between 'list' and 'tree' views
      ["f"]             = cb("toggle_flatten_dirs"),  -- Flatten empty subdirectories in tree listing style.
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    },
    file_history_panel = {
      ["g!"]            = cb("options"),            -- Open the option panel
      ["<C-A-d>"]       = cb("open_in_diffview"),   -- Open the entry under the cursor in a diffview
      ["y"]             = cb("copy_hash"),          -- Copy the commit hash of the entry under the cursor
      ["zR"]            = cb("open_all_folds"),
      ["zM"]            = cb("close_all_folds"),
      ["j"]             = cb("next_entry"),
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["gf"]            = cb("goto_file"),
      ["<C-w><C-f>"]    = cb("goto_file_split"),
      ["<C-w>gf"]       = cb("goto_file_tab"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    },
    option_panel = {
      ["<tab>"] = cb("select"),
      ["q"]     = cb("close"),
    },
  },
}

--treesitter setup
--require'nvim-treesitter.install'.compilers = { 'aarch64-apple-darwin21-gcc-11' }
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "tsx",
    "json",
    "html",
    "typescript",
    "lua",
    "go",
    "python"
  },
  highlight = {
    enable = true,
    disable = {"python"},
  },
  indent = {
    enable = false,
    disable = {},
  },
  autotag = {
    enable = true,
    filetypes = {
      "javascript.jsx",
      "typescript.tsx",
      "html",
      "javascriptreact",
      "javascript",
      "typescript",
      "typescriptreact",
    },
  }
}

require "nvim-treesitter.parsers".get_parser_configs().solidity = {
  install_info = {
    url = "https://github.com/JoranHonig/tree-sitter-solidity",
    files = {"src/parser.c"},
    requires_generate_from_grammar = true,
  },
  filetype = 'solidity'
}

-- tmux bindings
require'tmux'.setup{
    copy_sync = {
        enable = false,
        ignore_buffers = { empty = false },
        redirect_to_clipboard = true,
        register_offset = 0,
        sync_clipboard = true,
        sync_deletes = true,
        sync_unnamed = true,
    },
    navigation = {
        cycle_navigation = true,
        enable_default_keybindings = true,
        persist_zoom = false,
    }
}

require'autosave'.setup{
  enabled = false,
  execution_message = function ()
    return "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S")
  end,
  events = {"InsertLeave", "TextChanged"},
  conditions = {
          exists = true,
          filename_is_not = {},
          filetype_is_not = {},
          modifiable = true,
  },
  write_all_buffers = false,
  on_off_commands = false,
  clean_command_line_interval = 0,
  debounce_delay = 135
}

require'colorizer'.setup()

EOF
