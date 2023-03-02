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

require('config')
