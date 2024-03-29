local M = {}

M.setup = function()
  local keymap = vim.keymap.set

  local snr = {silent = true, noremap = true}

  local builtin = require('telescope.builtin')
  keymap('n', '<leader>ff', builtin.find_files, {})
  keymap('n', '<leader>fg', builtin.live_grep, {})
  keymap('n', '<leader>fb', builtin.buffers, {})
  keymap('n', '<leader>fh', builtin.help_tags, {})

  -- Buffer Navigation
  keymap('n', '<C-j>', '<C-W>j', {})
  keymap('n', '<C-k>', '<C-W>k', {})
  keymap('n', '<C-h>', '<C-W>h', {})
  keymap('n', '<C-l>', '<C-W>l', {})


  -- LSP

  --[[
  vim.api.nvim_create_autocmd("CursorHold", {
    callback = vim.lsp.buf.hover
  })
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" nmap <silent> <leader>rn <Plug>(coc-rename)
"
" xmap <silent> <leader>f <Plug>(coc-format-selected)
" nmap <silent> <leader>f <Plug>(coc-format)
"
" xmap <silent> <leader>a <Plug>(coc-codeaction-selected)
" nmap <silent> <leader>a <Plug>(coc-codeaction-cursor)
"
" nmap <silent> <leader>cl <Plug>(coc-codelens-action)
  --]]

  -- NvimTree
  keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })

  --[[
TODO: Find the appropriate functions in nvim-cmp to map these to.
" Plugins/coc.vim
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" 
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 
" nnoremap <silent> K :call ShowDocumentation()<CR>
" 
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1] =~# '\s'
" endfunction
" 
" function! ShowDocumentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('definitionHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction
" 
" " autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" 
  --]]
end

return M
