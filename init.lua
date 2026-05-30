-- =============================================================================
-- Options & Keymaps
-- =============================================================================

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 200
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 0
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.completeopt = 'menuone,noselect,popup'
vim.o.autocomplete = true

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.diagnostic.config({ virtual_lines = false })

-- Highlight on yank
local yank_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = yank_group,
  pattern = '*',
})

-- =============================================================================
-- Plugins (vim.pack — Neovim 0.12+ native)
-- =============================================================================
require('config.pack')

-- =============================================================================
-- Plugin configuration
-- =============================================================================
require('plugins.gruvbox')
require('plugins.whichkey')
require('plugins.fzf')
require('plugins.lspconfig')
require('plugins.tree-sitter')
require('plugins.oil')
require('plugins.lualine')
require('plugins.mini-diff')
require('plugins.mini-operators')
-- vim-sleuth and vim-illuminate need no Lua setup — they work on load
