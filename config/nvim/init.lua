vim.cmd([[set nocompatible
filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim', { 'branch': 'main' }
Plug 'navarasu/onedark.nvim',
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/coc-css', { 'do' : 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-html', { 'do' : 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-json', { 'do' : 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-tsserver', { 'do' : 'yarn install --frozen-lockfile' }
Plug 'clangd/coc-clangd', { 'do' : 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-rust-analyzer', { 'do' : 'yarn install --frozen-lockfile' }

Plug 'mattn/emmet-vim'
" Plug 'mhinz/vim-signify'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ap/vim-css-color'
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'Raimondi/delimitMate'
Plug 'rust-lang/rust.vim', {'ft': 'rust'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }
Plug 'jlanzarotta/bufexplorer'
call plug#end()


lua require('onedark').setup()
lua require('gitsigns').setup()


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
lua << EOF
require("nvim-tree").setup({
view = {
  side = "right"
  }
})
EOF

map <C-n> :NvimTreeToggle<CR>
" map <C-n> :NERDTreeToggle<CR>

" Plugins/Lightline
set noshowmode
set laststatus =2
set display =lastline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
          \ 'cocstatus': 'coc#status'
          \ },
      \ }

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
