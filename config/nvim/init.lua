vim.g.mapleader = ' '

local silentnoremap = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>c', ':nohl<cr>', silentnoremap)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(require('plugins'))

local lsp = require('lsp-zero').preset({
  name = 'recommended',
})
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
lsp.setup()

require('mason-null-ls').setup_handlers()

require('mappings').setup()

vim.cmd([[set nocompatible
filetype plugin indent on

" Performance
set updatetime=300

" Appearance
set termguicolors
set background=dark
let g:onedark_terminal_italics = 1
colorscheme onedark

set ttyfast
set lazyredraw

set cursorline
set number
set so=10 " Keep N lines visible in window
set colorcolumn=80
set showmatch
set nowrap

set signcolumn=yes

set wildmenu

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

syntax on

" Buffers / Windowing
set splitbelow
set splitright
set hidden

" Files
set autoread

set backup
set backupdir =$HOME/.config/nvim/files/backup/
set backupext =-vimback
set backupskip =
set directory =$HOME/.config/nvim/files/swap//
set updatecount =100
set undofile
set undodir =$HOME/.config/nvim/files/undo/
set viminfo ='100,n$HOME/.config/nvim/files/info/nviminfo " Unkown sourcery.

" Misc
set mouse=n
set backspace =indent,eol,start
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   execute "normal! g`\"" |
      \ endif

" Plugins
" Plugins/NvimTree
" map <C-n> :NERDTreeToggle<CR>

" Plugins/Lightline
set noshowmode
set laststatus =2
set display =lastline


" Plugins/delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Plugins/NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Searching
set wrapscan

" Tabbing
set autoindent
set smarttab
set expandtab
set softtabstop =2
set shiftwidth =2
set shiftround
]])
