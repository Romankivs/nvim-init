-- Native vim.pack plugin manager (Neovim 0.12+)
-- All plugins are installed into the 'opt' directory and loaded explicitly.

local gh = function(x) return 'https://github.com/' .. x end

-- ---------------------------------------------------------------------------
-- Install
-- ---------------------------------------------------------------------------
vim.pack.add({
  -- LSP
  gh('neovim/nvim-lspconfig'),
  gh('j-hui/fidget.nvim'),

  -- Fuzzy finding
  gh('ibhagwan/fzf-lua'),

  -- Treesitter
  gh('nvim-treesitter/nvim-treesitter'),

  -- File manager
  gh('stevearc/oil.nvim'),
  gh('nvim-mini/mini.icons'),

  -- Theme
  gh('ellisonleao/gruvbox.nvim'),

  -- Statusline
  gh('nvim-lualine/lualine.nvim'),

  -- Git
  gh('echasnovski/mini.diff'),

  -- Text operators
  gh('echasnovski/mini.operators'),

  -- Keybind hints
  gh('folke/which-key.nvim'),

  -- Word highlight
  gh('RRethy/vim-illuminate'),

  -- Indent detection
  gh('tpope/vim-sleuth'),
})

-- ---------------------------------------------------------------------------
-- Build hooks
-- ---------------------------------------------------------------------------
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      vim.cmd('TSUpdate')
    end
  end,
})

-- ---------------------------------------------------------------------------
-- Load all plugins
-- ---------------------------------------------------------------------------
local plugins = {
  'nvim-lspconfig', 'fidget.nvim',
  'fzf-lua',
  'nvim-treesitter',
  'oil.nvim', 'mini.icons',
  'gruvbox.nvim',
  'lualine.nvim',
  'mini.diff',
  'mini.operators',
  'which-key.nvim',
  'vim-illuminate',
  'vim-sleuth',
}

for _, name in ipairs(plugins) do
  vim.cmd.packadd(name)
end
