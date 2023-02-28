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

local function coc_deps(repo, ft)
  return {
    repo,
    build = 'yarn install --frozen-lockfile',
    ft = ft,
  }
end

require('lazy').setup({
  --'itchyny/lightline.vim',
  'nvim-lualine/lualine.nvim',
  'navarasu/onedark.nvim',

  --[[
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    opts = function()
      local cmp = require('cmp')
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        })
      }
    end
  },

  {
    'folke/neodev.nvim',
    config = true
  },
  ]]--
  {
    'neoclide/coc.nvim',  branch = 'release',
    dependencies = {
      coc_deps('neoclide/coc-css', "css"),
      coc_deps('neoclide/coc-html', "html"),
      coc_deps('neoclide/coc-json', "json"),
      coc_deps('neoclide/coc-tsserver', "js"),
      coc_deps('clangd/coc-clangd', "c++"),
      coc_deps('fannheyward/coc-rust-analyzer', "rust"),
      coc_deps('josa42/coc-lua', "lua"),
    }
  },
  --]]--

  'mattn/emmet-vim',
  {'lewis6991/gitsigns.nvim', dependencies = 'nvim-lua/plenary.nvim'},
  'ap/vim-css-color',
  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',
  'Raimondi/delimitMate',
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'jlanzarotta/bufexplorer',

})

require('onedark').setup()
require('gitsigns').setup()
--[[
require('mason').setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({})
  end
})
--]]
require('lualine').setup({
  options = {
    theme = 'onedark',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
})
require("nvim-tree").setup({
  view = {
    side = "right"
  }
})

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

" Keymaps
let mapleader = ' '

nnoremap <silent> <leader>c :nohl<CR><C-l>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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
map <C-n> :NvimTreeToggle<CR>
" map <C-n> :NERDTreeToggle<CR>

" Plugins/Lightline
set noshowmode
set laststatus =2
set display =lastline

" Plugins/coc.vim
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('definitionHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>rn <Plug>(coc-rename)

xmap <silent> <leader>f <Plug>(coc-format-selected)
nmap <silent> <leader>f <Plug>(coc-format)

xmap <silent> <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a <Plug>(coc-codeaction-cursor)

nmap <silent> <leader>cl <Plug>(coc-codelens-action)

" Plugins/delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Plugins/NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "right"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

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
