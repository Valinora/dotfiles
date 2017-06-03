set nocompatible
filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
call plug#end()



" Appearance
set termguicolors
set background=dark
let g:onedark_terminal_italics = 1
color onedark

set ttyfast
set lazyredraw

set cursorline
set number

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

nnoremap <silent> <C-l> :nohl<CR><C-l>
map <C-n> :NERDTreeToggle<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Files
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
set backspace =indent,eol,start
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   execute "normal! g`\"" |
      \ endif

" Plugins
" Plugins/Lightline
set noshowmode
set laststatus =2
set display =lastline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'separator': { 'left': '', 'right': '' },
      \ }

" Plugins/Deoplete
let g:deoplete#enable_at_startup = 1

" Plugins/NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "right"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Plugins/Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Searching
set wrapscan

" Tabbing
set autoindent
set expandtab
set softtabstop =2
set shiftwidth =2
set shiftround
