-- nvim-treesitter new API (no configs module)
local install = require('nvim-treesitter.install')

-- curl doesn't work for parser installs on some machines
install.prefer_git = true

require('nvim-treesitter').setup()

-- Ensure parsers are installed
install.install({
  'c', 'cpp', 'go', 'lua', 'python', 'rust',
  'tsx', 'javascript', 'typescript',
  'vimdoc', 'vim', 'bash', 'swift',
})
